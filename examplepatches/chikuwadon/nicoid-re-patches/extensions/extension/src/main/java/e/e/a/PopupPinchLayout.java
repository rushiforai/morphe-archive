package e.e.a;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

/** Intercepts a two-finger gesture before child buttons/seek bars can handle it. */
public final class PopupPinchLayout extends LinearLayout {
    private WeakReference<Object> owner = new WeakReference<>(null);
    private boolean consuming, scaling, changed;
    private int firstId, secondId;
    private float startSpan, startHeight, ratio, anchorX, anchorY, fractionX, fractionY;

    public PopupPinchLayout(Context context, AttributeSet attrs) { super(context, attrs); }
    public void bind(Object service) { owner = new WeakReference<>(service); PlaybackReturn.bind(service); }

    private static Object field(Object object, String name) throws Exception {
        return object.getClass().getField(name).get(object);
    }
    private static Field staticField(Object object, String name) throws Exception {
        return object.getClass().getField(name);
    }
    private float span(MotionEvent event, int first, int second) {
        return (float) Math.hypot(event.getX(first) - event.getX(second),
                event.getY(first) - event.getY(second));
    }

    @Override public boolean dispatchTouchEvent(MotionEvent event) {
        Object service = owner.get();
        if (service == null) return super.dispatchTouchEvent(event);
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            // A fresh stream also clears state after a window detach or missing CANCEL.
            consuming = scaling = changed = false;
        }
        if (!consuming && action == MotionEvent.ACTION_POINTER_DOWN
                && event.getPointerCount() >= 2) {
            consuming = true;
            MotionEvent cancel = MotionEvent.obtain(event);
            cancel.setAction(MotionEvent.ACTION_CANCEL);
            super.dispatchTouchEvent(cancel); // Cancel child click/seek and the legacy GestureDetector.
            cancel.recycle();
            try {
                service.getClass().getField("f0").setFloat(service, 0f);
                View video = (View) field(service, "e");
                WindowManager.LayoutParams params = (WindowManager.LayoutParams) field(service, "U");
                firstId = event.getPointerId(0);
                secondId = event.getPointerId(1);
                startSpan = span(event, 0, 1);
                startHeight = video.getHeight();
                float width = video.getWidth();
                if (startSpan > 1 && startHeight > 0 && width > 0) {
                    ratio = width / startHeight;
                    float centerX = (event.getX(0) + event.getX(1)) / 2f;
                    float centerY = (event.getY(0) + event.getY(1)) / 2f;
                    fractionX = Math.max(0, Math.min(1, centerX / width));
                    fractionY = Math.max(0, Math.min(1, centerY / startHeight));
                    anchorX = params.x + centerX;
                    anchorY = params.y + centerY;
                    scaling = true;
                }
            } catch (Exception ex) { android.util.Log.w("nicoid-pinch", "Cannot begin resize", ex); }
        }
        if (!consuming) return super.dispatchTouchEvent(event);
        if (action == MotionEvent.ACTION_MOVE && scaling) {
            int first = event.findPointerIndex(firstId), second = event.findPointerIndex(secondId);
            if (first >= 0 && second >= 0) {
                try { resize(service, startHeight * span(event, first, second) / startSpan); }
                catch (Exception ex) {
                    scaling = false;
                    android.util.Log.w("nicoid-pinch", "Cannot resize popup", ex);
                }
            } else scaling = false;
        }
        if (action == MotionEvent.ACTION_POINTER_UP) {
            int lifted = event.getPointerId(event.getActionIndex());
            if (lifted == firstId || lifted == secondId) scaling = false;
        }
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            if (changed) save(service);
            consuming = scaling = changed = false;
        }
        // Consume remaining one-finger events until UP: no jump, seek or tap after a pinch.
        return true;
    }

    private void resize(Object service, float requestedHeight) throws Exception {
        WindowManager.LayoutParams params = (WindowManager.LayoutParams) field(service, "U");
        int screenWidth = (Integer) field(service, "o");
        int screenHeight = (Integer) field(service, "p") - Math.max(0, (Integer) field(service, "l"));
        float density = getResources().getDisplayMetrics().density;
        float minHeight = Math.max((Float) field(service, "T"), Math.max(90 * density, 160 * density / ratio));
        int[] bounds = PopupPinchGeometry.bounds(requestedHeight, ratio, minHeight,
                (Float) field(service, "S"), screenWidth, screenHeight,
                anchorX, anchorY, fractionX, fractionY);
        View video = (View) field(service, "e");
        View controls = (View) field(service, "w");
        Object renderer = staticField(service, "k0").get(null);
        if (renderer != null) ((View) field(renderer, "a")).setLayoutParams(
                new LinearLayout.LayoutParams(bounds[0], bounds[1]));
        video.setLayoutParams(new LinearLayout.LayoutParams(bounds[0], bounds[1]));
        controls.setLayoutParams(new LinearLayout.LayoutParams(bounds[0], bounds[1]));
        params.x = bounds[2];
        params.y = bounds[3];
        staticField(service, "w0").setFloat(null, bounds[1]);
        staticField(service, "u0").setInt(null, bounds[2]);
        staticField(service, "v0").setInt(null, bounds[3]);
        ((WindowManager) field(service, "b")).updateViewLayout((View) field(service, "a"), params);
        changed = true;
    }

    private void save(Object service) {
        try {
            View video = (View) field(service, "e");
            // Layout may still be pending after the last MOVE; use the requested LayoutParams.
            android.view.ViewGroup.LayoutParams size = video.getLayoutParams();
            WindowManager.LayoutParams params = (WindowManager.LayoutParams) field(service, "U");
            ((SharedPreferences) field(service, "Q")).edit()
                    .putInt("pop_ivw", size.width).putInt("pop_poh", size.height)
                    .putInt("pop_pox", params.x).putInt("pop_poy", params.y).apply();
        } catch (Exception ex) { android.util.Log.w("nicoid-pinch", "Cannot save popup size", ex); }
    }
}
