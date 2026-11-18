package app.afterglow.extension.diagnostics;

import android.app.Application;
import android.content.Context;
import android.util.Log;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.video.PlaybackState;
import app.afterglow.extension.video.PlayerStatus;
import app.afterglow.extension.video.PlayerType;
import app.afterglow.extension.video.VideoState;

/** Opt-in diagnostics. Preference gates run before formatting or queuing events. */
public final class DebugLog {
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "Afterglow-debug-log"); thread.setDaemon(true); return thread;
    });
    private static final SimpleDateFormat CLOCK = new SimpleDateFormat("HH:mm:ss.SSS", Locale.ROOT);
    private static volatile List<String> recent = Collections.emptyList();
    private static volatile LogStore store;
    private static final long SALT = new java.security.SecureRandom().nextLong();
    private DebugLog() {}

    public static void initialize(Context context) {
        try { initializeOnce(context); }
        catch (Throwable error) { Log.w(Afterglow.TAG, "Could not initialize diagnostics"); }
    }

    private static synchronized void initializeOnce(Context context) {
        if (store != null || context == null) return;
        Context app = context.getApplicationContext();
        if (!(app instanceof Application)) return;
        store = new LogStore(app.getFilesDir());
        if (AfterglowPrefs.getBool("debugHUDEnabled")) AfterglowPrefs.setBool("debugLogEnabled", true);
        DebugHud.install((Application) app);
        AfterglowPrefs.addListener(key -> {
            DebugHud.preferencesChanged();
            write("settings", key == null ? "Preferences replaced or reset" : "Changed " + LogPolicy.categoryName(key));
        });
        VideoState.addListener(new VideoState.Listener() {
            @Override public void onPlayerCreated() { write("overlay-player", "Player created"); }
            @Override public void onNewVideo(String id) {
                if (shouldWrite("overlay-player")) write("overlay-player", "Video " + correlation(id));
            }
            @Override public void onPlayerStatus(PlayerStatus status) { write("overlay-player", "Status " + status); }
            @Override public void onPlaybackState(PlaybackState state) { write("overlay-player", "Playback " + state); }
            @Override public void onPlayerType(PlayerType type) {
                write(type == PlayerType.WATCH_WHILE_PICTURE_IN_PICTURE ? "pip-player" : "fullscreen-player", "Type " + type);
            }
            @Override public void onShortsPlayerOpen(boolean open) { write("shorts-ui", open ? "Opened" : "Closed"); }
            @Override public void onPlayerResponse(String id, boolean isShort) {
                if (firehose()) write("player-response", "Response " + correlation(id) + " shorts=" + isShort);
            }
            @Override public void onVideoTime(long time) {
                if (firehose()) write("player-clock", "Position ms=" + time);
            }
        });
        write("ctor", "Android diagnostics initialized");
    }

    public static boolean firehose() { return AfterglowPrefs.getBool("debugLogFirehose"); }

    public static boolean shouldWrite(String category) {
        String key = LogPolicy.categoryKey(category);
        return LogPolicy.allows(AfterglowPrefs.getBool("debugLogEnabled"), firehose(), category,
                key == null || AfterglowPrefs.getBool(key));
    }

    public static void write(String category, String message) {
        try {
            if (!shouldWrite(category)) return;
            if (store == null) initialize(Afterglow.context());
            LogStore destination = store;
            if (destination == null) return;
            long now = System.currentTimeMillis();
            // Redact before a message enters the pending queue, too.
            String safe = LogPolicy.redact(message), name = LogPolicy.categoryName(category);
            WORKER.execute(() -> {
                try { Log.i(Afterglow.TAG, destination.append(CLOCK.format(new Date(now)), name, safe)); }
                catch (IOException error) { Log.w(Afterglow.TAG, "Could not persist diagnostic log"); }
                finally { publish(destination); }
            });
        } catch (Throwable ignored) { /* A diagnostic must never break playback. */ }
    }

    public static void error(String where, Throwable error) {
        String category = where != null && where.startsWith("Shorts") ? "shorts-ui-error" : "error";
        write(category, where + " exception=" + (error == null ? "none" : error.getClass().getSimpleName()));
    }

    public static List<String> recent() { return recent; }

    public static void clear() {
        if (store == null) initialize(Afterglow.context());
        LogStore destination = store;
        if (destination == null) return;
        WORKER.execute(() -> {
            try { destination.clear(); }
            catch (IOException error) { Log.w(Afterglow.TAG, "Could not clear diagnostic file"); }
            finally { publish(destination); }
        });
    }

    /** Ordered behind pending writes/clears; the receiver always runs on the main thread. */
    public static void readForShare(Consumer<String> receiver) {
        if (store == null) initialize(Afterglow.context());
        LogStore destination = store;
        if (destination == null) { receiver.accept(""); return; }
        WORKER.execute(() -> {
            String body;
            try { body = destination.body(); }
            catch (IOException error) { body = String.join("\n", destination.recent()); }
            String result = body;
            Afterglow.runOnMain(() -> receiver.accept(result));
        });
    }

    private static void publish(LogStore destination) {
        recent = Collections.unmodifiableList(destination.recent());
        DebugHud.logChanged();
    }

    private static String correlation(String value) {
        if (value == null || value.isEmpty()) return "ref-none";
        long hash = 1469598103934665603L ^ SALT;
        for (byte b : value.getBytes(java.nio.charset.StandardCharsets.UTF_8)) { hash ^= b & 255; hash *= 1099511628211L; }
        return String.format(Locale.ROOT, "ref-%012x", hash & 0xffffffffffffL);
    }
}
