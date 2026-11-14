package app.morphe.extension.mapsautomotive.android9;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.view.contentcapture.ContentCaptureSession;

import java.lang.reflect.Field;
import java.util.List;

/**
 * Android 10 members of View (patch "Android 9 (API 28)"). Android 9 has no content capture, gesture exclusion, force
 * dark or attribute inspection: those are null or nothing. Transition visibility sets the visibility bits directly,
 * as AndroidX's transitions do below Android 10 (View.mViewFlags is on Android 9's light greylist).
 */
public final class View28 {
    public static final String OWNER = "Landroid/view/View;";
    private static final int VISIBILITY_MASK = 0x0000000C;
    private static Field viewFlags;
    private static boolean viewFlagsLooked;

    private View28() {
    }

    public static ContentCaptureSession getContentCaptureSession(View view) {
        if (Build.VERSION.SDK_INT >= 29) return view.getContentCaptureSession();
        return null;
    }

    public static long getUniqueDrawingId(View view) {
        if (Build.VERSION.SDK_INT >= 29) return view.getUniqueDrawingId();
        return System.identityHashCode(view);
    }

    public static Drawable getVerticalScrollbarThumbDrawable(View view) {
        if (Build.VERSION.SDK_INT >= 29) return view.getVerticalScrollbarThumbDrawable();
        return null;
    }

    public static void saveAttributeDataForStyleable(View view, Context context, int[] styleable, AttributeSet attrs,
                                                     TypedArray typedArray, int defStyleAttr, int defStyleRes) {
        if (Build.VERSION.SDK_INT >= 29) {
            view.saveAttributeDataForStyleable(context, styleable, attrs, typedArray, defStyleAttr, defStyleRes);
        }
    }

    public static void setForceDarkAllowed(View view, boolean allow) {
        if (Build.VERSION.SDK_INT >= 29) view.setForceDarkAllowed(allow);
    }

    public static void setSystemGestureExclusionRects(View view, List<Rect> rects) {
        if (Build.VERSION.SDK_INT >= 29) view.setSystemGestureExclusionRects(rects);
    }

    public static void setTransitionVisibility(View view, int visibility) {
        if (Build.VERSION.SDK_INT >= 29) {
            view.setTransitionVisibility(visibility);
            return;
        }
        synchronized (View28.class) {
            if (!viewFlagsLooked) {
                viewFlagsLooked = true;
                try {
                    Field field = View.class.getDeclaredField("mViewFlags");
                    field.setAccessible(true);
                    viewFlags = field;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    viewFlags = null;
                }
            }
        }
        Field field = viewFlags;
        if (field != null) {
            try {
                field.setInt(view, (field.getInt(view) & ~VISIBILITY_MASK) | visibility);
                return;
            } catch (IllegalAccessException | RuntimeException ignored) {
                // Fall back to the public setter.
            }
        }
        view.setVisibility(visibility);
    }
}
