package defpackage;

import android.graphics.Canvas;
import android.graphics.Matrix;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vuc extends ao0 {
    public final boolean p;
    public final zu1 q;

    public vuc(rc7 rc7Var, tn0 tn0Var, p4c p4cVar) {
        super(rc7Var, tn0Var, p4cVar.f.toPaintCap(), p4cVar.g.toPaintJoin(), p4cVar.h, p4cVar.d, p4cVar.e, p4cVar.b, p4cVar.a);
        this.p = p4cVar.i;
        rn0 rn0VarW = p4cVar.c.w();
        this.q = (zu1) rn0VarW;
        rn0VarW.a(this);
        tn0Var.d(rn0VarW);
    }

    @Override // defpackage.ao0, defpackage.qm3
    public final void e(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        if (this.p) {
            return;
        }
        zu1 zu1Var = this.q;
        zu1Var.getClass();
        t90 t90Var = xn6.a;
        this.i.setColor(zu1Var.k(zu1Var.c.d(), zu1Var.b()));
        super.e(canvas, matrix, i, bn3Var);
    }
}
