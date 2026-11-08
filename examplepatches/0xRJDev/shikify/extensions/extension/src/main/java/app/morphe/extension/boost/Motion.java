package app.morphe.extension.boost;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.StateListAnimator;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.os.Build;
import android.view.View;
import android.view.animation.PathInterpolator;

/** Shared Material 3 motion, so every surface moves with the same character. */
final class Motion {
    /** Material 3 emphasized easing. */
    static final TimeInterpolator EMPHASIZED=new PathInterpolator(0.2f,0f,0f,1f);
    /** A lightly damped spring that settles exactly on 1. */
    static final TimeInterpolator SPRING=time->time>=1 ? 1:(float)(1-Math.exp(-7*time)*Math.cos(9*time));
    private static final int PRESS_MS=90,RELEASE_MS=340,ENTER_MS=260;
    private Motion() { }
    static boolean enabled() {return Build.VERSION.SDK_INT<26 || ValueAnimator.areAnimatorsEnabled();}
    /** Scales a view while pressed. The platform drives it from the view's pressed state. */
    static void press(View view,float scale) {
        if(view.getTag(TAG)!=null)return;
        view.setTag(TAG,Boolean.TRUE);
        StateListAnimator states=new StateListAnimator();
        states.addState(new int[]{android.R.attr.state_pressed},scale(view,scale,PRESS_MS,EMPHASIZED));
        states.addState(new int[]{},scale(view,1,RELEASE_MS,SPRING));
        view.setStateListAnimator(states);
    }
    private static ObjectAnimator scale(View view,float value,int duration,TimeInterpolator interpolator) {
        ObjectAnimator animator=ObjectAnimator.ofPropertyValuesHolder(view,PropertyValuesHolder.ofFloat(View.SCALE_X,value),PropertyValuesHolder.ofFloat(View.SCALE_Y,value));
        animator.setDuration(duration);animator.setInterpolator(interpolator);return animator;
    }
    /** Fades a newly added floating surface in without moving it. */
    static void enter(View view) {
        if(!enabled())return;
        view.setAlpha(0);
        view.animate().alpha(1).setDuration(ENTER_MS).setInterpolator(EMPHASIZED).start();
    }
    /** Eases a value change on the display's own frames. */
    static ValueAnimator value(float from,float to,int duration) {
        ValueAnimator animator=ValueAnimator.ofFloat(from,to);animator.setDuration(duration);animator.setInterpolator(EMPHASIZED);return animator;
    }
    private static final int TAG=0x7f5f0001;
}
