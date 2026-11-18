package app.afterglow.extension.playback;

import android.view.MotionEvent;
import android.view.ScaleGestureDetector;

import java.util.WeakHashMap;

/** The one-finger double-tap-and-drag gesture must not become pinch-to-fill. */
public final class FreeZoom {
    private static final WeakHashMap<ScaleGestureDetector, Boolean> QUICK_SCALE = new WeakHashMap<>();
    private FreeZoom() {}

    /** Called on the UI thread, immediately before the native detector sees a touch. */
    public static void onTouch(ScaleGestureDetector detector, MotionEvent event) {
        if (detector == null || event == null || event.getActionMasked() != MotionEvent.ACTION_DOWN) return;
        if (PlayerBehavior.disableFreeZoom()) {
            if (!QUICK_SCALE.containsKey(detector)) QUICK_SCALE.put(detector, detector.isQuickScaleEnabled());
            detector.setQuickScaleEnabled(false);
        } else {
            Boolean original = QUICK_SCALE.remove(detector);
            if (original != null) detector.setQuickScaleEnabled(original);
        }
    }
}
