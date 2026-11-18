package io.github.sabopura.morphe.extension.twitch.player;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ads.AdShield;
import io.github.sabopura.morphe.extension.twitch.app.LatencyBadge;
import io.github.sabopura.morphe.extension.twitch.app.PlayerRetry;
import io.github.sabopura.morphe.extension.twitch.original.ChannelProfiles;
import io.github.sabopura.morphe.extension.twitch.ui.Text;
import android.content.*;
import android.net.Uri;
import android.os.SystemClock;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.chat.*;

import io.github.sabopura.morphe.extension.twitch.ui.Notice;
import io.github.sabopura.morphe.extension.twitch.ui.Ui;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** Uses only the stable, public IVS Player methods; no private account state is inspected. */
public final class PlayerTools {
    /** A live stream played faster than 1x has caught up once less than this is loaded ahead. */
    private static final long CAUGHT_UP_MS = 2500;
    public static final int SPEED_SET = 0, SPEED_AT_LIVE_EDGE = 1, SPEED_CATCHING_UP = 2;
    public static final int DEFAULT_FORWARD_SEEK = 30, DEFAULT_REWIND_SEEK = 10;
    private static final long SLEEP_CHECK_MS = 30000;
    /** A reload that has not started playing by now failed, usually on an expired stream URL. */
    private static final long RELOAD_CHECK_MS = 7000;
    private static final int MAX_OFFSET = 120;
    private static final Map<String, Method> METHODS = new ConcurrentHashMap<>();
    /** Every IVS player that has started and is not released. */
    private static final List<Entry> PLAYERS = new ArrayList<>();
    private static long entries;
    private static WeakReference<Object> catchingUp = new WeakReference<>(null);
    private static volatile Context app;
    private static volatile String vodId = "";
    private static long sleepAt;
    private static final EndSleep END_SLEEP = new EndSleep();
    private static final long RELOAD_INTERVAL_MS = 2000;
    private static final int QUALITY_TRIES = 75;
    private static long reloadAt = -RELOAD_INTERVAL_MS;
    private static volatile String keptQuality;
    private static WeakReference<Object> keptFor = new WeakReference<>(null);
    /** postDelayed stops while the device sleeps, so the deadline is re-read against the real clock. */
    private static final Runnable SLEEP =
            new Runnable() {
                @Override
                public void run() {
                    if (sleepAt == 0) return;
                    long remaining = sleepAt - SystemClock.elapsedRealtime();
                    if (remaining > 0) {
                        PublicApi.UI.postDelayed(this, Math.min(SLEEP_CHECK_MS, remaining));
                        return;
                    }
                    sleepAt = 0;
                    try {
                        invoke("pause", new Class<?>[0]);
                    } catch (Exception ignored) {
                    }
                }
            };

    private PlayerTools() {}

    public static void initialize(Context context) {
        Text.use(context);
        if (context != null) {
            app = context.getApplicationContext();
        }
    }

    private static final class Entry {
        final WeakReference<Object> player;
        final long id;
        long playedAt;
        String content = "";
        float rate = 1f;
        /** The viewer muted this player from the menu. */
        volatile boolean muted;

        Entry(Object player, long id) {
            this.player = new WeakReference<>(player);
            this.id = id;
        }
    }

    /** Finds (or adds) a player's entry and drops collected ones. Must hold PLAYERS. */
    private static Entry entry(Object value, boolean create) {
        Entry found = null;
        for (Iterator<Entry> it = PLAYERS.iterator(); it.hasNext(); ) {
            Entry e = it.next();
            Object p = e.player.get();
            if (p == null) it.remove();
            else if (p == value) found = e;
        }
        if (found != null || !create || value == null) return found;
        found = new Entry(value, ++entries);
        PLAYERS.add(found);
        return found;
    }

    public static void onPlay(Object value) {
        try {
            synchronized (PLAYERS) {
                entry(value, true).playedAt = SystemClock.uptimeMillis();
            }
            LatencyBadge.playerStarted();
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.on-play", e);
        }
    }

