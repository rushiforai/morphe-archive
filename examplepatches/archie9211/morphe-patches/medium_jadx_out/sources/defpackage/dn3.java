package defpackage;

import android.graphics.Color;
import android.graphics.Matrix;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dn3 implements nn0 {
    public final tn0 a;
    public final tn0 b;
    public final zu1 c;
    public final zu1 d;
    public final zu1 e;
    public final zu1 f;
    public final zu1 g;
    public Matrix h;

    public dn3(tn0 tn0Var, tn0 tn0Var2, iq1 iq1Var) {
        this.b = tn0Var;
        this.a = tn0Var2;
        rn0 rn0VarW = ((pu) iq1Var.b).w();
        this.c = (zu1) rn0VarW;
        rn0VarW.a(this);
        tn0Var2.d(rn0VarW);
        zu1 zu1VarW = ((qu) iq1Var.c).w();
        this.d = zu1VarW;
        zu1VarW.a(this);
        tn0Var2.d(zu1VarW);
        zu1 zu1VarW2 = ((qu) iq1Var.d).w();
        this.e = zu1VarW2;
        zu1VarW2.a(this);
        tn0Var2.d(zu1VarW2);
        zu1 zu1VarW3 = ((qu) iq1Var.e).w();
        this.f = zu1VarW3;
        zu1VarW3.a(this);
        tn0Var2.d(zu1VarW3);
        zu1 zu1VarW4 = ((qu) iq1Var.f).w();
        this.g = zu1VarW4;
        zu1VarW4.a(this);
        tn0Var2.d(zu1VarW4);
    }

    @Override // defpackage.nn0
    public final void a() {
        this.b.a();
    }

    public final bn3 b(Matrix matrix, int i) {
        float fI = this.e.i() * 0.017453292f;
        float fFloatValue = ((Float) this.f.d()).floatValue();
        double d = fI;
        float fSin = ((float) Math.sin(d)) * fFloatValue;
        float fCos = ((float) Math.cos(d + 3.141592653589793d)) * fFloatValue;
        float fFloatValue2 = ((Float) this.g.d()).floatValue();
        int iIntValue = ((Integer) this.c.d()).intValue();
        int iArgb = Color.argb(Math.round((((Float) this.d.d()).floatValue() * i) / 255.0f), Color.red(iIntValue), Color.green(iIntValue), Color.blue(iIntValue));
        bn3 bn3Var = new bn3();
        bn3Var.a = fFloatValue2 * 0.33f;
        bn3Var.b = fSin;
        bn3Var.c = fCos;
        bn3Var.d = iArgb;
        bn3Var.e = null;
        bn3Var.c(matrix);
        if (this.h == null) {
            this.h = new Matrix();
        }
        this.a.w.d().invert(this.h);
        bn3Var.c(this.h);
        return bn3Var;
    }
}
