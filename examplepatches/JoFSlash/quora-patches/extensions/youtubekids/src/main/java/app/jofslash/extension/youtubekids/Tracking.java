package app.jofslash.extension.youtubekids;

import android.net.Uri;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collection;

/**
 * Used by the Block tracking patch.
 */
@SuppressWarnings("unused")
public final class Tracking {
    private static final String TAG = "JoF";

    private Tracking() {
    }

    /**
     * Whether a ping the app is about to send (stats, ad and error pings, all through one sender)
     * is tracking. The watch statistics (tag "vss": /api/stats/playback, watchtime, delayplay)
     * are kept: signed out, Watch it again is filled from them on YouTube's side, and it stays
     * empty without the watchtime ping.
     */
    public static boolean blockPing(Uri uri, String tag) {
        try {
            if (uri == null) return false;
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null) return false;
            if (path == null) path = "";
            boolean block =
                    // Playback quality, ad tracking and error stats.
                    path.startsWith("/api/stats/qoe")
                    || path.startsWith("/api/stats/atr")
                    || path.startsWith("/api/stats/ads")
                    || path.startsWith("/api/stats/reliability_probe")
                    || path.startsWith("/ptracking")
                    || path.startsWith("/error_204")
                    || path.startsWith("/gen_204")
                    || "ecatcher".equals(tag)
                    // Ad and remarketing pings.
                    || "remarketing".equals(tag)
                    || "vastad".equals(tag)
                    || host.endsWith("doubleclick.net")
                    || host.endsWith("googleadservices.com")
                    || host.endsWith("googlesyndication.com");
            if (block) Log.i(TAG, "Blocked ping " + tag + " " + host + path);
            return block;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** A list that drops what is added, for the batches of interaction events (log_event). */
    public static final class DroppingList extends ArrayList<Object> {
        public DroppingList() {
            Log.i(TAG, "Dropping a log_event batch");
        }

        @Override
        public boolean add(Object o) {
            return false;
        }

        @Override
        public void add(int index, Object element) {
        }

        @Override
        public boolean addAll(Collection<?> c) {
            return false;
        }
    }

    /** Called with each batch of interaction events (log_event) before it is sent. */
    public static void droppedEvents() {
        Log.i(TAG, "Dropped a log_event batch");
    }
}