    public static void onRelease(Object value) {
        try {
            synchronized (PLAYERS) {
                Entry e = entry(value, false);
                if (e != null) PLAYERS.remove(e);
            }
            if (catchingUp.get() == value) catchingUp.clear();
            END_SLEEP.released(value);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.on-release", e);
        }
    }

    /**
     * Before the player loads something. IVS keeps the playback rate across loads, so a speed
     * picked for one VOD would otherwise carry over into the next stream.
     */
    public static void onLoad(Object value, Object source) {
        try {
            loading(value, source);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.on-load", e);
        }
    }

    private static void loading(Object value, Object source) {
        String kept = keptQuality;
        if (kept != null && keptFor.get() == value) {
            keptQuality = null;
            restoreQuality(value, kept, 0);
        }
        String content = contentOf(source);
        END_SLEEP.loading(value, content);
        boolean reset, unmute;
        synchronized (PLAYERS) {
            Entry e = entry(value, true);
            reset = e.rate != 1f && !content.equals(e.content);
            if (reset) e.rate = 1f;
            unmute = e.muted && !content.equals(e.content);
            if (unmute) e.muted = false;
            e.content = content;
        }
        if (unmute) {
            try {
                setMuted(value, false);
            } catch (Exception e) {
                Diagnostics.note("player.unmute", e);
            }
        }
        if (!reset) return;
        if (catchingUp.get() == value) catchingUp.clear();
        try {
            call(value, "setPlaybackRate", new Class<?>[] {float.class}, 1f);
        } catch (Exception e) {
            Diagnostics.note("player.rate-reset", e);
        }
    }

    /** The stream or VOD a load is for, without the per-request token. */
    static String contentOf(Object source) {
        String text;
        try {
            text = source instanceof String ? (String) source
                    : String.valueOf(source.getClass().getMethod("getUri").invoke(source));
        } catch (Exception e) {
            Diagnostics.note("player.load-content", e);
            return "";
        }
        if (PlayerContent.isPlaylist(text)) return PlayerContent.playlistName(text);
        String path = Uri.parse(text).getPath();
        // A proxy keeps the channel in its path too, so the path identifies the content.
        return path == null ? text : path.replaceAll("/+$", "");
    }

    public static void onVod(Object model) {
        try {
            Object id = model.getClass().getMethod("getId").invoke(model);
            vodId = id == null ? "" : id.toString().replaceFirst("^v", "");
        } catch (Exception e) {
            Diagnostics.note("player.vod-id", e);
            vodId = "";
        }
    }

    public static void onVod(Object model, Object channel) {
        onVod(model);
        try {
            String id = String.valueOf(channelIdGetter(channel.getClass()).invoke(channel));
            String name = String.valueOf(channel.getClass().getMethod("getName").invoke(channel));
            ChatEnhancements.onChannelChanged(id, name);
            // A VOD joins no chat, so the values remembered per channel learn here whose VOD this is.
            ChannelProfiles.onChannel(id, name);
        } catch (Exception | LinkageError e) {
            Diagnostics.note("player.vod-channel", e);
        }
    }

    /** A channel's ID: a Tuid from 31.9.0, which prints as the number, and an int before. */
    private static Method channelIdGetter(Class<?> channel) throws NoSuchMethodException {
        try {
            return channel.getMethod("getTuid");
        } catch (NoSuchMethodException e) {
            return channel.getMethod("getId");
        }
    }

    private static final java.util.regex.Pattern VOD_PATH =
            java.util.regex.Pattern.compile("^/vod/(?:v\\d+/)?(\\d{1,20})\\.m3u8$");

