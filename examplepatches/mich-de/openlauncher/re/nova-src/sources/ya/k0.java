package ya;

import android.view.MotionEvent;

/* loaded from: classes.dex */
public interface k0 {
    default boolean G(int i5) {
        return false;
    }

    default void H() {
    }

    boolean k(MotionEvent motionEvent);

    boolean l(MotionEvent motionEvent);

    default int n(MotionEvent motionEvent) {
        return l(motionEvent) ? 1 : 0;
    }
}
