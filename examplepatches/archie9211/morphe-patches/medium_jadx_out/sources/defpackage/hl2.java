package defpackage;

import android.graphics.Matrix;
import android.os.Build;
import android.view.View;
import android.view.inputmethod.CursorAnchorInfo;
import android.view.inputmethod.InputMethodManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hl2 {
    public final mn a;
    public final ku3 b;
    public boolean d;
    public boolean e;
    public boolean f;
    public boolean g;
    public boolean h;
    public boolean i;
    public uid j;
    public qjd k;
    public yqa l;
    public zwa n;
    public zwa o;
    public final Object c = new Object();
    public x45 m = fn.B;
    public final CursorAnchorInfo.Builder p = new CursorAnchorInfo.Builder();
    public final float[] q = pk7.a();
    public final Matrix r = new Matrix();

    public hl2(mn mnVar, ku3 ku3Var) {
        this.a = mnVar;
        this.b = ku3Var;
    }

    public final void a() {
        boolean z;
        int i;
        float f;
        float f2;
        float f3;
        int i2;
        ku3 ku3Var = this.b;
        vq6 vq6Var = (vq6) ku3Var.c;
        InputMethodManager inputMethodManager = (InputMethodManager) vq6Var.getValue();
        View view = (View) ku3Var.b;
        if (inputMethodManager.isActive(view)) {
            x45 x45Var = this.m;
            float[] fArr = this.q;
            x45Var.invoke(new pk7(fArr));
            this.a.t(fArr);
            Matrix matrix = this.r;
            t40.M(matrix, fArr);
            uid uidVar = this.j;
            uidVar.getClass();
            long j = uidVar.b;
            yqa yqaVar = this.l;
            yqaVar.getClass();
            qjd qjdVar = this.k;
            qjdVar.getClass();
            zwa zwaVar = this.n;
            zwaVar.getClass();
            zwa zwaVar2 = this.o;
            zwaVar2.getClass();
            boolean z2 = this.f;
            boolean z3 = this.g;
            boolean z4 = this.h;
            boolean z5 = this.i;
            CursorAnchorInfo.Builder builder = this.p;
            builder.reset();
            builder.setMatrix(matrix);
            bkd bkdVar = uidVar.c;
            int iF = bkd.f(j);
            builder.setSelectionRange(iF, bkd.e(j));
            if (!z2 || iF < 0) {
                z = z3;
            } else {
                yqaVar.a(iF);
                zwa zwaVarC = qjdVar.c(iF);
                z = z3;
                float fU = iq7.u(zwaVarC.a, 0.0f, (int) (qjdVar.c >> 32));
                boolean zA = r40.A(zwaVar, fU, zwaVarC.b);
                boolean zA2 = r40.A(zwaVar, fU, zwaVarC.d);
                boolean z6 = qjdVar.a(iF) == mcb.Rtl;
                int i3 = (zA || zA2) ? 1 : 0;
                if (!zA || !zA2) {
                    i3 |= 2;
                }
                if (z6) {
                    i3 |= 4;
                }
                int i4 = i3;
                float f4 = zwaVarC.b;
                float f5 = zwaVarC.d;
                builder.setInsertionMarkerLocation(fU, f4, f5, f5, i4);
            }
            if (z) {
                int iF2 = bkdVar != null ? bkd.f(bkdVar.a) : -1;
                int iE = bkdVar != null ? bkd.e(bkdVar.a) : -1;
                if (iF2 >= 0 && iF2 < iE) {
                    builder.setComposingText(iF2, uidVar.a.b.subSequence(iF2, iE));
                    yqaVar.a(iF2);
                    yqaVar.a(iE);
                    float[] fArr2 = new float[(iE - iF2) * 4];
                    qjdVar.b.a(lk7.q(iF2, iE), fArr2);
                    int i5 = iF2;
                    while (i5 < iE) {
                        yqaVar.a(i5);
                        int i6 = (i5 - iF2) * 4;
                        float f6 = fArr2[i6];
                        float f7 = fArr2[i6 + 1];
                        int i7 = iE;
                        float f8 = fArr2[i6 + 2];
                        float f9 = fArr2[i6 + 3];
                        float[] fArr3 = fArr2;
                        int i8 = (zwaVar.a < f8 ? 1 : 0) & (f6 < zwaVar.c ? 1 : 0) & (zwaVar.b < f9 ? 1 : 0) & (f7 < zwaVar.d ? 1 : 0);
                        if (!r40.A(zwaVar, f6, f7) || !r40.A(zwaVar, f8, f9)) {
                            i8 |= 2;
                        }
                        int i9 = i8;
                        if (qjdVar.a(i5) == mcb.Rtl) {
                            i = i9 | 4;
                            i2 = i5;
                            f = f9;
                            f2 = f6;
                            f3 = f7;
                        } else {
                            i = i9;
                            f = f9;
                            f2 = f6;
                            f3 = f7;
                            i2 = i5;
                        }
                        builder.addCharacterBounds(i2, f2, f3, f8, f, i);
                        i5 = i2 + 1;
                        iE = i7;
                        fArr2 = fArr3;
                    }
                }
            }
            int i10 = Build.VERSION.SDK_INT;
            if (i10 >= 33 && z4) {
                v4.u(builder, zwaVar2);
            }
            if (i10 >= 34 && z5) {
                m4.a(builder, qjdVar, zwaVar);
            }
            ((InputMethodManager) vq6Var.getValue()).updateCursorAnchorInfo(view, builder.build());
            this.e = false;
        }
    }
}