    /**
     * The VOD on screen, or "". What the player on screen has loaded decides, so a live preview
     * started elsewhere in the app changes nothing. Twitch's VOD chat setup names the VOD when the
     * player's content does not: when it is unknown, and from 31.9.0, where Twitch loads a VOD's
     * playlist itself and hands the player its text. (A clip played from such a text right after a
     * VOD is taken for that VOD; nothing tells the two apart here.)
     */
    public static String vodId() {
        // Player state is read on the main thread only, where Twitch itself drives the player.
        String content = android.os.Looper.myLooper() == android.os.Looper.getMainLooper() ? content() : "";
        java.util.regex.Matcher vod = VOD_PATH.matcher(content);
        if (vod.find()) return vod.group(1);
        return content.isEmpty() || PlayerContent.isRecordingName(content) ? vodId : "";
    }

    /** What the player on screen has loaded, without the per-request token; "" when unknown. Main thread only. */
    public static String content() {
        return onScreen(false);
    }

    /**
     * Changes when another player comes on screen or the one on screen loads other content, and
     * only then; "" when there is no player. Main thread only.
     */
    public static String playing() {
        return onScreen(true);
    }

    private static String onScreen(boolean withPlayer) {
        Object p = current();
        if (p == null) return "";
        synchronized (PLAYERS) {
            Entry e = entry(p, false);
            if (e == null) return "";
            return withPlayer ? e.id + "/" + e.content : e.content;
        }
    }

    /** Twitch asks for the chat replay at this many seconds into the VOD it set up. */
    public static int commentTime(int seconds) {
        try {
            return (int) Math.max(0, Math.min(Integer.MAX_VALUE, (long) seconds + commentShift()));
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.comment-time", e);
            return seconds;
        }
    }

    /** The VOD chat offset set for the VOD Twitch set up, in seconds. */
    public static int commentShift() {
        return app == null ? 0 : ChatSettings.preferences(app).getInt("vod_sync_" + vodId, 0);
    }

    public static SharedPreferences preferences() {
        return app == null ? null : ChatSettings.preferences(app);
    }

    /** The application, once Twitch has started it. */
    static Context app() {
        return app;
    }

    private static Object call(Object player, String name, Class<?>[] types, Object... args) throws Exception {
        String key = name + java.util.Arrays.toString(types);
        Method method = METHODS.get(key);
        if (method == null) {
            method = Class.forName("com.amazonaws.ivs.player.Player").getMethod(name, types);
            METHODS.put(key, method);
        }
        return method.invoke(player, args);
    }

    /**
     * The player on screen. Twitch also runs players for previews (its React Native feed has
     * its own), so the most recently started one is not always the theatre's: prefer one that
     * can be heard, then one that is playing, then the most recently started.
     */
    static Object current() {
        List<Entry> entries;
        synchronized (PLAYERS) {
            entry(null, false);
            entries = new ArrayList<>(PLAYERS);
        }
        Object best = null;
        int bestScore = -1;
        long bestAt = Long.MIN_VALUE;
        for (Entry e : entries) {
            Object p = e.player.get();
            if (p == null) continue;
            int score = score(p, e.muted);
            if (score > bestScore || score == bestScore && e.playedAt > bestAt) {
                best = p;
                bestScore = score;
                bestAt = e.playedAt;
            }
        }
        return best;
    }

    private static int score(Object p, boolean viewerMuted) {
        int state;
        try {
            // A paused IVS player reports IDLE, so only an ended one counts as finished.
            String name = String.valueOf(call(p, "getState", new Class<?>[0]));
            state = "PLAYING".equals(name) ? 3 : "BUFFERING".equals(name) ? 2 : "ENDED".equals(name) ? 0 : 1;
        } catch (Exception e) {
            Diagnostics.note("player.state", e);
            return 0;
        }
        if (state == 0) return 0;
        boolean audible;
        try {
            // A stream the viewer muted is still the one being watched.
            audible = (viewerMuted || !(Boolean) call(p, "isMuted", new Class<?>[0]))
                    && ((Number) call(p, "getVolume", new Class<?>[0])).floatValue() > 0;
        } catch (Exception e) {
            Diagnostics.note("player.audible", e);
            audible = false;
        }
        return (audible ? 4 : 0) + state;
    }

