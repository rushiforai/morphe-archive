package app.morphed.extension.twitch.unlock;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.Included;
import app.morphed.extension.twitch.Messages;
import app.morphed.extension.twitch.hls.UrlKey;
import app.morphed.extension.twitch.net.Web;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.settings.PatchSettings;
import app.morphed.extension.twitch.vpn.VpnTunnel;
import app.morphed.extension.twitch.vpn.WgConfig;

/**
 * The quality unlock, the way Mor Assistant does it: Twitch offers Enhanced Broadcasting's higher qualities (1440p) only to
 * logged-in viewers in some countries who can play HEVC. When a stream starts, its playlist is also asked for
 * through the user's WireGuard VPN; when that one offers more, the player gets it, and that stream's video then
 * comes through the same tunnel. Nothing else in the app goes through it.
 * <p>
 * Each stream is decided once, on its first playlist request: when nothing is locked, later requests for it (the
 * ad blocker's reloads, the mini player, picture in picture) go straight on; an unlocked stream keeps getting its
 * playlist through the VPN. A server that didn't answer is left alone for a while, so streams don't each wait for
 * it. An idle tunnel is closed.
 */
public final class QualityUnlock {
    static final int TUNNEL_TIMEOUT_MS = 5_000;
    static final int WAIT_MS = 8_000; // the longest a stream's start waits for the unlock, everything included
    static final long FAILED_SERVERS_REST_MS = 3 * 60_000; // no server answered: streams start direct this long
    static final long IDLE_CLOSE_MS = 5 * 60_000; // a tunnel nothing went through this long is closed
    private static final Pattern CHANNEL = Pattern.compile("/api/v2/channel/hls/([^/.?]+)\\.m3u8|/api/channel/hls/([^/.?]+)\\.m3u8");

    static final String ADD_SERVER = "Add a VPN server in Settings, Patch settings";

    /** What the unlock did for the stream being watched, for the player's Options. */
    public static final class Status {
        public final String text; // null: nothing to say (off, or on and waiting for a stream)
        public final boolean problem;

        Status(String text, boolean problem) {
            this.text = text;
            this.problem = problem;
        }
    }

    /** The status while no stream was decided yet: the one thing missing, or nothing. */
    static Status idle() {
        boolean none = servers().names().isEmpty();
        return new Status(none ? ADD_SERVER : null, none);
    }

    public interface StatusListener {
        void changed(Status status);
    }

