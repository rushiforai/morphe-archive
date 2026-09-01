package defpackage;

import android.view.WindowInsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class h4f extends n4f {
    public final WindowInsets.Builder e;

    public h4f(z4f z4fVar) {
        super(z4fVar);
        WindowInsets windowInsetsG = z4fVar.g();
        this.e = windowInsetsG != null ? cs0.e(windowInsetsG) : cs0.d();
    }

    @Override // defpackage.n4f
    public z4f b() {
        a();
        z4f z4fVarH = z4f.h(this.e.build(), null);
        b36[] b36VarArr = this.b;
        w4f w4fVar = z4fVarH.a;
        w4fVar.w(b36VarArr);
        w4fVar.v(null);
        w4fVar.B(this.c);
        w4fVar.C(this.d);
        return z4fVarH;
    }

    @Override // defpackage.n4f
    public void e(b36 b36Var) {
        this.e.setMandatorySystemGestureInsets(b36Var.e());
    }

    @Override // defpackage.n4f
    public void f(b36 b36Var) {
        this.e.setStableInsets(b36Var.e());
    }

    @Override // defpackage.n4f
    public void g(b36 b36Var) {
        this.e.setSystemGestureInsets(b36Var.e());
    }

    @Override // defpackage.n4f
    public void h(b36 b36Var) {
        this.e.setSystemWindowInsets(b36Var.e());
    }

    @Override // defpackage.n4f
    public void i(b36 b36Var) {
        this.e.setTappableElementInsets(b36Var.e());
    }

    public h4f() {
        this.e = cs0.d();
    }
}