    private static Object require() {
        Object value = current();
        if (value == null) throw new IllegalStateException("No active player");
        return value;
    }

    private static Object invoke(String name, Class<?>[] types, Object... args) throws Exception {
        return call(require(), name, types, args);
    }

    private static long number(String name) throws Exception {
        return ((Number) invoke(name, new Class<?>[0])).longValue();
    }

    private static long number(Object player, String name) throws Exception {
        return ((Number) call(player, name, new Class<?>[0])).longValue();
    }

    /** True for a live stream, false for a VOD or clip, null when nothing is playing. */
    public static Boolean live() {
        Object p = current();
        if (p == null) return null;
        try {
            return number(p, "getDuration") < 0;
        } catch (Exception e) {
            Diagnostics.note("player.live", e);
            return null;
        }
    }

    /** How far a live stream is behind the broadcast, in milliseconds; 0 or -1 when unknown. */
    public static long liveDelay() {
        Object p = current();
        try {
            return p == null ? -1 : number(p, "getLiveLatency");
        } catch (Exception e) {
            Diagnostics.note("player.live-latency", e);
            return -1;
        }
    }

    public static void seek(long position) throws Exception {
        long duration = number("getDuration");
        invoke(
                "seekTo",
                new Class<?>[] {long.class},
                Math.max(0, duration > 0 ? Math.min(duration, position) : position));
    }

    /** Playback position in milliseconds, or 0 when nothing is playing. */
    public static long position() {
        try {
            return number("getPosition");
        } catch (Exception e) {
            return 0;
        }
    }

    public static boolean hasPlayer() {
        return current() != null;
    }

    /** The IVS state of the player that can be heard, or "" when every player is a muted preview. */
    public static String audibleState() {
        Object p = current();
        try {
            return p == null || !viewerMuted(p) && (Boolean) call(p, "isMuted", new Class<?>[0]) ? ""
                    : String.valueOf(call(p, "getState", new Class<?>[0]));
        } catch (Exception e) {
            Diagnostics.note("player.audible-state", e);
            return "";
        }
    }

    /** Sets the on-screen player's own volume, 0 to 1, which scales the device volume. */
    public static void volume(float value) {
        Object p = current();
        if (p == null) return;
        try {
            call(p, "setVolume", new Class<?>[]{float.class}, Math.max(0f, Math.min(1f, value)));
        } catch (Exception e) {
            Diagnostics.note("player.volume", e);
        }
    }

    /** Whether the viewer muted the player on screen from the menu. Main thread. */
    public static boolean muted() {
        return viewerMuted(current());
    }

    public static boolean viewerMuted(Object player) {
        synchronized (PLAYERS) {
            Entry e = entry(player, false);
            return e != null && e.muted;
        }
    }

    /**
     * Mutes the player on screen, or lets it be heard again, with the player's own mute. Twitch and
     * the volume remembered per channel only ever set a player's volume, so neither undoes a mute
     * and the volume is still there afterwards. The mute belongs to what is playing: it stays through
     * a reload, the mini player and the background, and ends when the player loads something else or
     * is closed.
     */
    public static void mute(boolean on) throws Exception {
        Object p = require();
        setMuted(p, on);
        synchronized (PLAYERS) {
            entry(p, true).muted = on;
        }
    }

    /** An ad being covered stays silent; its cover hands the player back as the viewer left it. */
    private static void setMuted(Object player, boolean on) throws Exception {
        if (on || !AdShield.covering(player)) call(player, "setMuted", new Class<?>[] {boolean.class}, on);
    }

    /** Current playback rate, or NaN when no player is active. */
    public static float playbackRate() {
        try {
            return ((Number) invoke("getPlaybackRate", new Class<?>[0])).floatValue();
        } catch (Exception e) {
            return Float.NaN;
        }
    }

    public static void playbackRate(float rate) throws Exception {
        speed(rate);
    }

