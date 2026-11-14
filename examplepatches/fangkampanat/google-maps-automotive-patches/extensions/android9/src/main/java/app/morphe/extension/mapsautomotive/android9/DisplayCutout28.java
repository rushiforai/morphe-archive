package app.morphe.extension.mapsautomotive.android9;

import android.graphics.Rect;
import android.os.Build;
import android.view.DisplayCutout;

/**
 * Android 10's per-side cutout rects (patch "Android 9 (API 28)"): on Android 9 taken from the bounding rects, by the
 * edge each touches within that side's safe inset; an empty rect where there is none, as in Android 10.
 */
public final class DisplayCutout28 {
    public static final String OWNER = "Landroid/view/DisplayCutout;";
    private static final int LEFT = 0, TOP = 1, RIGHT = 2, BOTTOM = 3;

    private DisplayCutout28() {
    }

    public static Rect getBoundingRectLeft(DisplayCutout cutout) {
        if (Build.VERSION.SDK_INT >= 29) return cutout.getBoundingRectLeft();
        return side(cutout, LEFT);
    }

    public static Rect getBoundingRectTop(DisplayCutout cutout) {
        if (Build.VERSION.SDK_INT >= 29) return cutout.getBoundingRectTop();
        return side(cutout, TOP);
    }

    public static Rect getBoundingRectRight(DisplayCutout cutout) {
        if (Build.VERSION.SDK_INT >= 29) return cutout.getBoundingRectRight();
        return side(cutout, RIGHT);
    }

    public static Rect getBoundingRectBottom(DisplayCutout cutout) {
        if (Build.VERSION.SDK_INT >= 29) return cutout.getBoundingRectBottom();
        return side(cutout, BOTTOM);
    }

    private static Rect side(DisplayCutout cutout, int side) {
        for (Rect rect : cutout.getBoundingRects()) {
            boolean match;
            switch (side) {
                case LEFT:
                    match = cutout.getSafeInsetLeft() > 0 && rect.left <= 0 && rect.right <= cutout.getSafeInsetLeft();
                    break;
                case TOP:
                    match = cutout.getSafeInsetTop() > 0 && rect.top <= 0 && rect.bottom <= cutout.getSafeInsetTop();
                    break;
                case RIGHT:
                    match = cutout.getSafeInsetRight() > 0 && rect.left > cutout.getSafeInsetLeft()
                            && rect.width() <= cutout.getSafeInsetRight();
                    break;
                default:
                    match = cutout.getSafeInsetBottom() > 0 && rect.top > cutout.getSafeInsetTop()
                            && rect.height() <= cutout.getSafeInsetBottom();
                    break;
            }
            if (match) return new Rect(rect);
        }
        return new Rect();
    }
}
