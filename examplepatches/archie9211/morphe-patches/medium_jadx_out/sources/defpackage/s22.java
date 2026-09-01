package defpackage;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.RectF;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s22 extends tn0 {
    public final zu1 D;
    public final ArrayList E;
    public final RectF F;
    public final RectF G;
    public final RectF H;
    public final hp8 I;
    public final ad J;
    public float K;
    public boolean L;
    public final dn3 M;

    public s22(rc7 rc7Var, wo6 wo6Var, List list, bc7 bc7Var) {
        tn0 tn0Var;
        tn0 b4cVar;
        super(rc7Var, wo6Var);
        this.E = new ArrayList();
        this.F = new RectF();
        this.G = new RectF();
        this.H = new RectF();
        this.I = new hp8();
        this.J = new ad(10, (byte) 0);
        this.L = true;
        qu quVar = wo6Var.s;
        if (quVar != null) {
            zu1 zu1VarW = quVar.w();
            this.D = zu1VarW;
            d(zu1VarW);
            zu1VarW.a(this);
        } else {
            this.D = null;
        }
        ab7 ab7Var = new ab7(bc7Var.j.size());
        tn0 tn0Var2 = null;
        for (int size = list.size() - 1; size >= 0; size--) {
            wo6 wo6Var2 = (wo6) list.get(size);
            switch (sn0.a[wo6Var2.e.ordinal()]) {
                case 1:
                    b4cVar = new b4c(rc7Var, wo6Var2, this, bc7Var);
                    break;
                case 2:
                    b4cVar = new s22(rc7Var, wo6Var2, (List) bc7Var.c.get(wo6Var2.g), bc7Var);
                    break;
                case 3:
                    b4cVar = new ekc(rc7Var, wo6Var2);
                    break;
                case 4:
                    b4cVar = new fx5(rc7Var, wo6Var2);
                    break;
                case 5:
                    b4cVar = new ol8(rc7Var, wo6Var2);
                    break;
                case 6:
                    b4cVar = new njd(rc7Var, wo6Var2);
                    break;
                default:
                    h87.a("Unknown layer type " + wo6Var2.e);
                    b4cVar = null;
                    break;
            }
            if (b4cVar != null) {
                ab7Var.i(b4cVar.p.d, b4cVar);
                if (tn0Var2 != null) {
                    tn0Var2.s = b4cVar;
                    tn0Var2 = null;
                } else {
                    this.E.add(0, b4cVar);
                    int i = r22.a[wo6Var2.u.ordinal()];
                    if (i == 1 || i == 2) {
                        tn0Var2 = b4cVar;
                    }
                }
            }
        }
        for (int i2 = 0; i2 < ab7Var.k(); i2++) {
            tn0 tn0Var3 = (tn0) ab7Var.d(ab7Var.h(i2));
            if (tn0Var3 != null && (tn0Var = (tn0) ab7Var.d(tn0Var3.p.f)) != null) {
                tn0Var3.t = tn0Var;
            }
        }
        iq1 iq1Var = this.p.x;
        if (iq1Var != null) {
            this.M = new dn3(this, this, iq1Var);
        }
    }

    @Override // defpackage.tn0, defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        super.c(rectF, matrix, z);
        ArrayList arrayList = this.E;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            RectF rectF2 = this.F;
            rectF2.set(0.0f, 0.0f, 0.0f, 0.0f);
            ((tn0) arrayList.get(size)).c(rectF2, this.n, true);
            rectF.union(rectF2);
        }
    }

    @Override // defpackage.tn0
    public final void i(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        Canvas canvasE;
        t90 t90Var = xn6.a;
        boolean z = false;
        dn3 dn3Var = this.M;
        boolean z2 = (bn3Var == null && dn3Var == null) ? false : true;
        rc7 rc7Var = this.o;
        boolean z3 = rc7Var.p;
        ArrayList<tn0> arrayList = this.E;
        if ((z3 && arrayList.size() > 1 && i != 255) || (z2 && rc7Var.q)) {
            z = true;
        }
        int i2 = z ? 255 : i;
        if (dn3Var != null) {
            bn3Var = dn3Var.b(matrix, i2);
        }
        boolean z4 = this.L;
        wo6 wo6Var = this.p;
        RectF rectF = this.G;
        if (z4 || !"__container".equals(wo6Var.c)) {
            rectF.set(0.0f, 0.0f, wo6Var.o, wo6Var.p);
            matrix.mapRect(rectF);
        } else {
            rectF.setEmpty();
            for (tn0 tn0Var : arrayList) {
                RectF rectF2 = this.H;
                tn0Var.c(rectF2, matrix, true);
                rectF.union(rectF2);
            }
        }
        hp8 hp8Var = this.I;
        if (z) {
            ad adVar = this.J;
            adVar.c = null;
            adVar.b = i;
            if (bn3Var != null) {
                if (Color.alpha(bn3Var.d) > 0) {
                    adVar.c = bn3Var;
                } else {
                    adVar.c = null;
                }
                bn3Var = null;
            }
            canvasE = hp8Var.e(canvas, rectF, adVar);
        } else {
            canvasE = canvas;
        }
        canvas.save();
        if (canvas.clipRect(rectF)) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                ((tn0) arrayList.get(size)).e(canvasE, matrix, i2, bn3Var);
            }
        }
        if (z) {
            hp8Var.c();
        }
        canvas.restore();
        t90 t90Var2 = xn6.a;
    }

    @Override // defpackage.tn0
    public final void m(boolean z) {
        super.m(z);
        Iterator it2 = this.E.iterator();
        while (it2.hasNext()) {
            ((tn0) it2.next()).m(z);
        }
    }

    @Override // defpackage.tn0
    public final void n(float f) {
        t90 t90Var = xn6.a;
        this.K = f;
        super.n(f);
        wo6 wo6Var = this.p;
        zu1 zu1Var = this.D;
        if (zu1Var != null) {
            bc7 bc7Var = this.o.a;
            f = ((((Float) zu1Var.d()).floatValue() * wo6Var.b.n) - wo6Var.b.l) / ((bc7Var.m - bc7Var.l) + 0.01f);
        }
        if (zu1Var == null) {
            float f2 = wo6Var.n;
            bc7 bc7Var2 = wo6Var.b;
            f -= f2 / (bc7Var2.m - bc7Var2.l);
        }
        if (wo6Var.m != 0.0f && !"__container".equals(wo6Var.c)) {
            f /= wo6Var.m;
        }
        ArrayList arrayList = this.E;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            ((tn0) arrayList.get(size)).n(f);
        }
        t90 t90Var2 = xn6.a;
    }
}