    /**
     * Sets the speed of the player on screen. A live stream cannot run ahead of the broadcast:
     * faster than 1x only makes up a delay and then returns to 1x by itself. Left alone, the
     * player would stall at the live edge over and over.
     */
    public static int speed(float rate) throws Exception {
        if (!Float.isFinite(rate)) throw new IllegalArgumentException();
        rate = Math.max(.25f, Math.min(2f, rate));
        Object p = require();
        boolean live = number(p, "getDuration") < 0;
        if (live && rate > 1f && caughtUp(p)) return SPEED_AT_LIVE_EDGE;
        call(p, "setPlaybackRate", new Class<?>[] {float.class}, rate);
        synchronized (PLAYERS) {
            entry(p, true).rate = rate;
        }
        catchingUp.clear();
        PublicApi.UI.removeCallbacks(CATCH_UP);
        if (!live || rate <= 1f) return SPEED_SET;
        catchingUp = new WeakReference<>(p);
        PublicApi.UI.postDelayed(CATCH_UP, 500);
        return SPEED_CATCHING_UP;
    }

    /**
     * Faster than 1x is only possible while video is loaded ahead of the playing position. Near
     * the live edge little is, whatever the stream's own delay, so playing on fast would stall.
     */
    private static boolean caughtUp(Object p) throws Exception {
        long ahead = number(p, "getBufferedPosition") - number(p, "getPosition");
        return ahead < CAUGHT_UP_MS;
    }

    private static final Runnable CATCH_UP =
            new Runnable() {
                @Override
                public void run() {
                    Object p = catchingUp.get();
                    if (p == null) return;
                    try {
                        float rate = ((Number) call(p, "getPlaybackRate", new Class<?>[0])).floatValue();
                        if (rate <= 1f) {
                            catchingUp.clear();
                            return;
                        }
                        if (caughtUp(p)) {
                            call(p, "setPlaybackRate", new Class<?>[] {float.class}, 1f);
                            synchronized (PLAYERS) {
                                Entry e = entry(p, false);
                                if (e != null) e.rate = 1f;
                            }
                            catchingUp.clear();
                            Context c = app;
                            if (c != null)
                                Notice.show(c, label("ライブに追いついたので 1× に戻しました",
                                        "Caught up with the stream, back to 1×"));
                            return;
                        }
                    } catch (Exception e) {
                        Diagnostics.note("player.catch-up", e);
                        catchingUp.clear();
                        return;
                    }
                    PublicApi.UI.postDelayed(this, 500);
                }
            };

    public static void relativeSeek(Context c, boolean forward) {
        if (Boolean.TRUE.equals(live())) {
            Notice.show(c, label("ライブ配信では戻る・進むは使えません（VOD で使えます）",
                    "Live streams cannot be skipped; this works on VODs"));
            return;
        }
        run(
                c,
                () -> {
                    int seconds =
                            ChatSettings.preferences(c)
                                    .getInt(
                                            forward ? "forward_seek" : "rewind_seek",
                                            forward ? DEFAULT_FORWARD_SEEK : DEFAULT_REWIND_SEEK);
                    seek(number("getPosition") + (forward ? 1 : -1) * seconds * 1000L);
                });
    }

    public static void setSleepMinutes(int minutes) {
        setSleepDuration(Math.max(0, Math.min(1440, minutes)) * 60000L);
    }

    /** Sets the timer to a time, or to off with 0; either way it no longer waits for the video's end. */
    public static void setSleepDuration(long duration) {
        duration = Math.max(0, Math.min(86400000L, duration));
        END_SLEEP.clear();
        PublicApi.UI.removeCallbacks(SLEEP);
        sleepAt = duration == 0 ? 0 : SystemClock.elapsedRealtime() + duration;
        if (duration > 0) PublicApi.UI.postDelayed(SLEEP, Math.min(SLEEP_CHECK_MS, duration));
    }

    public static long sleepRemaining() {
        return sleepAt == 0 ? 0 : Math.max(0, sleepAt - SystemClock.elapsedRealtime());
    }

