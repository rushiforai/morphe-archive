package defpackage;

import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oj2 implements csd {
    public final hsd a;
    public final xx5 b;
    public final int c;

    public oj2(hsd hsdVar, xx5 xx5Var, int i) {
        this.a = hsdVar;
        this.b = xx5Var;
        this.c = i;
        if (i > 0) {
            return;
        }
        ay0.e("durationMillis must be > 0.");
        throw null;
    }

    @Override // defpackage.csd
    public final void a() {
        hsd hsdVar = this.a;
        Drawable drawableX = hsdVar.X();
        xx5 xx5Var = this.b;
        ew5 ew5VarA = xx5Var.a();
        boolean z = xx5Var instanceof w0d;
        hj2 hj2Var = new hj2(drawableX, ew5VarA != null ? dm2.x(ew5VarA, hsdVar.H().getResources()) : null, xx5Var.b().r, this.c, (z && ((w0d) xx5Var).g) ? false : true);
        if (z) {
            hsdVar.b(dm2.y(hj2Var));
        } else if (xx5Var instanceof r14) {
            hsdVar.n(dm2.y(hj2Var));
        } else {
            ygf.a();
        }
    }
}
