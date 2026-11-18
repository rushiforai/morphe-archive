/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import androidx.annotation.Nullable;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.DiagnosticCategory;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.LongSetting;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.EnumMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * V2Ray-style servers (#71): Telegram connects through the person's own VMess, VLESS, Trojan and
 * Shadowsocks servers. Telegram can't speak those, so while the switch is on a SOCKS5 proxy runs
 * inside Telegram, on 127.0.0.1 only ({@link V2RayServer}), and one entry for it goes in Telegram's
 * own proxy list. Each connection Telegram makes through that entry goes on to the fastest server
 * that answers, or the one the person picked.
 *
 * <p>The servers come from links pasted on the settings page and from the person's own proxy lists,
 * which Free proxies reads too. Each is timed by asking a Telegram server through it for the first
 * step of a sign-in handshake, which every Telegram server answers, so a server that answers can
 * carry Telegram. The links hold passwords and ids, so none of them goes in the log or in a settings
 * file, and nothing here touches the person's other proxies.
 */
public final class V2RayProxies {
    /**
     * How long after a Telegram start its proxy list is changed, so Telegram has set up its
     * connections first. A test sets 0.
     */
    static volatile long startDelayMs = 3000L;
    /** How many servers one test times. Pasted ones come first. */
    static final int MAX_TIMED = 60;
    static final int PROBE_THREADS = 8;
    static final int PROBE_MS = 8000;
    static final long PROBE_BUDGET_MS = 25_000L;
    /** How many links can be pasted. */
    public static final int MAX_PASTED = 100;
    /** The local proxy's port is picked from these, below the range Android hands out for outgoing connections. */
    static final int PORT_FROM = 20_000;
    static final int PORT_COUNT = 12_000;

    /** Telegram's DC 2, which the timing asks. A test sets a server of its own. */
    static volatile V2RayTunnels.Target dc =
            new V2RayTunnels.Target(V2RayTunnels.Target.IPV4, new byte[]{(byte) 149, (byte) 154, (byte) 167, 51}, 443);

    /**
     * What's kept between starts. All of it is HushTelegram's own state: it keeps its value while
     * paused and never goes in a settings file, since the links and the proxy's password are secrets.
     */
    static final class Stored {
        /** The links pasted on the settings page, one a line. */
        static final StringSetting LINKS = new StringSetting("hushtelegram_v2ray_links", "", false, false);
        /** The local proxy: its port, user name and password, separated by spaces. */
        static final StringSetting LOCAL = new StringSetting("hushtelegram_v2ray_local", "", false, false);
        /** The tg://socks link of the entry this put in Telegram's list, empty when there's none. */
        static final StringSetting ENTRY = new StringSetting("hushtelegram_v2ray_entry", "", false, false);
        /** Set when a pause took the entry out while Telegram used it, so the next start uses it again. */
        static final BooleanSetting RESUME = new BooleanSetting("hushtelegram_v2ray_resume", false, false, false);
        /** The id of the server the person picked, empty for the fastest that answers. */
        static final StringSetting PICK = new StringSetting("hushtelegram_v2ray_pick", "", false, false);
        /** The servers that answered the last test, fastest first: how long it took, a tab, the link. */
        static final StringSetting FOUND = new StringSetting("hushtelegram_v2ray_found", "", false, false);
        /** The last test in counts: answered, timed, found, unreadable, then the skipped kinds by name. */
        static final StringSetting RESULT = new StringSetting("hushtelegram_v2ray_result", "", false, false);
        static final LongSetting TRIED_AT = new LongSetting("hushtelegram_v2ray_tried_at", 0L, false, false);

        static {
            Setting.keepWhenPaused(LINKS, LOCAL, ENTRY, RESUME, PICK, FOUND, RESULT, TRIED_AT);
        }

        private Stored() {
        }
    }

    /** Telegram's proxy list, by link. A test sets its own. Called on the main thread. */
    interface Store {
        boolean saved(String link);

        /** Puts the proxy [link] names in the list. False when Telegram can't read the link. */
        boolean add(String link);

        /** Whether Use proxy is on and there's a proxy to use. */
        boolean inUse();

        boolean current(String link);

        /** Connects through the saved proxy [link] names. */
        boolean use(String link);

        /** Takes the proxy [link] names out of the list, the current one too: Telegram then goes without a proxy. */
        void remove(String link);
    }

    /** Times one server: how long Telegram's server took to answer through it, in milliseconds. A test sets its own. */
    interface Prober {
        long ms(V2RayLinks.Server server) throws IOException;
    }

    /** Told on the main thread when a test has ended or the local proxy started or stopped. */
    public interface Listener {
        void v2rayProxiesChanged();
    }

    /** One server for the picker. */
    public static final class Choice {
        public final String id;
        public final String name;
        /** How long it took to answer, or 0 when it didn't answer the last test. */
        public final long ms;
        /** Its place in the picker, from 1, which names a server whose link has no name. */
        final int number;

        Choice(String id, String name, long ms, int number) {
            this.id = id;
            this.name = name;
            this.ms = ms;
            this.number = number;
        }
    }

    static volatile Store store = new TelegramStore();
    static volatile Prober prober = V2RayProxies::probe;
    static volatile Random random = new Random();

    private static final AtomicBoolean testing = new AtomicBoolean();
    /** Every server the last test read, in the order found. */
    private static volatile List<V2RayLinks.Server> known = Collections.emptyList();
    /** The servers that answered the last test, fastest first. */
    private static volatile List<V2RayLinks.Server> answered = Collections.emptyList();
    private static volatile boolean loaded;
    private static volatile boolean startFailed;
    @Nullable
    private static V2RayServer server;
    @Nullable
    private static volatile WeakReference<Listener> listener;

    private V2RayProxies() {
    }

    // ---- The switch ------------------------------------------------------------------------------

    /** Whether the switch asks for the local proxy now. Paused, or before the settings are ready, it doesn't. */
    public static boolean wanted() {
        return Utils.settingsReady() && Settings.V2RAY_PROXIES.get();
    }

    /** Whether this build can carry it: Free proxies with Telegram's proxy calls that read a SOCKS5 link. */
    private static boolean carried() {
        return PatchFamily.FREE_PROXIES.inBuild() && PatchFamily.Capability.V2RAY_PROXIES.installed();
    }

    /**
     * Called once per Telegram start, from SettingsEntry.onApplicationCreate after the context is
     * set. On, the local proxy starts and its entry is put back if it's gone. Off or paused, an
     * entry left in Telegram's list comes out, since nothing listens behind it.
     */
    public static void onTelegramStart() {
        onTelegramStart(System.currentTimeMillis());
    }

    static void onTelegramStart(long now) {
        try {
            if (!Utils.settingsReady() || !Utils.isMainProcess() || !carried()) return;
            if (Settings.V2RAY_PROXIES.get()) {
                start(false, FreeProxies.due(now, Stored.TRIED_AT.get()));
                return;
            }
            if (Stored.ENTRY.get().isEmpty()) return;
            boolean paused = Setting.isPaused() && Settings.V2RAY_PROXIES.savedValue();
            Utils.runOnMainThreadDelayed(() -> {
                try {
                    boolean wasUsed = takeOut(store);
                    // Paused while Telegram used it: the first start after the pause uses it again.
                    if (paused && wasUsed) Stored.RESUME.save(true);
                } catch (Throwable failure) {
                    Logger.printException(() -> "V2Ray proxy: its entry couldn't come out of Telegram's list", failure);
                }
            }, startDelayMs);
        } catch (Throwable failure) {
            Logger.printException(() -> "V2Ray proxy: could not start", failure);
        }
    }

    /** After the switch was saved, from the settings page: on starts the proxy and tests the servers, off stops both. */
    public static void switched() {
        try {
            if (!Utils.settingsReady() || !carried()) return;
            if (Settings.V2RAY_PROXIES.get()) {
                start(true, true);
                return;
            }
            takeOut(store);
            Stored.RESUME.save(false);
            Utils.runInOrderOnBackgroundThread(() -> {
                stopServer();
                Utils.runOnMainThread(V2RayProxies::changed);
            });
        } catch (Throwable failure) {
            Logger.printException(() -> "V2Ray proxy: the switch couldn't take effect", failure);
        }
    }

    /**
     * Starts the local proxy on the ordered worker, so a start and a stop never cross, then puts its
     * entry in Telegram's list. [switchedOn] connects through it unless a proxy of the person's own
     * is in use; a start otherwise leaves Use proxy as it was, unless a pause took the entry out.
     */
    private static void start(boolean switchedOn, boolean test) {
        Utils.runInOrderOnBackgroundThread(() -> {
            if (!Settings.V2RAY_PROXIES.get()) return;
            String link;
            try {
                link = startServer();
                startFailed = false;
            } catch (IOException | RuntimeException failure) {
                startFailed = true;
                Logger.printException(() -> "V2Ray proxy: the local proxy couldn't start", failure);
                Utils.runOnMainThread(V2RayProxies::changed);
                return;
            }
            Utils.runOnMainThreadDelayed(() -> {
                try {
                    // Switched off while it started: the stop that follows on the worker ends it.
                    if (!Settings.V2RAY_PROXIES.get()) return;
                    Store into = store;
                    boolean connect = switchedOn ? takeOver(into) : Stored.RESUME.get();
                    if (!place(into, link, connect)) {
                        Logger.printInfo(() -> "V2Ray proxy: Telegram's proxy list didn't take the local proxy");
                    }
                    Stored.RESUME.save(false);
                } catch (Throwable failure) {
                    Logger.printException(() -> "V2Ray proxy: its entry couldn't go in Telegram's list", failure);
                } finally {
                    changed();
                }
            }, switchedOn ? 0 : startDelayMs);
            if (test) testNow();
        });
    }

    /** The local proxy's tg://socks link, starting the proxy when it isn't running. On a worker. */
    static String startServer() throws IOException {
        load();
        synchronized (V2RayProxies.class) {
            Local local = Local.read(Stored.LOCAL.get());
            if (server != null && server.running() && local != null && server.port() == local.port) return local.link();
            if (server != null) server.stop();
            server = null;
            boolean fresh = local == null;
            if (fresh) local = Local.fresh(random);
            IOException last = null;
            for (int attempt = 0; attempt < 5; attempt++) {
                V2RayServer starting = new V2RayServer(V2RayProxies::route);
                try {
                    starting.start(local.port, local.user, local.pass);
                    server = starting;
                    if (fresh || attempt > 0) Stored.LOCAL.save(local.toString());
                    return local.link();
                } catch (IOException taken) {
                    starting.stop();
                    last = taken;
                    // Another app has the port: a new one, and the entry follows it.
                    local = new Local(PORT_FROM + random.nextInt(PORT_COUNT), local.user, local.pass);
                }
            }
            throw last;
        }
    }

    static void stopServer() {
        synchronized (V2RayProxies.class) {
            if (server != null) server.stop();
            server = null;
        }
    }

    /** Whether the local proxy is running now. */
    public static boolean running() {
        synchronized (V2RayProxies.class) {
            return server != null && server.running();
        }
    }

    /** The local proxy's port now, or 0 when it isn't running. */
    static int port() {
        synchronized (V2RayProxies.class) {
            return server == null ? 0 : server.port();
        }
    }

    /** Stops the local proxy and forgets what was read, as a new Telegram process starts out. */
    static void resetForTests() {
        stopServer();
        synchronized (V2RayProxies.class) {
            known = Collections.emptyList();
            answered = Collections.emptyList();
            loaded = false;
            startFailed = false;
        }
        testing.set(false);
    }

    /** The local proxy's port, user name and password. */
    static final class Local {
        final int port;
        final String user;
        final String pass;

        Local(int port, String user, String pass) {
            this.port = port;
            this.user = user;
            this.pass = pass;
        }

        static Local fresh(Random random) {
            return new Local(PORT_FROM + random.nextInt(PORT_COUNT), secret(), secret());
        }

        private static String secret() {
            return Base64.getUrlEncoder().withoutPadding().encodeToString(V2RayCrypto.random(12));
        }

        @Nullable
        static Local read(String kept) {
            String[] parts = kept.trim().split(" ");
            if (parts.length != 3) return null;
            try {
                int port = Integer.parseInt(parts[0]);
                if (port < 1024 || port > 65535 || parts[1].isEmpty() || parts[2].isEmpty()) return null;
                return new Local(port, parts[1], parts[2]);
            } catch (NumberFormatException unreadable) {
                return null;
            }
        }

        String link() {
            return "tg://socks?server=127.0.0.1&port=" + port + "&user=" + user + "&pass=" + pass;
        }

        @Override
        public String toString() {
            return port + " " + user + " " + pass;
        }
    }

    // ---- Telegram's list ------------------------------------------------------------------------

    /**
     * Puts [link] in Telegram's list as the one entry this owns, taking out one it put there before
     * with another port. Telegram connects through it with [connect], or when the old one was in use.
     */
    static boolean place(Store into, String link, boolean connect) {
        String old = Stored.ENTRY.get();
        boolean wasUsed = false;
        if (!old.isEmpty() && !old.equals(link)) {
            wasUsed = into.inUse() && into.current(old);
            into.remove(old);
            Stored.ENTRY.save("");
        }
        if (!into.saved(link) && !into.add(link)) return false;
        Stored.ENTRY.save(link);
        if ((connect || wasUsed) && !(into.inUse() && into.current(link))) into.use(link);
        return true;
    }

    /** Takes this one's entry out of Telegram's list. True when Telegram was connecting through it. */
    static boolean takeOut(Store from) {
        String old = Stored.ENTRY.get();
        if (old.isEmpty()) return false;
        boolean wasUsed = from.inUse() && from.current(old);
        from.remove(old);
        Stored.ENTRY.save("");
        return wasUsed;
    }

    /** Whether switching on may connect through it: Use proxy is off, or the proxy in use is one Free proxies added. */
    static boolean takeOver(Store into) {
        if (!into.inUse()) return true;
        for (String link : FreeProxies.added()) {
            if (into.current(link)) return true;
        }
        return false;
    }

    // ---- Which server ----------------------------------------------------------------------------

    /** The servers a connection tries, best first: the one picked, or those that answered, or all of them. */
    static List<V2RayLinks.Server> route() {
        String pick = Stored.PICK.get();
        List<V2RayLinks.Server> fastest = answered;
        List<V2RayLinks.Server> all = known;
        if (!pick.isEmpty()) {
            for (V2RayLinks.Server server : fastest) if (server.id().equals(pick)) return Collections.singletonList(server);
            for (V2RayLinks.Server server : all) if (server.id().equals(pick)) return Collections.singletonList(server);
        }
        return fastest.isEmpty() ? all : fastest;
    }

    /** What's kept, read once per process: the pasted links and the servers that answered last. */
    private static void load() {
        if (loaded) return;
        synchronized (V2RayProxies.class) {
            if (loaded) return;
            if (known.isEmpty()) known = V2RayLinks.parse(Stored.LINKS.get()).servers;
            if (answered.isEmpty()) answered = found(Stored.FOUND.get(), null);
            loaded = true;
        }
    }

    /** The servers in a {@link Stored#FOUND} value, with each one's time put in [ms] when that's given. */
    private static List<V2RayLinks.Server> found(String kept, @Nullable Map<V2RayLinks.Server, Long> ms) {
        List<V2RayLinks.Server> servers = new ArrayList<>();
        for (String line : kept.split("\n")) {
            int tab = line.indexOf('\t');
            if (tab <= 0) continue;
            try {
                V2RayLinks.Server server = V2RayLinks.parseLink(line.substring(tab + 1));
                servers.add(server);
                if (ms != null) ms.put(server, Long.parseLong(line.substring(0, tab)));
            } catch (V2RayLinks.Skipped | RuntimeException unreadable) {
                // A link this build skips or can't read, kept by an older one.
            }
        }
        return servers;
    }

    /** The servers for the picker: those that answered, fastest first, then the rest. */
    public static List<Choice> choices() {
        load();
        List<Choice> choices = new ArrayList<>();
        Set<String> listed = new LinkedHashSet<>();
        Map<V2RayLinks.Server, Long> ms = new java.util.HashMap<>();
        for (V2RayLinks.Server server : found(Stored.FOUND.get(), ms)) {
            if (listed.add(server.id())) choices.add(new Choice(server.id(), server.name, ms.get(server), choices.size() + 1));
        }
        for (V2RayLinks.Server server : known) {
            if (listed.add(server.id())) choices.add(new Choice(server.id(), server.name, 0, choices.size() + 1));
        }
        return choices;
    }

    /** Whether a test has run, so a server with no time didn't answer rather than wasn't asked. */
    public static boolean tested() {
        return Stored.TRIED_AT.get() > 0;
    }

    /** The id of the server picked, or empty for the fastest that answers. */
    public static String picked() {
        return Stored.PICK.get();
    }

    /** Picks the server [id] names, or the fastest that answers for an empty one. New connections follow it. */
    public static boolean pick(String id) {
        return Stored.PICK.save(id);
    }

    // ---- Links ----------------------------------------------------------------------------------

    public static List<String> pastedLinks() {
        return FreeProxies.lines(Stored.LINKS.get());
    }

    /** The number, from 1, of the first of [lines] that isn't a link, or 0 when they all are. */
    public static int notALink(List<String> lines) {
        for (int i = 0; i < lines.size(); i++) {
            if (!V2RayLinks.looksLikeLink(lines.get(i))) return i + 1;
        }
        return 0;
    }

    /** Keeps [links] as the pasted ones in place of any before, and tests them while the switch is on. Off the main thread. */
    public static boolean saveLinks(List<String> links) {
        if (!Stored.LINKS.saveCommitted(String.join("\n", links))) return false;
        known = Collections.unmodifiableList(V2RayLinks.parse(String.join("\n", links)).servers);
        if (wanted()) testNow();
        return true;
    }

    // ---- Testing the servers ---------------------------------------------------------------------

    /** Tests every server now: the Test again button, a new set of links, and the switch turned on. */
    public static boolean testNow() {
        if (!testing.compareAndSet(false, true)) return true;
        long now = System.currentTimeMillis();
        boolean queued = Utils.runOnBackgroundThread(() -> {
            try {
                test(now);
            } catch (Throwable failure) {
                Logger.printException(() -> "V2Ray proxy: the test failed", failure);
            } finally {
                testing.set(false);
                Utils.runOnMainThread(V2RayProxies::changed);
            }
        });
        if (!queued) testing.set(false);
        Utils.runOnMainThread(V2RayProxies::changed);
        return queued;
    }

    /** One test, on a worker: every link read, up to {@link #MAX_TIMED} servers timed, and what answered kept. */
    static void test(long now) {
        Stored.TRIED_AT.save(now);
        V2RayLinks.Found found = V2RayLinks.parse(Stored.LINKS.get());
        int pasted = found.servers.size();
        List<String> lists = FreeProxies.ownLists();
        for (int i = 0; i < lists.size(); i++) {
            int which = i + 1;
            try {
                V2RayLinks.Found read = V2RayLinks.parse(FreeProxies.transport.get(lists.get(i), FreeProxies.MAX_LIST,
                        GoogleTranslate.deadline(FreeProxies.FETCH_MS)));
                found.add(read);
                // The list's number only: its address can hold a token of the person's.
                Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "V2RayProxies",
                        () -> "V2Ray proxy: your list " + which + " had " + read.servers.size() + " servers it can use");
            } catch (IOException | RuntimeException failure) {
                Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "V2RayProxies",
                        () -> "V2Ray proxy: your list " + which + " couldn't be read (" + failure.getClass().getSimpleName() + ")");
            }
        }
        known = Collections.unmodifiableList(new ArrayList<>(found.servers));
        List<V2RayLinks.Server> timed = pick(found.servers, pasted, random);
        Map<V2RayLinks.Server, Long> ms = time(prober, timed);
        List<V2RayLinks.Server> fastest = new ArrayList<>(ms.keySet());
        Collections.sort(fastest, Comparator.comparingLong(ms::get));
        answered = Collections.unmodifiableList(fastest);
        StringBuilder kept = new StringBuilder();
        for (V2RayLinks.Server server : fastest) {
            if (kept.length() > 0) kept.append('\n');
            kept.append(ms.get(server)).append('\t').append(server.link);
        }
        Stored.FOUND.save(kept.toString());
        StringBuilder result = new StringBuilder()
                .append(fastest.size()).append(' ').append(timed.size()).append(' ')
                .append(found.servers.size()).append(' ').append(found.unreadable);
        for (V2RayLinks.Skip skip : found.skipped.keySet()) result.append(' ').append(skip.name());
        Stored.RESULT.save(result.toString());
        // Counts only: a server's address, id and password stay out of the log.
        Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "V2RayProxies", () -> "V2Ray proxy: " + fastest.size()
                + " of " + timed.size() + " servers answered, " + found.skippedCount() + " links skipped, "
                + found.unreadable + " unreadable");
    }

    /** At most {@link #MAX_TIMED} of [servers]: the first [pasted] come first, the rest at random from the lists. */
    static List<V2RayLinks.Server> pick(List<V2RayLinks.Server> servers, int pasted, Random by) {
        if (servers.size() <= MAX_TIMED) return new ArrayList<>(servers);
        int first = Math.min(pasted, MAX_TIMED);
        List<V2RayLinks.Server> picked = new ArrayList<>(servers.subList(0, first));
        List<V2RayLinks.Server> rest = new ArrayList<>(servers.subList(first, servers.size()));
        Collections.shuffle(rest, by);
        picked.addAll(rest.subList(0, Math.min(rest.size(), MAX_TIMED - first)));
        return picked;
    }

    /** How long each of [servers] that answered took, timed {@link #PROBE_THREADS} at a time within {@link #PROBE_BUDGET_MS}. */
    static Map<V2RayLinks.Server, Long> time(Prober with, List<V2RayLinks.Server> servers) {
        Map<V2RayLinks.Server, Long> answered = new java.util.LinkedHashMap<>();
        if (servers.isEmpty()) return answered;
        ExecutorService pool = Executors.newFixedThreadPool(Math.min(PROBE_THREADS, servers.size()), task -> {
            Thread thread = new Thread(task, "hushtelegram-v2ray-test");
            thread.setDaemon(true);
            return thread;
        });
        try {
            List<Callable<Long>> probes = new ArrayList<>();
            for (V2RayLinks.Server server : servers) {
                probes.add(() -> {
                    try {
                        return with.ms(server);
                    } catch (IOException | RuntimeException noAnswer) {
                        return null;
                    }
                });
            }
            List<Future<Long>> done = pool.invokeAll(probes, PROBE_BUDGET_MS, TimeUnit.MILLISECONDS);
            for (int i = 0; i < done.size(); i++) {
                if (done.get(i).isCancelled()) continue;
                try {
                    Long ms = done.get(i).get();
                    if (ms != null) answered.put(servers.get(i), ms);
                } catch (ExecutionException failure) {
                    Logger.printDebug(() -> "V2Ray proxy: a timing failed", failure);
                }
            }
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
        } finally {
            pool.shutdownNow();
        }
        return answered;
    }

    /**
     * Times [server] the way Telegram would use it: through the whole tunnel to {@link #dc}, Telegram's
     * req_pq_multi in its intermediate transport, until the server's resPQ with the same nonce is back.
     */
    static long probe(V2RayLinks.Server server) throws IOException {
        long start = System.nanoTime();
        V2RayTunnels.Wire wire = V2RayDialer.dial(server);
        try {
            wire.timeout(PROBE_MS);
            byte[] nonce = V2RayCrypto.random(16);
            V2RayTunnels.Tunnel tunnel = V2RayTunnels.open(server, wire, dc, reqPq(nonce, System.currentTimeMillis()));
            if (!resPq(tunnel.in, nonce)) throw new IOException("not Telegram's answer");
            return Math.max(1L, TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - start));
        } finally {
            wire.close();
        }
    }

    /** The intermediate transport's tag, then one packet: an unencrypted req_pq_multi with [nonce]. */
    static byte[] reqPq(byte[] nonce, long nowMs) {
        byte[] packet = new byte[4 + 4 + 40];
        for (int i = 0; i < 4; i++) packet[i] = (byte) 0xee;
        le(packet, 4, 40, 4);
        // auth_key_id 0, then a message id from the clock: seconds above, a fraction below, divisible by 4.
        long id = ((nowMs / 1000L) << 32) | (((nowMs % 1000L) << 32) / 1000L & ~3L);
        le(packet, 16, id, 8);
        le(packet, 24, 20, 4);
        le(packet, 28, 0xbe7e8ef1L, 4);
        System.arraycopy(nonce, 0, packet, 32, 16);
        return packet;
    }

    /** Whether the packet that comes back is a resPQ for [nonce]. */
    static boolean resPq(java.io.InputStream in, byte[] nonce) throws IOException {
        byte[] length = new byte[4];
        V2RayTunnels.readFully(in, length, false);
        long size = readLe(length, 0, 4);
        if (size < 40 || size > 4096) return false;
        byte[] packet = new byte[(int) size];
        V2RayTunnels.readFully(in, packet, false);
        if (readLe(packet, 20, 4) != 0x05162463L) return false;
        for (int i = 0; i < 16; i++) if (packet[24 + i] != nonce[i]) return false;
        return true;
    }

    private static void le(byte[] into, int at, long value, int length) {
        for (int i = 0; i < length; i++) into[at + i] = (byte) (value >>> (8 * i));
    }

    private static long readLe(byte[] from, int at, int length) {
        long value = 0;
        for (int i = length - 1; i >= 0; i--) value = value << 8 | (from[at + i] & 0xff);
        return value;
    }

    // ---- The settings rows -----------------------------------------------------------------------

    /** The screen showing now hears about changes, and only while it's alive. */
    public static void watch(Listener watcher) {
        listener = new WeakReference<>(watcher);
    }

    public static void unwatch(Listener watcher) {
        WeakReference<Listener> held = listener;
        if (held != null && held.get() == watcher) listener = null;
    }

    private static void changed() {
        WeakReference<Listener> held = listener;
        Listener watcher = held == null ? null : held.get();
        if (watcher == null) return;
        try {
            watcher.v2rayProxiesChanged();
        } catch (Throwable failure) {
            Logger.printException(() -> "V2Ray proxy: the screen couldn't show the change", failure);
        }
    }

    /** What the Your V2Ray links row says. */
    public static String linksSummary() {
        int count = pastedLinks().size();
        if (count == 0) {
            return L10n.t("Paste vmess://, vless://, trojan:// and ss:// links here. Links in Your proxy lists are read too.");
        }
        return L10n.f("Links saved: %1$s. Links in Your proxy lists are read too.", count);
    }

    /** What the V2Ray server row says: a test on its way, or what the last one found, and which server is used. */
    public static String serverSummary() {
        if (startFailed) return L10n.t("The local proxy couldn't start. Turn the switch off and on again.");
        if (testing.get()) return L10n.t("Testing your V2Ray-style servers now.");
        String[] last = Stored.RESULT.get().split(" ");
        if (Stored.TRIED_AT.get() <= 0 || last.length < 4) return L10n.t("Not tested yet. Tap to pick a server or test them now.");
        int answeredCount;
        int timedCount;
        try {
            answeredCount = Integer.parseInt(last[0]);
            timedCount = Integer.parseInt(last[1]);
        } catch (NumberFormatException unreadable) {
            return L10n.t("Not tested yet. Tap to pick a server or test them now.");
        }
        StringBuilder summary = new StringBuilder();
        if (timedCount == 0) {
            summary.append(L10n.t("No V2Ray-style links found in your links or proxy lists."));
        } else if (answeredCount == 0) {
            summary.append(L10n.t("None of your servers answered last time."));
        } else {
            summary.append(L10n.f("Servers that answered last time: %1$s of %2$s.", answeredCount, timedCount));
        }
        Map<V2RayLinks.Skip, Integer> skipped = new EnumMap<>(V2RayLinks.Skip.class);
        for (int i = 4; i < last.length; i++) {
            for (V2RayLinks.Skip skip : V2RayLinks.Skip.values()) if (skip.name().equals(last[i])) skipped.put(skip, 1);
        }
        if (!skipped.isEmpty()) {
            List<String> labels = new ArrayList<>();
            for (V2RayLinks.Skip skip : skipped.keySet()) labels.add(skip.label());
            summary.append(' ').append(L10n.f("Skipped, not supported yet: %1$s.", L10n.join(labels)));
        }
        String pick = Stored.PICK.get();
        if (!pick.isEmpty()) {
            for (Choice choice : choices()) {
                if (choice.id.equals(pick)) {
                    summary.append(' ').append(L10n.f("Using %1$s.", label(choice)));
                    break;
                }
            }
        }
        return summary.toString();
    }

    /** A server as the picker names it: its name from the link, or its place in the picker when it has none. */
    public static String label(Choice choice) {
        return choice.name.isEmpty() ? L10n.f("Server %1$s", choice.number) : choice.name;
    }

    /** Telegram's proxy list through the calls the patch wrote, as {@link FreeProxies} reaches it. */
    static final class TelegramStore implements Store {
        private final FreeProxies.TelegramStore telegram = new FreeProxies.TelegramStore();

        @Override
        public boolean saved(String link) {
            return telegram.saved(link);
        }

        @Override
        public boolean add(String link) {
            return telegram.add(link);
        }

        // Telegram reads which proxy is current along with its list, which it loads on first use.
        @Override
        public boolean inUse() {
            TelegramProxies.proxies();
            return telegram.inUse();
        }

        @Override
        public boolean current(String link) {
            TelegramProxies.proxies();
            return telegram.current(link);
        }

        @Override
        public boolean use(String link) {
            return telegram.use(link);
        }

        @Override
        public void remove(String link) {
            Object entry = FreeProxies.TelegramStore.entry(link);
            // The current one too, unlike Free proxies: nothing would answer behind it.
            if (entry != null) TelegramProxies.delete(entry);
        }
    }
}
