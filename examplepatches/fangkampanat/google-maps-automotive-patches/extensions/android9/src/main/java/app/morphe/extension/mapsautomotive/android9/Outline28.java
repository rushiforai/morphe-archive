package app.morphe.extension.mapsautomotive.android9;

import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;

/**
 * Outline (patch "Android 9 (API 28)").
 * <p>
 * setConvexPath: Android 10 takes any path, Android 9 throws for a concave one. Compose's shapes reach it through the
 * core patch's ApiCompat.setPath. On Android 9 a concave path's outline is its bounds, so the content stays visible and
 * its shadow is a rectangle.
 * <p>
 * setRoundRect: Android 9's OpenGL renderer (FrameBuilder, debug.hwui.renderer=opengl) clips a view to its outline
 * with the radius as given, while Skia and Android 10 shrink a radius above half the shorter side. Maps' androidx
 * CardViews use a "full" corner token (112.5 px on 63 px map buttons), so on that renderer their content was clipped
 * to a lens, or to nothing in square cards (the issue #11 emulator test). On Android 9 the radius is clamped to half
 * the shorter side, which is what Skia draws.
 */
public final class Outline28 {
    public static final String OWNER = "Landroid/graphics/Outline;";
    private static boolean logged;

    private Outline28() {
    }

    // The clamp lives in Legacy28: a helper here would be a public static method after R8, so a stray route.
    public static void setRoundRect(Outline outline, Rect rect, float radius) {
        if (Build.VERSION.SDK_INT >= 29) {
            outline.setRoundRect(rect, radius);
            return;
        }
        outline.setRoundRect(rect, Legacy28.outlineRadius(rect.width(), rect.height(), radius));
    }

    public static void setRoundRect(Outline outline, int left, int top, int right, int bottom, float radius) {
        if (Build.VERSION.SDK_INT >= 29) {
            outline.setRoundRect(left, top, right, bottom, radius);
            return;
        }
        outline.setRoundRect(left, top, right, bottom, Legacy28.outlineRadius(right - left, bottom - top, radius));
    }

    public static void setConvexPath(Outline outline, Path path) {
        if (Build.VERSION.SDK_INT >= 29 || path.isConvex()) {
            outline.setConvexPath(path);
            return;
        }
        RectF bounds = new RectF();
        path.computeBounds(bounds, true);
        Rect rect = new Rect();
        bounds.roundOut(rect);
        outline.setRect(rect);
        synchronized (Outline28.class) {
            if (!logged) {
                logged = true;
                Android9.Log9.i("Android 9: a concave outline path uses its bounds");
            }
        }
    }
}
