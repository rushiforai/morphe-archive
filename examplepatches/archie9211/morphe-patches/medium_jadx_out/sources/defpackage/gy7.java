package defpackage;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.view.MenuItem;
import android.widget.PopupWindow;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gy7 extends k27 implements rx7 {
    public static final Method E;
    public zg7 D;

    @Override // defpackage.rx7
    public final void I(lx7 lx7Var, sx7 sx7Var) {
        zg7 zg7Var = this.D;
        if (zg7Var != null) {
            zg7Var.I(lx7Var, sx7Var);
        }
    }

    @Override // defpackage.rx7
    public final void f(lx7 lx7Var, MenuItem menuItem) {
        zg7 zg7Var = this.D;
        if (zg7Var != null) {
            zg7Var.f(lx7Var, menuItem);
        }
    }

    @Override // defpackage.k27
    public final ym3 p(Context context, boolean z) {
        fy7 fy7Var = new fy7(context, z);
        fy7Var.setHoverListener(this);
        return fy7Var;
    }

    static {
        try {
            if (Build.VERSION.SDK_INT <= 28) {
                E = PopupWindow.class.getDeclaredMethod(mBTDfueQiGWRV.hnRdnhSgb, Boolean.TYPE);
            }
        } catch (NoSuchMethodException unused) {
            Log.i("MenuPopupWindow", "Could not find method setTouchModal() on PopupWindow. Oh well.");
        }
    }
}
