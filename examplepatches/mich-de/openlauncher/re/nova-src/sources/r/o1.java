package r;

import android.graphics.Rect;
import android.widget.PopupWindow;

/* loaded from: classes2.dex */
public abstract class o1 {
    public static void a(PopupWindow popupWindow, Rect rect) {
        popupWindow.setEpicenterBounds(rect);
    }

    public static void b(PopupWindow popupWindow, boolean z11) {
        popupWindow.setIsClippedToScreen(z11);
    }
}