    /** Each stream's decision: true when it plays through the VPN. */
    private static final Map<String, Boolean> DECIDED = new ConcurrentHashMap<>();
    private static final Set<String> TUNNEL_ADDRESSES = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final CopyOnWriteArrayList<StatusListener> LISTENERS = new CopyOnWriteArrayList<>();
    private static final UnlockFetcher FETCHER = new UnlockFetcher();
    private static final Object TUNNEL_LOCK = new Object(); // only swaps the reference: no I/O under it
    private static final Object MASTER_LOCK = new Object(); // one stream decided at a time
    private static final ScheduledExecutorService BACKGROUND = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread thread = new Thread(r, "TwitchMorphed-unlock");
        thread.setDaemon(true);
        return thread;
    });
    private static volatile VpnTunnel tunnel;
    private static volatile String lastChannel;
    private static volatile long lastUsedAt;
    private static volatile long serversFailedAt;
    private static volatile String serversFailure;
    private static volatile Status status = new Status(null, false);
    private static volatile VpnServers servers;

    static {
        PatchSettings.addListener((key, on) -> {
            if (!PatchSettings.QUALITY_UNLOCK.equals(key)) return;
            if (!on) {
                DECIDED.clear();
                TUNNEL_ADDRESSES.clear();
                BACKGROUND.execute(QualityUnlock::closeTunnel); // (closing sends packets: never on the main thread)
                publish(new Status(null, false));
            } else {
                serversFailedAt = 0;
                publish(idle());
            }
        });
        BACKGROUND.scheduleWithFixedDelay(QualityUnlock::tidy, 1, 1, TimeUnit.MINUTES);
    }

    private QualityUnlock() {
    }

    public static VpnServers servers() {
        VpnServers kept = servers;
        if (kept != null) return kept;
        Context context = App.application();
        File folder = context == null ? new File("vpn") : new File(context.getFilesDir(), "vpn");
        VpnServers made = new VpnServers(folder);
        if (context != null) servers = made; // one instance: its locks keep adds and reads apart
        return made;
    }

    public static Status status() {
        return status;
    }

    public static void addListener(StatusListener listener) {
        LISTENERS.add(listener);
    }

    public static void removeListener(StatusListener listener) {
        LISTENERS.remove(listener);
    }

    private static void publish(Status next) {
        status = next;
        DebugLog.log("Quality unlock: " + next.text);
        App.onMain(() -> {
            for (StatusListener listener : LISTENERS) listener.changed(next);
        });
    }

    /** The channel of a live usher playlist request, or null. */
    public static String channelOf(String url) {
        if (url == null || !url.contains("usher.ttvnw.net")) return null;
        Matcher matcher = CHANNEL.matcher(url);
        if (!matcher.find()) return null;
        String channel = matcher.group(1) != null ? matcher.group(1) : matcher.group(2);
        return channel.toLowerCase(Locale.ROOT);
    }

    /**
     * Whether a request should go through the tunnel: exactly the playlists and video pieces of the stream that
     * was unlocked (named by its playlists from the tunnel); nothing else, previews included.
     */
    public static boolean routes(String url) {
        if (TUNNEL_ADDRESSES.isEmpty() || !Included.qualityUnlock() || !PatchSettings.qualityUnlock()
                || url.contains("usher.ttvnw.net")) return false;
        return TUNNEL_ADDRESSES.contains(UrlKey.of(url));
    }

    /** Whether this address is one of the unlocked stream's (for tests: routes() also asks the switches). */
    static boolean knows(String url) {
        return TUNNEL_ADDRESSES.contains(UrlKey.of(url));
    }

    /** The tunnel's HTTP client for routed requests, or null when the tunnel is down. */
    public static Web tunnelWeb() {
        VpnTunnel current = tunnel;
        // Open is enough: keys that expired while the stream was paused are renewed by the next send.
        if (current == null || !current.isOpen()) return null;
        lastUsedAt = System.currentTimeMillis();
        return current.web();
    }

    /** The tunnel failed a routed request: the stream goes on over the normal connection, and that is told. */
    public static void tunnelFailed(String why) {
        if (!status.problem) publish(new Status("The VPN stopped answering, the stream plays without the unlock", true));
        DebugLog.log("Quality unlock: the VPN failed a request: " + why);
    }

    private static final Pattern ADDRESS = Pattern.compile("https?://[^\\s\"]+");
    private static final int MAX_ADDRESSES = 4000;

    /** The addresses a playlist from the tunnel names (playlists, video pieces): they go through the tunnel too. */
    public static void learnAddresses(String playlist) {
        if (TUNNEL_ADDRESSES.size() > MAX_ADDRESSES) TUNNEL_ADDRESSES.clear(); // old pieces; the current ones come again
        Matcher address = ADDRESS.matcher(playlist);
        while (address.find()) {
            String url = address.group();
            if (!url.contains("usher.")) TUNNEL_ADDRESSES.add(UrlKey.of(url));
        }
    }

    /**
     * A stream's master playlist came in over the normal connection: the playlist to give the player (the one
     * through the VPN when it offers more), or the same one. Never throws: the stream must play either way.
     */
    public static String master(String usherUrl, String direct, boolean preview) {
        String channel = channelOf(usherUrl);
        if (channel == null || preview || !Included.qualityUnlock() || !PatchSettings.qualityUnlock()) return direct;
        synchronized (MASTER_LOCK) {
            try {
                return decide(channel, direct);
            } catch (Throwable t) {
                DebugLog.log("Quality unlock: error: " + android.util.Log.getStackTraceString(t));
                publish(new Status("The quality unlock ran into an error: " + Messages.of(t), true));
                return direct;
            }
        }
    }

    private static String decide(String channel, String direct) {
        if (!channel.equals(lastChannel)) { // a new stream: the previous one's routing is done with
            lastChannel = channel;
            TUNNEL_ADDRESSES.clear();
            for (String decided : new ArrayList<>(DECIDED.keySet())) if (!decided.equals(channel)) DECIDED.remove(decided);
        }
        Boolean decision = DECIDED.get(channel);
        if (decision != null && !decision) return direct;
        long now = System.currentTimeMillis();
        if (decision == null && now - serversFailedAt < FAILED_SERVERS_REST_MS) {
            DECIDED.put(channel, false);
            publish(new Status(serversFailure + ". Trying again in a few minutes", true));
            return direct;
        }
        String token = TwitchLogin.token();
        if (token == null) {
            publish(new Status("Log in to Twitch to unlock higher qualities", true));
            return direct;
        }
        List<String> problems = new ArrayList<>();
        List<WgConfig> configs = servers().configs(problems);
        if (configs.isEmpty()) {
            publish(new Status(problems.isEmpty() ? ADD_SERVER : "No usable VPN server: " + problems.get(0), true));
            return direct;
        }
        long deadline = now + WAIT_MS;
        UnlockFetcher.Result result = null;
        String failure = null;
        boolean anyAnswered = false;
        for (WgConfig config : ordered(configs)) {
            int left = (int) (deadline - System.currentTimeMillis());
            if (left < 1500) break;
            VpnTunnel up;
            try {
                up = ensureTunnel(config, Math.min(TUNNEL_TIMEOUT_MS, left));
            } catch (Exception e) { // the server's own reason (keys refused, name not found, no answer)
                if (failure == null) failure = "Couldn't connect to " + config.name + ": " + Messages.of(e);
                continue;
            }
            anyAnswered = true;
            try {
                result = FETCHER.fetch(up.web(), channel, token, (int) Math.max(500, deadline - System.currentTimeMillis()));
                break;
            } catch (UnlockFetcher.Failed failed) {
                if (failed.login) { // the login, not the server: no point trying the others
                    DebugLog.log("Quality unlock: Twitch refused the login: " + failed.getMessage());
                    failure = "Twitch didn't accept your login, log out and in again";
                    break;
                }
                failure = failed.getMessage();
            }
        }
        if (result == null) {
            DECIDED.put(channel, false);
            String why = failure != null ? failure : "No VPN server answered in time";
            if (!anyAnswered) { // no server came up: the next streams start at once instead of waiting again
                serversFailedAt = System.currentTimeMillis();
                serversFailure = why;
            }
            publish(new Status(why, true));
            return direct;
        }
        lastUsedAt = System.currentTimeMillis();
        List<String> extra = UnlockFetcher.unlockedOnly(UnlockFetcher.qualities(direct), result.qualities);
        if (extra.isEmpty()) {
            DECIDED.put(channel, false);
            publish(new Status(channel + "'s stream has no higher quality to unlock", false));
            return direct;
        }
        VpnTunnel current = tunnel;
        DECIDED.put(channel, true);
        learnAddresses(result.master);
        publish(new Status("Unlocked " + String.join(", ", extra)
                + (current != null ? " through " + current.config.name : ""), false));
        return result.master;
    }

    /** The server that's up first (no reconnect), then the rest in name order. */
    private static List<WgConfig> ordered(List<WgConfig> configs) {
        VpnTunnel current = tunnel;
        List<WgConfig> out = new ArrayList<>();
        if (current != null && current.isUp()) {
            for (WgConfig config : configs) if (config.name.equals(current.config.name)) out.add(config);
        }
        for (WgConfig config : configs) if (!out.contains(config)) out.add(config);
        return out;
    }

    /** The tunnel to this server, connected when needed (outside any lock: it takes seconds); why not, if not. */
    private static VpnTunnel ensureTunnel(WgConfig config, int timeoutMs) throws Exception {
        VpnTunnel current = tunnel;
        if (current != null && current.isUp() && current.config.name.equals(config.name)) return current;
        closeTunnel();
        try {
            VpnTunnel opened = VpnTunnel.open(config, timeoutMs);
            synchronized (TUNNEL_LOCK) {
                tunnel = opened;
            }
            DebugLog.log("Quality unlock: tunnel up through " + config.name);
            return opened;
        } catch (Exception e) {
            DebugLog.log("Quality unlock: " + config.name + " failed: " + e.getMessage());
            throw e;
        }
    }

    /**
     * The tunnel to this server, if it's the one up, is taken out of use at once (no stream can pick it up again
     * in the meantime) and closed in the background; its streams are decided afresh.
     */
    private static void dropTunnel(String name) {
        VpnTunnel closing = null;
        synchronized (TUNNEL_LOCK) {
            if (tunnel != null && tunnel.config.name.equals(name)) {
                closing = tunnel;
                tunnel = null;
            }
        }
        if (closing == null) return;
        TUNNEL_ADDRESSES.clear();
        DECIDED.clear();
        VpnTunnel old = closing;
        BACKGROUND.execute(old::close);
    }

    private static void closeTunnel() {
        VpnTunnel closing;
        synchronized (TUNNEL_LOCK) {
            closing = tunnel;
            tunnel = null;
        }
        if (closing != null) closing.close();
    }

    /** Every minute: kept connections idle too long are dropped, and a tunnel nothing used for a while closed. */
    private static void tidy() {
        try {
            VpnTunnel current = tunnel;
            if (current == null) return;
            if (System.currentTimeMillis() - lastUsedAt >= IDLE_CLOSE_MS) {
                DebugLog.log("Quality unlock: tunnel idle, closed");
                closeTunnel();
                TUNNEL_ADDRESSES.clear();
                // Only the streams that went through it are decided again; "nothing locked" stays decided.
                DECIDED.values().removeIf(viaVpn -> viaVpn);
            } else {
                current.tidy();
            }
        } catch (Throwable t) {
            DebugLog.log("Quality unlock: tidying failed: " + t);
        }
    }

    /**
     * A server was added (or replaced): the unlock is switched on the first time there is one, a rest after
     * failures ends, and a tunnel up with the old keys of a replaced one is closed.
     */
    public static void serverAdded(String name) {
        serversFailedAt = 0;
        dropTunnel(name);
        // (a stream decided already keeps its line, "Unlocked 1440p" stays true)
        if (ADD_SERVER.equals(status.text) || (DECIDED.isEmpty() && !status.problem)) publish(idle());
        Context context = App.application();
        if (context == null) return;
        SharedPreferences preferences = PatchSettings.preferences(context);
        if (!preferences.contains(PatchSettings.QUALITY_UNLOCK)) PatchSettings.set(PatchSettings.QUALITY_UNLOCK, true);
    }

    /** A server was removed: its tunnel, if it's the one up, is closed. */
    public static void serverRemoved(String name) {
        dropTunnel(name);
        if (servers().names().isEmpty()) publish(idle()); // the last one gone: say what's missing
    }
}
