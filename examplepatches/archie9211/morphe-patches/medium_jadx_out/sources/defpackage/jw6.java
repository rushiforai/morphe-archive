package defpackage;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jw6 implements al7 {
    public final int[] a;
    public final int[] b;
    public final float c;
    public final al7 d;
    public final float e;
    public final boolean f;
    public final boolean g;
    public final boolean h;
    public final hx4 i;
    public final rz2 j;
    public final m73 k;
    public final int l;
    public final List m;
    public final long n;
    public final int o;
    public final int p;
    public final int q;
    public final int r;
    public final int s;
    public final sb2 t;
    public final hw8 u;

    public jw6(int[] iArr, int[] iArr2, float f, al7 al7Var, float f2, boolean z, boolean z2, boolean z3, hx4 hx4Var, rz2 rz2Var, m73 m73Var, int i, List list, long j, int i2, int i3, int i4, int i5, int i6, sb2 sb2Var) {
        this.a = iArr;
        this.b = iArr2;
        this.c = f;
        this.d = al7Var;
        this.e = f2;
        this.f = z;
        this.g = z2;
        this.h = z3;
        this.i = hx4Var;
        this.j = rz2Var;
        this.k = m73Var;
        this.l = i;
        this.m = list;
        this.n = j;
        this.o = i2;
        this.p = i3;
        this.q = i4;
        this.r = i5;
        this.s = i6;
        this.t = sb2Var;
        this.u = z2 ? hw8.Vertical : hw8.Horizontal;
    }

    @Override // defpackage.al7
    public final int a() {
        return this.d.a();
    }

    @Override // defpackage.al7
    public final int b() {
        return this.d.b();
    }

    @Override // defpackage.al7
    public final Map c() {
        return this.d.c();
    }

    @Override // defpackage.al7
    public final void d() {
        this.d.d();
    }

    @Override // defpackage.al7
    public final x45 e() {
        return this.d.e();
    }

    public final jw6 f(int i, boolean z) {
        char c;
        long j;
        long j2;
        int i2;
        if (this.h) {
            return null;
        }
        List list = this.m;
        if (list.isEmpty()) {
            return null;
        }
        int[] iArr = this.a;
        if (iArr.length == 0) {
            return null;
        }
        int[] iArr2 = this.b;
        if (iArr2.length == 0) {
            return null;
        }
        int i3 = this.r;
        int i4 = this.p;
        int i5 = i4 - i3;
        int size = list.size();
        for (int i6 = 0; i6 < size; i6++) {
            lw6 lw6Var = (lw6) list.get(i6);
            boolean z2 = lw6Var.r;
            int i7 = lw6Var.n;
            if (z2) {
                return null;
            }
            if ((lw6Var.l() <= 0) != (lw6Var.l() + i <= 0)) {
                return null;
            }
            int iL = lw6Var.l();
            int i8 = this.o;
            if (iL <= i8) {
                if (i < 0) {
                    if ((lw6Var.l() + i7) - i8 <= (-i)) {
                        return null;
                    }
                } else if (i8 - lw6Var.l() <= i) {
                    return null;
                }
            }
            if (lw6Var.l() + i7 >= i5) {
                if (i < 0) {
                    if ((lw6Var.l() + i7) - i4 <= (-i)) {
                        return null;
                    }
                } else if (i4 - lw6Var.l() <= i) {
                    return null;
                }
            }
        }
        int size2 = list.size();
        for (int i9 = 0; i9 < size2; i9++) {
            lw6 lw6Var2 = (lw6) list.get(i9);
            boolean z3 = lw6Var2.d;
            if (!lw6Var2.r) {
                long j3 = lw6Var2.t;
                char c2 = ' ';
                long j4 = 4294967295L;
                lw6Var2.t = (((long) (z3 ? (int) (j3 >> 32) : ((int) (j3 >> 32)) + i)) << 32) | (((long) (z3 ? ((int) (j3 & 4294967295L)) + i : (int) (j3 & 4294967295L))) & 4294967295L);
                if (z) {
                    int size3 = lw6Var2.c.size();
                    int i10 = 0;
                    while (i10 < size3) {
                        mt6 mt6VarA = lw6Var2.j.a(i10, lw6Var2.b);
                        if (mt6VarA != null) {
                            char c3 = c2;
                            long j5 = mt6VarA.l;
                            if (z3) {
                                c = c3;
                                j2 = j5;
                                i2 = (int) (j2 >> c);
                            } else {
                                c = c3;
                                j2 = j5;
                                i2 = ((int) (j2 >> c)) + i;
                            }
                            int i11 = z3 ? ((int) (j2 & j4)) + i : (int) (j2 & j4);
                            j = j4;
                            mt6VarA.l = (((long) i11) & j) | (((long) i2) << c);
                        } else {
                            c = c2;
                            j = j4;
                        }
                        i10++;
                        c2 = c;
                        j4 = j;
                    }
                }
            }
        }
        int length = iArr2.length;
        int[] iArr3 = new int[length];
        for (int i12 = 0; i12 < length; i12++) {
            iArr3[i12] = iArr2[i12] - i;
        }
        return new jw6(iArr, iArr3, i, this.d, this.e, this.f || i > 0, this.g, this.h, this.i, this.j, this.k, this.l, list, this.n, this.o, this.p, this.q, this.r, this.s, this.t);
    }
}
