package defpackage;

import java.util.Arrays;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xc8 extends k78 {
    public final k78 o;
    public boolean p;

    public xc8(long j, sic sicVar, x45 x45Var, x45 x45Var2, k78 k78Var) {
        super(j, sicVar, x45Var, x45Var2);
        this.o = k78Var;
        k78Var.k();
    }

    @Override // defpackage.k78, defpackage.oic
    public final void c() {
        if (this.c) {
            return;
        }
        super.c();
        if (this.p) {
            return;
        }
        this.p = true;
        this.o.l();
    }

    @Override // defpackage.k78
    public final fo7 w() {
        xc8 xc8Var;
        k78 k78Var = this.o;
        if (k78Var.m || k78Var.c) {
            return new pic(this);
        }
        g78 g78Var = this.h;
        long j = this.b;
        HashMap mapN = g78Var != null ? uic.n(k78Var.g(), this, this.o.d()) : null;
        synchronized (uic.c) {
            try {
                uic.w(this);
                if (g78Var == null || g78Var.d == 0) {
                    xc8Var = this;
                    xc8Var.a();
                } else {
                    xc8Var = this;
                    fo7 fo7VarZ = xc8Var.z(this.o.g(), g78Var, mapN, this.o.d());
                    if (!fo7VarZ.equals(qic.c)) {
                        return fo7VarZ;
                    }
                    g78 g78VarX = xc8Var.o.x();
                    if (g78VarX != null) {
                        g78VarX.j(g78Var);
                    } else {
                        xc8Var.o.C(g78Var);
                        xc8Var.h = null;
                    }
                }
                if (g76.R(xc8Var.o.g(), j) < 0) {
                    xc8Var.o.v();
                }
                k78 k78Var2 = xc8Var.o;
                k78Var2.r(k78Var2.d().f(j).d(xc8Var.j));
                xc8Var.o.A(j);
                k78 k78Var3 = xc8Var.o;
                int i = xc8Var.d;
                xc8Var.d = -1;
                if (i >= 0) {
                    int[] iArr = k78Var3.k;
                    iArr.getClass();
                    int length = iArr.length;
                    int[] iArrCopyOf = Arrays.copyOf(iArr, length + 1);
                    iArrCopyOf[length] = i;
                    k78Var3.k = iArrCopyOf;
                } else {
                    k78Var3.getClass();
                }
                xc8Var.o.B(xc8Var.j);
                k78 k78Var4 = xc8Var.o;
                int[] iArr2 = xc8Var.k;
                k78Var4.getClass();
                if (iArr2.length != 0) {
                    int[] iArr3 = k78Var4.k;
                    if (iArr3.length != 0) {
                        int length2 = iArr3.length;
                        int length3 = iArr2.length;
                        int[] iArrCopyOf2 = Arrays.copyOf(iArr3, length2 + length3);
                        System.arraycopy(iArr2, 0, iArrCopyOf2, length2, length3);
                        iArr2 = iArrCopyOf2;
                    }
                    k78Var4.k = iArr2;
                }
                xc8Var.m = true;
                if (!xc8Var.p) {
                    xc8Var.p = true;
                    xc8Var.o.l();
                }
                return qic.c;
            } finally {
            }
        }
    }
}
