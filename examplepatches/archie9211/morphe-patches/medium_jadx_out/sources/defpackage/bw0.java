package defpackage;

import android.content.res.ColorStateList;
import android.os.Build;
import android.view.View;
import android.view.Window;
import com.google.android.material.bottomsheet.BottomSheetBehavior;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bw0 extends uv0 {
    public final Boolean a;
    public final z4f b;
    public Window c;
    public boolean d;

    public bw0(View view, z4f z4fVar) {
        this.b = z4fVar;
        dk7 dk7Var = BottomSheetBehavior.B(view).j;
        ColorStateList backgroundTintList = dk7Var != null ? dk7Var.b.c : view.getBackgroundTintList();
        if (backgroundTintList != null) {
            this.a = Boolean.valueOf(hlg.E(backgroundTintList.getDefaultColor()));
            return;
        }
        ColorStateList colorStateListM = nm.m(view.getBackground());
        Integer numValueOf = colorStateListM != null ? Integer.valueOf(colorStateListM.getDefaultColor()) : null;
        if (numValueOf != null) {
            this.a = Boolean.valueOf(hlg.E(numValueOf.intValue()));
        } else {
            this.a = null;
        }
    }

    @Override // defpackage.uv0
    public final void a(View view) {
        d(view);
    }

    @Override // defpackage.uv0
    public final void b(View view) {
        d(view);
    }

    @Override // defpackage.uv0
    public final void c(View view, int i) {
        d(view);
    }

    public final void d(View view) {
        int top = view.getTop();
        z4f z4fVar = this.b;
        if (top < z4fVar.d()) {
            Window window = this.c;
            if (window != null) {
                Boolean bool = this.a;
                boolean zBooleanValue = bool == null ? this.d : bool.booleanValue();
                window.getDecorView();
                int i = Build.VERSION.SDK_INT;
                (i >= 35 ? new e5f(window) : i >= 30 ? new c5f(window) : i >= 26 ? new b5f(window) : new a5f(window)).C(zBooleanValue);
            }
            view.setPadding(view.getPaddingLeft(), z4fVar.d() - view.getTop(), view.getPaddingRight(), view.getPaddingBottom());
            return;
        }
        if (view.getTop() != 0) {
            Window window2 = this.c;
            if (window2 != null) {
                boolean z = this.d;
                window2.getDecorView();
                int i2 = Build.VERSION.SDK_INT;
                (i2 >= 35 ? new e5f(window2) : i2 >= 30 ? new c5f(window2) : i2 >= 26 ? new b5f(window2) : new a5f(window2)).C(z);
            }
            view.setPadding(view.getPaddingLeft(), 0, view.getPaddingRight(), view.getPaddingBottom());
        }
    }

    public final void e(Window window) {
        if (this.c == window) {
            return;
        }
        this.c = window;
        if (window != null) {
            window.getDecorView();
            int i = Build.VERSION.SDK_INT;
            this.d = (i >= 35 ? new e5f(window) : i >= 30 ? new c5f(window) : i >= 26 ? new b5f(window) : new a5f(window)).A();
        }
    }
}
