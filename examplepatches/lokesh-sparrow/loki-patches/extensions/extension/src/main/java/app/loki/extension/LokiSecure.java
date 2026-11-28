package app.loki.extension;

import android.view.SurfaceView;
import android.view.Window;

/**
 * Stands in for the calls apps use to blacklist a window from screenshots and screen recording. The secure bit
 * (FLAG_SECURE, 0x2000) is dropped from every request, so the window behaves as an ordinary one. Everything else
 * the caller asked for is passed through unchanged. None of this can throw.
 */
public final class LokiSecure {
    private static final int FLAG_SECURE = 0x2000;

    private LokiSecure() {
    }

    /** The Allow screenshots switch (on unless the user turned it off). */
    private static boolean allowed() {
        return LokiSwitches.imoOn(LokiSwitches.IMO_SCREENSHOTS);
    }

    public static void addFlags(Window window, int flags) {
        window.addFlags(allowed() ? flags & ~FLAG_SECURE : flags);
    }

    public static void setFlags(Window window, int flags, int mask) {
        if (allowed()) {
            window.setFlags(flags & ~FLAG_SECURE, mask & ~FLAG_SECURE);
        } else {
            window.setFlags(flags, mask);
        }
    }

    public static void setSecure(SurfaceView view, boolean secure) {
        view.setSecure(allowed() ? false : secure);
    }
}
