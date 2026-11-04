package semicoloncolonel.mobilestream.extension.yttv.privacy;

import android.net.Uri;
import android.util.Log;

/**
 * Decides which of YouTube TV's HTTP pings to drop. Every ping goes through
 * one method of the app's ping service, which "Block telemetry" hooks.
 *
 * Dropped: quality-of-experience reports (device model, chip, battery,
 * network, and buffer health), attestation and timing reports, reliability
 * probes, error reports, view tracking, and ad measurement pings.
 *
 * Kept: playback and watch-time reports, which drive resume points and watch
 * history. The player heartbeat, which YouTube TV uses for location and
 * stream limits, is not a ping and never reaches this filter.
 */
@SuppressWarnings("unused")
public final class PingFilter {
    private static final String TAG = "MSP-YTTV-PING";

    private static final String[] BLOCKED_PATHS = {
            "/api/stats/qoe",
            "/api/stats/atr",
            "/api/stats/delayplay",
            "/api/stats/reliability_probe",
            "/api/stats/ads",
            "/csi_204",
            "/error_204",
            "/ptracking",
            "/pagead/",
            "/pcs/activeview",
    };

    private static final String[] BLOCKED_HOST_SUFFIXES = {
            "doubleclick.net",
            "googlesyndication.com",
            "googleadservices.com",
            "csi.gstatic.com",
    };

    private PingFilter() {
    }

    /** Injection point: the ping service, before it builds a request. */
    public static boolean shouldBlock(Uri uri) {
        try {
            if (uri == null) return false;
            String host = uri.getHost();
            if (host != null) {
                for (String suffix : BLOCKED_HOST_SUFFIXES) {
                    if (host.equals(suffix) || host.endsWith("." + suffix)) return block(host);
                }
            }
            String path = uri.getPath();
            if (path != null) {
                for (String blocked : BLOCKED_PATHS) {
                    if (path.startsWith(blocked)) return block(path);
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "shouldBlock failure", ex);
        }
        return false;
    }

    private static boolean block(String what) {
        Log.d(TAG, "Blocked " + what);
        return true;
    }
}
