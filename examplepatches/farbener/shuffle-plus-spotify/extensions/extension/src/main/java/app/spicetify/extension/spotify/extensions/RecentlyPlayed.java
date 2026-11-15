package app.spicetify.extension.spotify.extensions;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Remembers the songs played in the last few hours, so a shuffle can put them last. A song counts as
 * played once it has been the current track for {@link #COUNT_AFTER_MILLIS}, so skipping past it doesn't.
 */
final class RecentlyPlayed {
    private static final String PREFERENCES = "shuffleplus_recent";
    private static final long COUNT_AFTER_MILLIS = 30_000;
    private static final long HOUR_MILLIS = 3_600_000;
    private static volatile String pendingUri;

    private RecentlyPlayed() {}

    /** Replaced by the patch with the "hours" option. 0 turns this off. */
    private static int hours() {
        return 24;
    }

    /** Starts watching the player state. Called once, on the bridge thread. */
    static void watch(Context context) {
        if (hours() <= 0 || context == null) return;
        PlayerBridge.addStateListener(state -> onState(context, state));
    }

    /** On the bridge thread: a new song is recorded when it's still the current one after the delay. */
    private static void onState(Context context, Esperanto.PlayerState state) {
        String uri = state.trackUri;
        if (uri == null || state.advertisement || state.episode || uri.equals(pendingUri)) return;
        pendingUri = uri;
        PlayerBridge.postDelayed(() -> {
            Esperanto.PlayerState now = PlayerBridge.lastState();
            if (now != null && uri.equals(now.trackUri)) record(context, uri);
        }, COUNT_AFTER_MILLIS);
    }

    private static void record(Context context, String uri) {
        try {
            SharedPreferences preferences = preferences(context);
            SharedPreferences.Editor edit = preferences.edit();
            long now = System.currentTimeMillis();
            long oldest = now - hours() * HOUR_MILLIS;
            for (Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
                if ((Long) entry.getValue() < oldest) edit.remove(entry.getKey()); // keeps the file small
            }
            edit.putLong(uri, now).apply();
        } catch (Throwable e) {
            Log.w("ShufflePlus", "Couldn't remember a played song", e);
        }
    }

    /** {@code uris} with the recently played ones moved to the end, each group keeping its order. */
    static List<String> recentLast(Context context, List<String> uris) {
        if (hours() <= 0) return uris;
        try {
            Map<String, ?> played = preferences(context).getAll();
            long oldest = System.currentTimeMillis() - hours() * HOUR_MILLIS;
            List<String> fresh = new ArrayList<>(uris.size());
            List<String> recent = new ArrayList<>();
            for (String uri : uris) {
                Object when = played.get(uri);
                (when != null && (Long) when >= oldest ? recent : fresh).add(uri);
            }
            fresh.addAll(recent);
            Log.i("ShufflePlus", "Moved " + recent.size() + " recently played songs to the end");
            return fresh;
        } catch (Throwable e) {
            Log.w("ShufflePlus", "Couldn't read the recently played songs", e);
            return uris;
        }
    }

    private static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }
}