    /** Whether the video on screen has an end still ahead of it: not a live stream, and not over yet. */
    public static boolean endAhead() {
        return endAhead(current());
    }

    private static boolean endAhead(Object p) {
        try {
            return p != null && number(p, "getDuration") >= 0
                    && !"ENDED".equals(String.valueOf(call(p, "getState", new Class<?>[0])));
        } catch (Exception e) {
            Diagnostics.note("player.end-ahead", e);
            return false;
        }
    }

    /**
     * Sets the timer to the end of the video on screen instead of a time: nothing plays after it.
     * The video stops by itself there, so this only has to keep Twitch from starting another
     * ({@link VodEnd}). False when no end is ahead; once the video is over, Twitch has already
     * decided what comes next.
     */
    public static boolean sleepAtEnd() {
        Object p = current();
        if (!endAhead(p)) return false;
        String content;
        synchronized (PLAYERS) {
            Entry e = entry(p, false);
            content = e == null ? "" : e.content;
        }
        setSleepDuration(0);
        END_SLEEP.set(p, content);
        return true;
    }

    public static boolean sleepsAtEnd() {
        return END_SLEEP.waiting();
    }

    static boolean endSleepReached() {
        Object waited = END_SLEEP.player();
        // Another player's video can end while this one still plays.
        return waited != null && ended(waited) && END_SLEEP.reached();
    }

    /** True at a video's end; also when that cannot be read, so the timer errs towards stopping. */
    private static boolean ended(Object p) {
        try {
            if ("ENDED".equals(String.valueOf(call(p, "getState", new Class<?>[0])))) return true;
            long duration = number(p, "getDuration");
            return duration <= 0 || number(p, "getPosition") >= duration - 3000;
        } catch (Exception e) {
            Diagnostics.note("player.end-reached", e);
            return true;
        }
    }

    public static void reload(Context c) {
        if (PlayerRetry.casting()) {
            Notice.show(c, label("キャスト中は再読み込みできません", "Cannot reload while casting"));
            return;
        }
        long now = SystemClock.uptimeMillis();
        if (now - reloadAt < RELOAD_INTERVAL_MS) return;
        reloadAt = now;
        run(
                c,
                () -> {
                    keepQuality(require());
                    if (PlayerRetry.retry()) return;
                    String path = (String) invoke("getPath", new Class<?>[0]);
                    if (path == null || !path.startsWith("https://"))
                        throw new IllegalStateException();
                    long position = number("getPosition"), duration = number("getDuration");
                    invoke("load", new Class<?>[] {Uri.class}, LiveProxy.forReload(path));
                    if (duration > 0) seek(position);
                    invoke("play", new Class<?>[0]);
                    PublicApi.UI.postDelayed(() -> warnIfNotPlaying(c), RELOAD_CHECK_MS);
                });
    }

    /** A manually chosen quality; IVS and Twitch's Retry would otherwise start the new load on auto. */
    private static void keepQuality(Object player) throws Exception {
        keptQuality = null;
        if ((Boolean) call(player, "isAutoQualityMode", new Class<?>[0])) return;
        Object quality = call(player, "getQuality", new Class<?>[0]);
        if (quality == null) return;
        keptQuality = (String) quality.getClass().getMethod("getName").invoke(quality);
        keptFor = new WeakReference<>(player);
    }

    /** Qualities are known only once the new load is ready, so this waits for it. */
    private static void restoreQuality(Object player, String name, int tries) {
        PublicApi.UI.postDelayed(() -> {
            try {
                String state = String.valueOf(call(player, "getState", new Class<?>[0]));
                if (!"READY".equals(state) && !"PLAYING".equals(state)) {
                    if (tries < QUALITY_TRIES) restoreQuality(player, name, tries + 1);
                    return;
                }
                for (Object quality : (Iterable<?>) call(player, "getQualities", new Class<?>[0])) {
                    if (!name.equals(quality.getClass().getMethod("getName").invoke(quality))) continue;
                    call(player, "setAutoQualityMode", new Class<?>[] {boolean.class}, false);
                    call(player, "setQuality", new Class<?>[] {Class.forName("com.amazonaws.ivs.player.Quality")}, quality);
                    return;
                }
            } catch (Exception | LinkageError e) {
                Diagnostics.note("player.restore-quality", e);
            }
        }, 200);
    }

