package defpackage;

import android.view.WindowInsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class p4f extends o4f {
    public b36 s;

    public p4f(z4f z4fVar, p4f p4fVar) {
        super(z4fVar, p4fVar);
        this.s = null;
        this.s = p4fVar.s;
    }

    @Override // defpackage.w4f
    public z4f b() {
        return z4f.h(this.c.consumeStableInsets(), null);
    }

    @Override // defpackage.w4f
    public z4f c() {
        return z4f.h(this.c.consumeSystemWindowInsets(), null);
    }

    @Override // defpackage.w4f
    public final b36 l() {
        b36 b36Var = this.s;
        if (b36Var != null) {
            return b36Var;
        }
        WindowInsets windowInsets = this.c;
        b36 b36VarC = b36.c(windowInsets.getStableInsetLeft(), windowInsets.getStableInsetTop(), windowInsets.getStableInsetRight(), windowInsets.getStableInsetBottom());
        this.s = b36VarC;
        return b36VarC;
    }

    @Override // defpackage.w4f
    public boolean s() {
        return this.c.isConsumed();
    }

    @Override // defpackage.w4f
    public void z(b36 b36Var) {
        this.s = b36Var;
    }

    public p4f(z4f z4fVar, WindowInsets windowInsets) {
        super(z4fVar, windowInsets);
        this.s = null;
    }
}
