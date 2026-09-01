package defpackage;

import android.view.WindowInsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class r4f extends q4f {
    public b36 t;
    public b36 u;
    public b36 v;

    public r4f(z4f z4fVar, WindowInsets windowInsets) {
        super(z4fVar, windowInsets);
        this.t = null;
        this.u = null;
        this.v = null;
    }

    @Override // defpackage.w4f
    public b36 k() {
        b36 b36Var = this.u;
        if (b36Var != null) {
            return b36Var;
        }
        b36 b36VarD = b36.d(this.c.getMandatorySystemGestureInsets());
        this.u = b36VarD;
        return b36VarD;
    }

    @Override // defpackage.w4f
    public b36 m() {
        b36 b36Var = this.t;
        if (b36Var != null) {
            return b36Var;
        }
        b36 b36VarD = b36.d(this.c.getSystemGestureInsets());
        this.t = b36VarD;
        return b36VarD;
    }

    @Override // defpackage.w4f
    public b36 o() {
        b36 b36Var = this.v;
        if (b36Var != null) {
            return b36Var;
        }
        b36 b36VarD = b36.d(this.c.getTappableElementInsets());
        this.v = b36VarD;
        return b36VarD;
    }

    @Override // defpackage.o4f, defpackage.w4f
    public z4f r(int i, int i2, int i3, int i4) {
        return z4f.h(this.c.inset(i, i2, i3, i4), null);
    }

    public r4f(z4f z4fVar, r4f r4fVar) {
        super(z4fVar, r4fVar);
        this.t = null;
        this.u = null;
        this.v = null;
    }

    @Override // defpackage.p4f, defpackage.w4f
    public void z(b36 b36Var) {
    }
}
