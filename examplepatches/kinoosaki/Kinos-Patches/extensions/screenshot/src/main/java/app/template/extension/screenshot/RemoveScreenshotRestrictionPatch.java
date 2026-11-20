package app.template.extension.screenshot;

import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewManager;
import android.view.Window;
import android.view.WindowManager;

/**
 * Redirect target for the universal "Remove screenshot restriction" patch. Every
 * {@code Window.addFlags}/{@code setFlags}/{@code setAttributes},
 * {@code WindowManager.addView}/{@code updateViewLayout} and {@code SurfaceView.setSecure}
 * call site in the patched app is rewritten to call through here, with the FLAG_SECURE bit
 * cleared (or the surface left non-secure) before the call; every direct
 * {@code WindowManager.LayoutParams.flags} assignment is followed by a
 * {@link #clearSecureFlag} call on the same params object. Other window flags pass through
 * unchanged.
 *
 * <p>The patch never rewrites this class, so the framework calls below stay real calls
 * (no recursion).
 */
@SuppressWarnings("unused")
public final class RemoveScreenshotRestrictionPatch {

    private RemoveScreenshotRestrictionPatch() {
    }

    public static void addFlags(Window window, int flags) {
        window.addFlags(flags & ~WindowManager.LayoutParams.FLAG_SECURE);
    }

    /**
     * The mask is kept as is: the bit is dropped from the value only, so an app's own
     * {@code setFlags(0, FLAG_SECURE)} still clears FLAG_SECURE (masking it out of the mask
     * would have left the bit as it was).
     */
    public static void setFlags(Window window, int flags, int mask) {
        window.setFlags(flags & ~WindowManager.LayoutParams.FLAG_SECURE, mask);
    }

    /**
     * Covers flags that entered the LayoutParams through its constructor
     * (w, h, type, flags, format) or any other path outside the patched dex: the
     * framework constructor's field write is not in the app's code, so the last
     * chance to strip the bit is when the params object reaches the window.
     */
    public static void setAttributes(Window window, WindowManager.LayoutParams attrs) {
        clearSecureFlag(attrs);
        window.setAttributes(attrs);
    }

    public static void addView(ViewManager viewManager, View view, ViewGroup.LayoutParams params) {
        maskSecure(params);
        viewManager.addView(view, params);
    }

    public static void addView(WindowManager windowManager, View view, ViewGroup.LayoutParams params) {
        maskSecure(params);
        windowManager.addView(view, params);
    }

    public static void updateViewLayout(ViewManager viewManager, View view, ViewGroup.LayoutParams params) {
        maskSecure(params);
        viewManager.updateViewLayout(view, params);
    }

    public static void updateViewLayout(WindowManager windowManager, View view, ViewGroup.LayoutParams params) {
        maskSecure(params);
        windowManager.updateViewLayout(view, params);
    }

    /** SurfaceView.setSecure(boolean): the surface is never made secure. */
    public static void setSecure(SurfaceView surfaceView, boolean isSecure) {
        surfaceView.setSecure(false);
    }

    /** Runs right after every app write to {@code WindowManager.LayoutParams.flags}. */
    public static void clearSecureFlag(WindowManager.LayoutParams params) {
        if (params != null) {
            params.flags &= ~WindowManager.LayoutParams.FLAG_SECURE;
        }
    }

    private static void maskSecure(ViewGroup.LayoutParams params) {
        if (params instanceof WindowManager.LayoutParams) {
            clearSecureFlag((WindowManager.LayoutParams) params);
        }
    }
}