    private static void warnIfNotPlaying(Context c) {
        try {
            String state = String.valueOf(invoke("getState", new Class<?>[0]));
            if (!"PLAYING".equals(state) && !"BUFFERING".equals(state))
                Notice.show(c, label("再読み込みに失敗しました。動画を開き直してください",
                        "Reload failed. Reopen the video"));
        } catch (Exception ignored) {
        }
    }

    public static void stats(Context c) {
        Ui ui = Ui.of(c);
        TextView view = ui.text(c, "", 14, ui.secondary, false);
        android.app.Dialog dialog = ui.modal(c, label("再生統計", "Playback statistics"), null, view,
                label("閉じる", "Close"), (Runnable) null, null);
        Runnable tick =
                new Runnable() {
                    @Override
                    public void run() {
                        if (!dialog.isShowing() || Ui.activity(c) != null && Ui.activity(c).isDestroyed()) return;
                        try {
                            view.setText(statsText());
                        } catch (Exception e) {
                            view.setText(label("再生中の動画がありません", "No active player"));
                        }
                        view.postDelayed(this, 1000);
                    }
                };
        dialog.setOnDismissListener(d -> view.removeCallbacks(tick));
        Ui.show(dialog, c);
        tick.run();
    }

    private static String statsText() throws Exception {
        return label("再生位置: ", "Position: ") + number("getPosition") / 1000 + " s\n"
                + label("長さ: ", "Duration: ") + number("getDuration") / 1000 + " s\n"
                + label("先読み: ", "Buffer: ") + Math.max(0, number("getBufferedPosition") - number("getPosition")) + " ms\n"
                + label("遅れ: ", "Live latency: ") + number("getLiveLatency") + " ms\n"
                + label("ビットレート: ", "Bitrate: ") + number("getAverageBitrate") / 1000 + " kbps\n"
                + label("速度: ", "Rate: ") + invoke("getPlaybackRate", new Class<?>[0]) + "×";
    }

    public static void sync(Context c) {
        String vod = vodId();
        if (vod.isEmpty()) {
            Notice.show(c, label("VODを開いてください", "Open a VOD first"));
            return;
        }
        final String key = "vod_sync_" + vod;
        SharedPreferences prefs = ChatSettings.preferences(c);
        Ui ui = Ui.of(c);
        int[] value = {Math.max(-MAX_OFFSET, Math.min(MAX_OFFSET, prefs.getInt(key, 0)))};
        android.view.View stepper = ui.stepper(c, label("チャットの同期量（秒）", "Chat offset in seconds"), -MAX_OFFSET, MAX_OFFSET, value[0], 0,
                v -> (v > 0 ? "+" : "") + v + label(" 秒", " s"), v -> value[0] = v);
        android.app.Dialog dialog = ui.modal(c, label("VODチャット同期", "VOD chat offset"),
                label("正の値で先のコメントを表示します。ボタンを押し続けると素早く動かせます。",
                        "Positive shows later comments. Hold a button and drag to sweep."),
                stepper, label("OK", "OK"), () -> {
                    SharedPreferences.Editor editor = prefs.edit();
                    if (value[0] == 0) editor.remove(key);
                    else editor.putInt(key, value[0]);
                    editor.apply();
                }, label("キャンセル", "Cancel"));
        Ui.show(dialog, c);
    }

    public interface Operation {
        void run() throws Exception;
    }

    public static void run(Context c, Operation action) {
        try {
            action.run();
        } catch (Exception e) {
            Notice.show(c, label("再生中の動画ではこの操作を実行できません",
                    "This action is unavailable for the current player"));
        }
    }
}
