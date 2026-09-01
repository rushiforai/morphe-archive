package defpackage;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b4c extends tn0 {
    public final f82 D;
    public final s22 E;
    public final dn3 F;

    public b4c(rc7 rc7Var, wo6 wo6Var, s22 s22Var, bc7 bc7Var) {
        super(rc7Var, wo6Var);
        this.E = s22Var;
        f82 f82Var = new f82(rc7Var, this, new x3c("__container", wo6Var.a, false), bc7Var);
        this.D = f82Var;
        List list = Collections.EMPTY_LIST;
        f82Var.b(list, list);
        iq1 iq1Var = this.p.x;
        if (iq1Var != null) {
            this.F = new dn3(this, this, iq1Var);
        }
    }

    @Override // defpackage.tn0, defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        super.c(rectF, matrix, z);
        this.D.c(rectF, this.n, z);
    }

    @Override // defpackage.tn0
    public final void i(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        dn3 dn3Var = this.F;
        if (dn3Var != null) {
            bn3Var = dn3Var.b(matrix, i);
        }
        this.D.e(canvas, matrix, i, bn3Var);
    }

    @Override // defpackage.tn0
    public final pkf j() {
        pkf pkfVar = this.p.w;
        return pkfVar != null ? pkfVar : this.E.p.w;
    }
}
