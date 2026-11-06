package app.enigma.extension.music.maloja;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.Network;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Listens waiting to reach the Maloja server. Each listen is written to disk before it is sent
 * and only leaves the queue once the server answered for it, so listens made without a
 * connection, or lost to a server error, are sent later with their original timestamp.
 * <p>
 * The queue is flushed when a listen is added, when the app starts, when a network becomes
 * available and, after a failure, on a growing retry delay.
 * <p>
 * Everything touching the stored queue runs on a single background thread.
 */
final class ScrobbleQueue {

    static final class Listen {
        final String artist;
        final String track;
        final String album;
        final int durationSeconds;
        final long listenedAtSeconds;

        Listen(String artist, String track, String album, int durationSeconds, long listenedAtSeconds) {
            this.artist = artist;
            this.track = track;
            this.album = album;
            this.durationSeconds = durationSeconds;
            this.listenedAtSeconds = listenedAtSeconds;
        }

        JSONObject toJson() throws JSONException {
            JSONObject json = new JSONObject();
            json.put("artist", artist);
            json.put("track", track);
            if (album != null) json.put("album", album);
            json.put("duration", durationSeconds);
            json.put("listened_at", listenedAtSeconds);
            return json;
        }

        static Listen fromJson(JSONObject json) {
            String artist = json.optString("artist");
            String track = json.optString("track");
            long listenedAt = json.optLong("listened_at");
            if (artist.isBlank() || track.isBlank() || listenedAt <= 0) return null;
            return new Listen(artist, track, json.optString("album", null),
                    json.optInt("duration"), listenedAt);
        }

        @Override
        public String toString() {
            return "'" + track + "' by " + artist + " at " + listenedAtSeconds;
        }
    }

    private static final String PREFERENCES_NAME = "morphe_maloja_pending_scrobbles";
    private static final String KEY_PENDING = "pending";

    /** Oldest listens are dropped past this, so a server that is gone for good cannot fill the storage. */
    private static final int MAX_PENDING = 5000;

    private static final long MIN_RETRY_DELAY_SECONDS = 30;
    private static final long MAX_RETRY_DELAY_SECONDS = 30 * 60;

    private static final ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();

    // Only accessed on the executor thread.
    private static long retryDelaySeconds = MIN_RETRY_DELAY_SECONDS;
    private static ScheduledFuture<?> scheduledRetry;

    private static volatile boolean started;

    /**
     * Sends whatever an earlier session left behind and flushes again whenever a network
     * connects. Safe to call more than once.
     */
    static void start() {
        if (started) return;
        Context context = Utils.getContext();
        // Tried again by the next caller, the main activity at the latest.
        if (context == null) return;
        started = true;

        try {
            ConnectivityManager connectivity =
                    (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (connectivity != null) {
                connectivity.registerDefaultNetworkCallback(new ConnectivityManager.NetworkCallback() {
                    @Override
                    public void onAvailable(Network network) {
                        executor.execute(() -> {
                            // A new connection is worth trying right away, whatever failed before.
                            retryDelaySeconds = MIN_RETRY_DELAY_SECONDS;
                            flushNow();
                        });
                    }
                });
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not listen for network changes", ex);
        }

        flush();
    }

    /**
     * Stores the listen and tries to send it, together with any older pending listen.
     */
    static void add(Listen listen) {
        executor.execute(() -> addNow(listen));
    }

    private static void addNow(Listen listen) {
        if (Utils.getContext() == null) {
            // Nowhere to store it yet, which only happens in the first moments of the app.
            executor.schedule(() -> addNow(listen), 1, TimeUnit.SECONDS);
            return;
        }

        List<Listen> pending = load();
        pending.add(listen);
        while (pending.size() > MAX_PENDING) {
            Listen dropped = pending.remove(0);
            Logger.printInfo(() -> "Too many pending Maloja scrobbles, dropping the oldest: " + dropped);
        }
        save(pending);
        Logger.printDebug(() -> "Queued Maloja scrobble " + listen + ", pending: " + pending.size());
        flushNow();
    }

    static void flush() {
        executor.execute(ScrobbleQueue::flushNow);
    }

    private static void flushNow() {
        cancelRetry();
        if (!MalojaSettings.ENABLED.get() || !MalojaSettings.isConfigured()) return;

        List<Listen> pending = load();
        if (pending.isEmpty()) return;

        final String serverUrl = MalojaSettings.SERVER_URL.get();
        final String apiKey = MalojaSettings.API_KEY.get();

        while (!pending.isEmpty()) {
            Listen listen = pending.get(0);
            Maloja.SubmitResult result = Maloja.submitListen(serverUrl, apiKey, listen.artist,
                    listen.track, listen.album, listen.durationSeconds, listen.listenedAtSeconds);

            if (result == Maloja.SubmitResult.RETRY) {
                // Saved state is already current, since each sent listen is removed as it goes.
                final int remaining = pending.size();
                Logger.printDebug(() -> remaining + " Maloja scrobbles pending, retrying in "
                        + retryDelaySeconds + "s");
                scheduleRetry();
                return;
            }

            if (result == Maloja.SubmitResult.ACCEPTED) {
                Logger.printDebug(() -> "Scrobbled to Maloja: " + listen);
            } else {
                Logger.printInfo(() -> "Maloja refused the scrobble, dropping it: " + listen);
            }
            pending.remove(0);
            // Saved after every listen, so a process killed mid flush never sends one twice.
            save(pending);
        }

        retryDelaySeconds = MIN_RETRY_DELAY_SECONDS;
    }

    private static void scheduleRetry() {
        scheduledRetry = executor.schedule(ScrobbleQueue::flushNow, retryDelaySeconds, TimeUnit.SECONDS);
        retryDelaySeconds = Math.min(retryDelaySeconds * 2, MAX_RETRY_DELAY_SECONDS);
    }

    private static void cancelRetry() {
        if (scheduledRetry != null) {
            scheduledRetry.cancel(false);
            scheduledRetry = null;
        }
    }

    private static SharedPreferences preferences() {
        Context context = Utils.getContext();
        if (context == null) throw new IllegalStateException("App context not available yet");
        return context.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static List<Listen> load() {
        List<Listen> pending = new ArrayList<>();
        try {
            String stored = preferences().getString(KEY_PENDING, null);
            if (stored == null || stored.isEmpty()) return pending;

            JSONArray array = new JSONArray(stored);
            for (int i = 0, length = array.length(); i < length; i++) {
                JSONObject json = array.optJSONObject(i);
                Listen listen = json == null ? null : Listen.fromJson(json);
                if (listen != null) pending.add(listen);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not read pending Maloja scrobbles", ex);
        }
        return pending;
    }

    private static void save(List<Listen> pending) {
        try {
            JSONArray array = new JSONArray();
            for (Listen listen : pending) {
                array.put(listen.toJson());
            }
            SharedPreferences.Editor editor = preferences().edit();
            if (pending.isEmpty()) {
                editor.remove(KEY_PENDING);
            } else {
                editor.putString(KEY_PENDING, array.toString());
            }
            // Synchronous, since this already runs off the main thread and must survive a kill.
            editor.commit();
        } catch (Exception ex) {
            Logger.printException(() -> "Could not save pending Maloja scrobbles", ex);
        }
    }

    private ScrobbleQueue() {
    }
}
