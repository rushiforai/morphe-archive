package r;

import android.transition.Transition;
import android.widget.PopupWindow;

/* loaded from: classes2.dex */
public abstract class u1 {
    public static void a(PopupWindow popupWindow, Transition transition) {
        popupWindow.setEnterTransition(transition);
    }

    public static void b(PopupWindow popupWindow, Transition transition) {
        popupWindow.setExitTransition(transition);
    }
}
