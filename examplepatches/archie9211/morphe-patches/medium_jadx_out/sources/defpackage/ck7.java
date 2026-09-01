package defpackage;

import android.graphics.RectF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ck7 extends gsa {
    public final int n;

    public ck7(int i) {
        this.n = i;
    }

    @Override // defpackage.gsa
    public final float k0(dk7 dk7Var) {
        float[] fArr = dk7Var.B;
        if (fArr != null) {
            return fArr[this.n];
        }
        return 0.0f;
    }

    @Override // defpackage.gsa
    public final void o0(dk7 dk7Var, float f) {
        float fA;
        float[] fArr = dk7Var.B;
        if (fArr != null) {
            int i = this.n;
            if (fArr[i] != f) {
                fArr[i] = f;
                f70 f70Var = dk7Var.D;
                if (f70Var != null) {
                    l3b l3bVar = dk7Var.s;
                    if (fArr != null) {
                        fA = (((fArr[3] + fArr[2]) - fArr[1]) - fArr[0]) / 2.0f;
                    } else {
                        RectF rectFE = dk7Var.e();
                        p3c p3cVarC = dk7Var.b.a.c();
                        l3bVar.getClass();
                        fA = (((dk7Var.b.a.c().h.a(rectFE) + p3cVarC.e.a(rectFE)) - dk7Var.b.a.c().g.a(rectFE)) - dk7Var.b.a.c().f.a(rectFE)) / 2.0f;
                    }
                    vj7 vj7Var = (vj7) f70Var.b;
                    int i2 = (int) (fA * 0.11f);
                    if (vj7Var.C != i2) {
                        vj7Var.C = i2;
                        vj7Var.r();
                        vj7Var.invalidate();
                    }
                }
                dk7Var.invalidateSelf();
            }
        }
    }
}
