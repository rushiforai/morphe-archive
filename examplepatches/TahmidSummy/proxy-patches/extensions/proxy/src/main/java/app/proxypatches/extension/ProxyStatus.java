package app.proxypatches.extension;

import android.app.ActivityManager;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.util.Log;

import java.net.ConnectException;
import java.net.NoRouteToHostException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

import javax.net.ssl.SSLException;

/**
 * Tells the user when the proxy (not the website, not the phone's connection) is the reason the
 * app can't load anything. Fed by the forwarder with the real outcome of each proxy connection.
 * <p>
 * Shows a message only after {@link #FAILURES_BEFORE_MESSAGE} proxy failures in a row, spanning at
 * least {@link #MIN_PROBLEM_DURATION_MS}, with no success in between; at most once per
 * {@link #MIN_INTERVAL_MS}; only while the app is in the foreground; and only if Android says the
 * phone itself has working internet.
 */
final class ProxyStatus {
    private static final String TAG = "ProxyPatch";
    static final int FAILURES_BEFORE_MESSAGE = 3;
    /**
     * The failures must also span this long with no success in between. The app opens many
     * connections in parallel, so one momentary blip (e.g. a DNS hiccup at startup) can produce
     * several failures within milliseconds; that alone shouldn't trigger a message.
     */
    static final long MIN_PROBLEM_DURATION_MS = 8_000;
    static final long MIN_INTERVAL_MS = 60_000;

    enum Problem {
        UNREACHABLE("Can't reach your proxy (%s). The app stays offline until it's reachable again. " +
                "Check it in Proxy settings (long-press the app icon)."),
        UNKNOWN_HOST("Can't find your proxy's host name (%s). Check it in Proxy settings " +
                "(long-press the app icon)."),
        TLS("Secure (TLS) connection to your proxy failed (%s). If it's a plain HTTP proxy, set Proxy type " +
                "to HTTP in Proxy settings (long-press the app icon)."),
        LOGIN("Your proxy rejected the login (%s). Check the username and password in Proxy settings " +
                "(long-press the app icon)."),
        REFUSED("Your proxy refused the connection (%s). The login may be wrong. Check Proxy settings " +
                "(long-press the app icon).");

        final String message;

        Problem(String message) { this.message = message; }
    }

    private static int consecutiveFailures;
    private static long firstFailureAt;
    private static long lastShownAt;

    private ProxyStatus() {}

    /** A connection through the proxy worked. */
    static synchronized void ok() {
        consecutiveFailures = 0;
    }

    /** A connection failed because of the proxy itself. */
    static void failed(Problem problem, String detail) {
        synchronized (ProxyStatus.class) {
            long now = System.currentTimeMillis();
            if (consecutiveFailures == 0) firstFailureAt = now;
            consecutiveFailures++;
            if (consecutiveFailures < FAILURES_BEFORE_MESSAGE) return;
            if (now - firstFailureAt < MIN_PROBLEM_DURATION_MS) return; // just a momentary blip so far
            if (now - lastShownAt < MIN_INTERVAL_MS) return;
            Context ctx = ProxySettings.context();
            if (ctx == null) return;
            if (!phoneIsOnline(ctx)) {
                Log.i(TAG, "proxy problem " + problem + " not shown: phone has no working internet");
                return;
            }
            if (!inForeground()) {
                Log.i(TAG, "proxy problem " + problem + " not shown: app in background");
                return;
            }
            lastShownAt = now;
        }
        String text = String.format(problem.message, detail);
        Log.i(TAG, "showing proxy problem: " + text);
        ProxySettings.toast(text);
    }

    /**
     * Classifies an exception from connecting to / talking to the proxy. Returns null when the
     * failure isn't the proxy's fault (e.g. SOCKS5 "host unreachable" for one website).
     */
    static Problem classify(Throwable t) {
        if (t instanceof Socks5.UnreachableException) return null; // a website, not the proxy
        if (t instanceof Socks5.SocksException) {
            String m = String.valueOf(t.getMessage()).toLowerCase();
            if (m.contains("password") || m.contains("login")) return Problem.LOGIN;
            if (m.contains("couldn't connect to")) return null; // destination-specific refusal
            return Problem.REFUSED;
        }
        if (t instanceof UnknownHostException) return Problem.UNKNOWN_HOST;
        if (t instanceof SSLException) return Problem.TLS;
        if (t instanceof ConnectException || t instanceof NoRouteToHostException
                || t instanceof SocketTimeoutException) return Problem.UNREACHABLE;
        return Problem.UNREACHABLE;
    }

    /** True if Android reports a network with validated internet access (or we can't tell). */
    private static boolean phoneIsOnline(Context ctx) {
        try {
            ConnectivityManager cm = ctx.getSystemService(ConnectivityManager.class);
            if (cm == null) return true;
            Network n = cm.getActiveNetwork();
            if (n == null) return false;
            NetworkCapabilities caps = cm.getNetworkCapabilities(n);
            return caps != null && caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);
        } catch (Throwable t) {
            return true;
        }
    }

    private static boolean inForeground() {
        try {
            ActivityManager.RunningAppProcessInfo info = new ActivityManager.RunningAppProcessInfo();
            ActivityManager.getMyMemoryState(info);
            return info.importance <= ActivityManager.RunningAppProcessInfo.IMPORTANCE_VISIBLE;
        } catch (Throwable t) {
            return true;
        }
    }
}
