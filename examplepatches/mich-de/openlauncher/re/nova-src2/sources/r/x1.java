package r;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.widget.PopupWindow;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public final class x1 extends t1 {
    public static final Method D;
    public q.c C;

    static {
        try {
            if (Build.VERSION.SDK_INT <= 28) {
                D = PopupWindow.class.getDeclaredMethod("setTouchModal", Boolean.TYPE);
            }
        } catch (NoSuchMethodException unused) {
            Log.i("MenuPopupWindow", "Could not find method setTouchModal() on PopupWindow. Oh well.");
        }
    }

    @Override // r.t1
    public final g1 m(Context context, boolean z11) {
        w1 w1Var = new w1(context, z11);
        w1Var.o = this;
        return w1Var;
    }
}
