package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.view.MotionEvent;

/**
 * Android 10 members of MotionEvent (patch "Android 9 (API 28)"): no classification on Android 9; a pointer's raw
 * position is its position plus the event's raw offset, which is the same for every pointer.
 */
public final class MotionEvent28 {
    public static final String OWNER = "Landroid/view/MotionEvent;";

    private MotionEvent28() {
    }

    public static int getClassification(MotionEvent event) {
        if (Build.VERSION.SDK_INT >= 29) return event.getClassification();
        return 0; // CLASSIFICATION_NONE
    }

    public static float getRawX(MotionEvent event, int pointerIndex) {
        if (Build.VERSION.SDK_INT >= 29) return event.getRawX(pointerIndex);
        return event.getX(pointerIndex) + event.getRawX() - event.getX();
    }

    public static float getRawY(MotionEvent event, int pointerIndex) {
        if (Build.VERSION.SDK_INT >= 29) return event.getRawY(pointerIndex);
        return event.getY(pointerIndex) + event.getRawY() - event.getY();
    }
}
