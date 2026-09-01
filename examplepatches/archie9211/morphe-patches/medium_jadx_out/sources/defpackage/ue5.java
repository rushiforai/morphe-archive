package defpackage;

import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ue5 implements qm3, nn0, v72 {
    public final boolean a;
    public final ab7 b;
    public final ab7 c;
    public final Path d;
    public final ao6 e;
    public final RectF f;
    public final ArrayList g;
    public final ze5 h;
    public final se5 i;
    public final zu1 j;
    public final se5 k;
    public final se5 l;
    public final rc7 m;
    public final int n;
    public final zu1 o;
    public float p;

    public ue5(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var, te5 te5Var) {
        Object obj = null;
        this.b = new ab7(obj);
        this.c = new ab7(obj);
        Path path = new Path();
        this.d = path;
        this.e = new ao6(1, 0);
        this.f = new RectF();
        this.g = new ArrayList();
        this.p = 0.0f;
        this.a = te5Var.g;
        this.m = rc7Var;
        this.h = te5Var.a;
        path.setFillType(te5Var.b);
        this.n = (int) (bc7Var.b() / 32.0f);
        rn0 rn0VarW = te5Var.c.w();
        this.i = (se5) rn0VarW;
        rn0VarW.a(this);
        tn0Var.d(rn0VarW);
        rn0 rn0VarW2 = te5Var.d.w();
        this.j = (zu1) rn0VarW2;
        rn0VarW2.a(this);
        tn0Var.d(rn0VarW2);
        rn0 rn0VarW3 = te5Var.e.w();
        this.k = (se5) rn0VarW3;
        rn0VarW3.a(this);
        tn0Var.d(rn0VarW3);
        rn0 rn0VarW4 = te5Var.f.w();
        this.l = (se5) rn0VarW4;
        rn0VarW4.a(this);
        tn0Var.d(rn0VarW4);
        if (tn0Var.j() != null) {
            zu1 zu1VarW = ((qu) tn0Var.j().a).w();
            this.o = zu1VarW;
            zu1VarW.a(this);
            tn0Var.d(zu1VarW);
        }
    }

    @Override // defpackage.nn0
    public final void a() {
        this.m.invalidateSelf();
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
        for (int i = 0; i < list2.size(); i++) {
            v72 v72Var = (v72) list2.get(i);
            if (v72Var instanceof l59) {
                this.g.add((l59) v72Var);
            }
        }
    }

    @Override // defpackage.qm3
    public final void c(RectF rectF, Matrix matrix, boolean z) {
        Path path = this.d;
        path.reset();
        int i = 0;
        while (true) {
            ArrayList arrayList = this.g;
            if (i >= arrayList.size()) {
                path.computeBounds(rectF, false);
                rectF.set(rectF.left - 1.0f, rectF.top - 1.0f, rectF.right + 1.0f, rectF.bottom + 1.0f);
                return;
            } else {
                path.addPath(((l59) arrayList.get(i)).h(), matrix);
                i++;
            }
        }
    }

    public final int d() {
        float f = this.k.d;
        float f2 = this.n;
        int iRound = Math.round(f * f2);
        int iRound2 = Math.round(this.l.d * f2);
        int iRound3 = Math.round(this.i.d * f2);
        int i = iRound != 0 ? 527 * iRound : 17;
        if (iRound2 != 0) {
            i = i * 31 * iRound2;
        }
        return iRound3 != 0 ? i * 31 * iRound3 : i;
    }

    @Override // defpackage.qm3
    public final void e(Canvas canvas, Matrix matrix, int i, bn3 bn3Var) {
        float[] fArr;
        int[] iArr;
        Shader linearGradient;
        int[] iArr2;
        if (this.a) {
            return;
        }
        t90 t90Var = xn6.a;
        Path path = this.d;
        path.reset();
        int i2 = 0;
        while (true) {
            ArrayList arrayList = this.g;
            if (i2 >= arrayList.size()) {
                break;
            }
            path.addPath(((l59) arrayList.get(i2)).h(), matrix);
            i2++;
        }
        path.computeBounds(this.f, false);
        ze5 ze5Var = this.h;
        ze5 ze5Var2 = ze5.LINEAR;
        se5 se5Var = this.i;
        se5 se5Var2 = this.l;
        se5 se5Var3 = this.k;
        if (ze5Var == ze5Var2) {
            long jD = d();
            ab7 ab7Var = this.b;
            linearGradient = (LinearGradient) ab7Var.d(jD);
            if (linearGradient == null) {
                PointF pointF = (PointF) se5Var3.d();
                PointF pointF2 = (PointF) se5Var2.d();
                re5 re5Var = (re5) se5Var.d();
                int[] iArr3 = re5Var.b;
                float[] fArr2 = re5Var.a;
                if (iArr3.length < 2) {
                    fArr2 = new float[]{0.0f, 1.0f};
                    iArr2 = new int[]{iArr3[0], iArr3[0]};
                } else {
                    iArr2 = iArr3;
                }
                linearGradient = new LinearGradient(pointF.x, pointF.y, pointF2.x, pointF2.y, iArr2, fArr2, Shader.TileMode.CLAMP);
                ab7Var.i(jD, linearGradient);
            }
        } else {
            long jD2 = d();
            ab7 ab7Var2 = this.c;
            RadialGradient radialGradient = (RadialGradient) ab7Var2.d(jD2);
            if (radialGradient != null) {
                linearGradient = radialGradient;
            } else {
                PointF pointF3 = (PointF) se5Var3.d();
                PointF pointF4 = (PointF) se5Var2.d();
                re5 re5Var2 = (re5) se5Var.d();
                int[] iArr4 = re5Var2.b;
                float[] fArr3 = re5Var2.a;
                if (iArr4.length < 2) {
                    iArr = new int[]{iArr4[0], iArr4[0]};
                    fArr = new float[]{0.0f, 1.0f};
                } else {
                    fArr = fArr3;
                    iArr = iArr4;
                }
                float f = pointF3.x;
                float f2 = pointF3.y;
                float fHypot = (float) Math.hypot(pointF4.x - f, pointF4.y - f2);
                if (fHypot <= 0.0f) {
                    fHypot = 0.001f;
                }
                RadialGradient radialGradient2 = new RadialGradient(f, f2, fHypot, iArr, fArr, Shader.TileMode.CLAMP);
                ab7Var2.i(jD2, radialGradient2);
                linearGradient = radialGradient2;
            }
        }
        linearGradient.setLocalMatrix(matrix);
        ao6 ao6Var = this.e;
        ao6Var.setShader(linearGradient);
        zu1 zu1Var = this.o;
        if (zu1Var != null) {
            float fFloatValue = ((Float) zu1Var.d()).floatValue();
            if (fFloatValue == 0.0f) {
                ao6Var.setMaskFilter(null);
            } else if (fFloatValue != this.p) {
                ao6Var.setMaskFilter(new BlurMaskFilter(fFloatValue, BlurMaskFilter.Blur.NORMAL));
            }
            this.p = fFloatValue;
        }
        float fIntValue = ((Integer) this.j.d()).intValue() / 100.0f;
        ao6Var.setAlpha(a18.c((int) (i * fIntValue)));
        if (bn3Var != null) {
            bn3Var.a((int) (fIntValue * 255.0f), ao6Var);
        }
        canvas.drawPath(path, ao6Var);
        t90 t90Var2 = xn6.a;
    }
}
