package app.morphe.extension.mapsautomotive.android9;

import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.RenderNode;
import android.view.DisplayListCanvas;

/**
 * The Android 9 paths of the compat classes that need Android 9's hidden classes or members only our framework-named
 * classes have. Only Android 9 runs them, so only Android 9 loads this class: on Android 10 and newer the compat classes
 * reference nothing that fails to resolve, and ART verifies and compiles them as usual.
 */
final class Legacy28 {
    private Legacy28() {
    }

    /** A hardware canvas starts Z reordering with a reorder barrier; elsewhere there is nothing to do. */
    static void enableZ(Canvas canvas) {
        if (canvas instanceof DisplayListCanvas) ((DisplayListCanvas) canvas).insertReorderBarrier();
    }

    static void disableZ(Canvas canvas) {
        if (canvas instanceof DisplayListCanvas) ((DisplayListCanvas) canvas).insertInorderBarrier();
    }

    /**
     * As Android 10: only a hardware canvas draws render nodes, and a node without a display list draws nothing
     * (Android 9's canvas would throw IllegalStateException for it).
     */
    static void drawRenderNode(Canvas canvas, RenderNode renderNode) {
        if (!(canvas instanceof DisplayListCanvas)) {
            throw new IllegalArgumentException("Software rendering doesn't support drawRenderNode");
        }
        if (!renderNode.hasDisplayList()) return;
        ((DisplayListCanvas) canvas).drawRenderNode(renderNode.viewNode28());
    }

    static Canvas beginRecording(RenderNode renderNode) {
        return renderNode.beginRecording28();
    }

    private static boolean loggedOutlineRadius;

    /**
     * An outline radius for Android 9's OpenGL renderer: at most half the shorter side, as Skia draws it (Outline28).
     * An empty size keeps the radius, and Outline makes that outline empty itself; NaN stays NaN.
     */
    static float outlineRadius(int width, int height, float radius) {
        if (width <= 0 || height <= 0) return radius;
        float half = Math.min(width, height) / 2f;
        if (!(radius > half)) return radius;
        synchronized (Legacy28.class) {
            if (!loggedOutlineRadius) {
                loggedOutlineRadius = true;
                Android9.Log9.i("Android 9: an outline radius above half the shorter side is clamped (" + radius
                        + " to " + half + ")");
            }
        }
        return half;
    }

    /** The mode's PorterDuff mode, SRC_OVER (plain drawing) for an advanced mode or null. */
    static PorterDuff.Mode porterDuffOrSrcOver(BlendMode mode) {
        return BlendMode.porterDuffOrSrcOver28(mode);
    }

    /** The mode's PorterDuff mode, or null for an advanced mode or null. */
    static PorterDuff.Mode porterDuff(BlendMode mode) {
        return mode == null ? null : mode.porterDuffMode28();
    }
}
