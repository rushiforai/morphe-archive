package defpackage;

import android.os.Build;
import android.view.View;
import android.view.WindowInsets;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lte implements View.OnApplyWindowInsetsListener {
    public z4f a = null;
    public final /* synthetic */ View b;
    public final /* synthetic */ yp8 c;

    public lte(View view, yp8 yp8Var) {
        this.b = view;
        this.c = yp8Var;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        z4f z4fVarH = z4f.h(windowInsets, view);
        int i = Build.VERSION.SDK_INT;
        yp8 yp8Var = this.c;
        if (i < 30) {
            mte.a(windowInsets, this.b);
            if (z4fVarH.equals(this.a)) {
                return yp8Var.W(view, z4fVarH).g();
            }
        }
        this.a = z4fVarH;
        z4f z4fVarW = yp8Var.W(view, z4fVarH);
        if (i >= 30) {
            return z4fVarW.g();
        }
        WeakHashMap weakHashMap = ute.a;
        view.requestApplyInsets();
        return z4fVarW.g();
    }
}
