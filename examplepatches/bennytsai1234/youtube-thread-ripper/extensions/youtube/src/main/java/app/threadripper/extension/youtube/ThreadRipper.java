package app.threadripper.extension.youtube;

import android.net.Uri;

import org.chromium.net.CronetEngine;

import java.io.IOException;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Injection points for the app's UMP media data source, the class that loads /videoplayback
 * byte ranges of non-SABR streams (used when Morphe "Spoof video streams" selects a client
 * without SABR, such as visionOS or Android VR Downgraded).
 *
 * Each hook returns {@link #NOT_HANDLED} when the app's own code should run unchanged.
 */
@SuppressWarnings("unused")
public final class ThreadRipper {
    public static final int NOT_HANDLED = -2;

    /** Sessions keyed by the app's data source instance. */
    private static final Map<Object, Session> sessions = new WeakHashMap<>();

    private ThreadRipper() {
    }

    /**
     * Injection point: start of DataSource.open(DataSpec).
     *
     * @return the number of bytes that will be read, or {@link #NOT_HANDLED}.
     */
    public static long open(Object dataSource, Object dataSpec) throws IOException {
        close(dataSource);
        Config config;
        MediaRequest request;
        try {
            config = Config.get();
            request = config.enabled || config.log ? MediaRequest.parse(dataSpec) : null;
        } catch (Exception ex) {
            Log.e("open failure, using the app's loader", ex);
            return NOT_HANDLED;
        }
        long result = open(dataSource, dataSpec, request, config);
        if (config.log) Timing.open(dataSource, request, result != NOT_HANDLED);
        return result;
    }

    private static long open(Object dataSource, Object dataSpec, MediaRequest request, Config config) throws IOException {
        try {
            if (!config.enabled) return NOT_HANDLED;

            if (request == null) {
                Log.d("Unreadable " + dataSpec);
                return NOT_HANDLED;
            }
            if (!eligible(request, config)) {
                Log.d("Native " + request.method + " " + request.uri.getHost() + request.uri.getPath()
                        + " itag=" + request.uri.getQueryParameter("itag") + " c=" + request.uri.getQueryParameter("c")
                        + " " + request.position + "+" + request.length);
                return NOT_HANDLED;
            }

            CronetEngine engine = MediaRequest.findEngine(dataSource);
            if (engine == null) {
                Log.d("No CronetEngine in " + dataSource.getClass().getName());
                return NOT_HANDLED;
            }

            Session session = new Session(engine, request.uri.toString(), request.headers,
                    request.position, request.length, config);
            if (!session.open()) return NOT_HANDLED;
            synchronized (sessions) {
                sessions.put(dataSource, session);
            }
            Log.d("Open itag " + request.uri.getQueryParameter("itag") + " " + request.method + " "
                    + request.position + "+" + request.length);
            return request.length;
        } catch (IOException ex) {
            throw ex;
        } catch (Exception ex) {
            Log.e("open failure, using the app's loader", ex);
            return NOT_HANDLED;
        }
    }

    /**
     * Injection point: start of DataReader.read(byte[], int, int).
     *
     * @return bytes read, -1 at the end of input, or {@link #NOT_HANDLED}.
     */
    public static int read(Object dataSource, byte[] buffer, int offset, int length) throws IOException {
        Timing.read(dataSource);
        Session session;
        synchronized (sessions) {
            session = sessions.get(dataSource);
        }
        return session == null ? NOT_HANDLED : session.read(buffer, offset, length);
    }

    /** Injection point: start of DataSource.close(). */
    public static void close(Object dataSource) {
        Session session;
        synchronized (sessions) {
            session = sessions.remove(dataSource);
        }
        if (session != null) session.close();
    }

    private static boolean eligible(MediaRequest r, Config config) {
        Uri uri = r.uri;
        String host = uri.getHost();
        if (host == null || !host.endsWith(".googlevideo.com")) return false;
        if (!"/videoplayback".equals(uri.getPath())) return false;
        if (!"GET".equals(r.method) && !"POST".equals(r.method)) return false; // POST here has no body.
        if (r.length < 0 || r.length < config.minSplitBytes) return false;
        // SABR and live segments are not byte-addressable files.
        if ("1".equals(uri.getQueryParameter("sabr"))) return false;
        if (uri.getQueryParameter("sq") != null || "1".equals(uri.getQueryParameter("live"))) return false;
        return true;
    }
}
