package app.morphe.extension.boost;

import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;

/** Light touch feedback. Android's own touch feedback setting still applies. */
final class Haptics {
    private static final int TAG=0x7f5f0002;
    private Haptics() { }
    static void tick(View view) {
        if(view!=null && SurfaceSettingsActivity.enabled(view.getContext(),"touch_haptics"))view.performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
    }
    /** Ticks on release inside the view. The touch is not consumed, so the native click still runs. */
    static void tap(Object target) {
        if(!(target instanceof View))return;
        View view=(View)target;
        if(view.getTag(TAG)!=null)return;
        view.setTag(TAG,Boolean.TRUE);
        view.setOnTouchListener((touched,event)->{
            if(event.getActionMasked()==MotionEvent.ACTION_UP && event.getX()>=0 && event.getY()>=0 && event.getX()<=touched.getWidth() && event.getY()<=touched.getHeight())tick(touched);
            return false;
        });
    }
}
