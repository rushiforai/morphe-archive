package app.threadripper.extension.youtube;

import android.os.SystemClock;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Startup timing for the first media requests of the process, logged for native and handled
 * requests alike: when each request is opened, and when the player first and second calls read()
 * on it (the first read follows open() returning, i.e. the response started; the second follows
 * the first bytes reaching the player). Times are milliseconds since the process started, so a
 * cold start splits into app startup, request, first bytes and (from MediaSession) first frame.
 */
final class Timing {
    private static final int MAX_REQUESTS = 8;
    private static final long PROCESS_START = android.os.Process.getStartElapsedRealtime();

    private static final Map<Object, int[]> reads = new WeakHashMap<>();
    private static int opened;

    private Timing() {
    }

    static synchronized void open(Object dataSource, MediaRequest request, boolean handled) {
        if (opened >= MAX_REQUESTS) return;
        int n = ++opened;
        reads.put(dataSource, new int[]{n, 0});
        Log.i("Startup open#" + n + " +" + sinceStart() + "ms handled=" + handled
                + (request == null ? "" : " itag=" + request.uri.getQueryParameter("itag") + " "
                + request.method + " " + request.position + "+" + request.length));
    }

    static void read(Object dataSource) {
        if (opened == 0) return;
        synchronized (Timing.class) {
            int[] r = reads.get(dataSource);
            if (r == null || r[1] >= 2) return;
            r[1]++;
            Log.i("Startup read" + r[1] + "#" + r[0] + " +" + sinceStart() + "ms");
            if (r[1] >= 2) reads.remove(dataSource);
        }
    }

    private static long sinceStart() {
        return SystemClock.elapsedRealtime() - PROCESS_START;
    }
}
