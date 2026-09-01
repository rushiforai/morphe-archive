package defpackage;

import android.graphics.Matrix;
import android.os.Build;
import android.view.View;
import android.view.inputmethod.CursorAnchorInfo;
import android.view.inputmethod.InputMethodManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gx6 {
    public final bq a;
    public final s26 b;
    public boolean d;
    public boolean e;
    public boolean f;
    public boolean g;
    public boolean h;
    public boolean i;
    public uid j;
    public qjd k;
    public yqa l;
    public zwa m;
    public zwa n;
    public final Object c = new Object();
    public final CursorAnchorInfo.Builder o = new CursorAnchorInfo.Builder();
    public final float[] p = pk7.a();
    public final Matrix q = new Matrix();

    public gx6(bq bqVar, s26 s26Var) {
        this.a = bqVar;
        this.b = s26Var;
    }

    public final void a() {
        boolean z;
        int i;
        float f;
        float f2;
        float f3;
        int i2;
        s26 s26Var = this.b;
        InputMethodManager inputMethodManagerI0 = s26Var.i0();
        View view = (View) s26Var.b;
        if (!inputMethodManagerI0.isActive(view) || this.j == null || this.l == null || this.k == null || this.m == null || this.n == null) {
            return;
        }
        float[] fArr = this.p;
        pk7.d(fArr);
        hp6 hp6Var = (hp6) this.a.a.r.getValue();
        if (hp6Var != null) {
            if (!hp6Var.m()) {
                hp6Var = null;
            }
            if (hp6Var != null) {
                hp6Var.h(fArr);
            }
        }
        zwa zwaVar = this.n;
        zwaVar.getClass();
        float f4 = -zwaVar.a;
        zwa zwaVar2 = this.n;
        zwaVar2.getClass();
        pk7.h(fArr, f4, -zwaVar2.b);
        Matrix matrix = this.q;
        t40.M(matrix, fArr);
        uid uidVar = this.j;
        uidVar.getClass();
        long j = uidVar.b;
        yqa yqaVar = this.l;
        yqaVar.getClass();
        qjd qjdVar = this.k;
        qjdVar.getClass();
        zwa zwaVar3 = this.m;
        zwaVar3.getClass();
        zwa zwaVar4 = this.n;
        zwaVar4.getClass();
        boolean z2 = this.f;
        boolean z3 = this.g;
        boolean z4 = this.h;
        boolean z5 = this.i;
        CursorAnchorInfo.Builder builder = this.o;
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
            boolean zD0 = flb.d0(zwaVar3, fU, zwaVarC.b);
            boolean zD02 = flb.d0(zwaVar3, fU, zwaVarC.d);
            boolean z6 = qjdVar.a(iF) == mcb.Rtl;
            int i3 = (zD0 || zD02) ? 1 : 0;
            if (!zD0 || !zD02) {
                i3 |= 2;
            }
            if (z6) {
                i3 |= 4;
            }
            int i4 = i3;
            float f5 = zwaVarC.b;
            float f6 = zwaVarC.d;
            builder.setInsertionMarkerLocation(fU, f5, f6, f6, i4);
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
                    float f7 = fArr2[i6];
                    float f8 = fArr2[i6 + 1];
                    int i7 = iE;
                    float f9 = fArr2[i6 + 2];
                    float f10 = fArr2[i6 + 3];
                    float[] fArr3 = fArr2;
                    int i8 = (zwaVar3.a < f9 ? 1 : 0) & (f7 < zwaVar3.c ? 1 : 0) & (zwaVar3.b < f10 ? 1 : 0) & (f8 < zwaVar3.d ? 1 : 0);
                    if (!flb.d0(zwaVar3, f7, f8) || !flb.d0(zwaVar3, f9, f10)) {
                        i8 |= 2;
                    }
                    int i9 = i8;
                    if (qjdVar.a(i5) == mcb.Rtl) {
                        i = i9 | 4;
                        i2 = i5;
                        f = f10;
                        f2 = f7;
                        f3 = f8;
                    } else {
                        i = i9;
                        f = f10;
                        f2 = f7;
                        f3 = f8;
                        i2 = i5;
                    }
                    builder.addCharacterBounds(i2, f2, f3, f9, f, i);
                    i5 = i2 + 1;
                    iE = i7;
                    fArr2 = fArr3;
                }
            }
        }
        int i10 = Build.VERSION.SDK_INT;
        if (i10 >= 33 && z4) {
            v4.v(builder, zwaVar4);
        }
        if (i10 >= 34 && z5) {
            m4.b(builder, qjdVar, zwaVar3);
        }
        s26Var.i0().updateCursorAnchorInfo(view, builder.build());
        this.e = false;
    }
}
