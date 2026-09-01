package defpackage;

import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cv6 implements al7 {
    public final dv6 a;
    public final int b;
    public final boolean c;
    public final float d;
    public final al7 e;
    public final float f;
    public final boolean g;
    public final sb2 h;
    public final m73 i;
    public final long j;
    public final List k;
    public final int l;
    public final int m;
    public final int n;
    public final hw8 o;
    public final int p;
    public final int q;

    public cv6(dv6 dv6Var, int i, boolean z, float f, al7 al7Var, float f2, boolean z2, sb2 sb2Var, m73 m73Var, long j, List list, int i2, int i3, int i4, hw8 hw8Var, int i5, int i6) {
        this.a = dv6Var;
        this.b = i;
        this.c = z;
        this.d = f;
        this.e = al7Var;
        this.f = f2;
        this.g = z2;
        this.h = sb2Var;
        this.i = m73Var;
        this.j = j;
        this.k = list;
        this.l = i2;
        this.m = i3;
        this.n = i4;
        this.o = hw8Var;
        this.p = i5;
        this.q = i6;
    }

    @Override // defpackage.al7
    public final int a() {
        return this.e.a();
    }

    @Override // defpackage.al7
    public final int b() {
        return this.e.b();
    }

    @Override // defpackage.al7
    public final Map c() {
        return this.e.c();
    }

    @Override // defpackage.al7
    public final void d() {
        this.e.d();
    }

    @Override // defpackage.al7
    public final x45 e() {
        return this.e.e();
    }

    public final cv6 f(int i, boolean z) {
        dv6 dv6Var;
        int i2;
        int i3;
        int i4;
        if (this.g) {
            return null;
        }
        List list = this.k;
        if (list.isEmpty() || (dv6Var = this.a) == null) {
            return null;
        }
        int i5 = dv6Var.q;
        int i6 = this.b - i;
        if (i6 < 0 || i6 >= i5) {
            return null;
        }
        dv6 dv6Var2 = (dv6) bu1.x0(list);
        dv6 dv6Var3 = (dv6) bu1.H0(list);
        if (dv6Var2.s || dv6Var3.s) {
            return null;
        }
        int i7 = dv6Var2.o;
        int i8 = this.m;
        int i9 = this.l;
        if (i < 0) {
            if (Math.min((i7 + dv6Var2.q) - i9, (dv6Var3.o + dv6Var3.q) - i8) <= (-i)) {
                return null;
            }
        } else if (Math.min(i9 - i7, i8 - dv6Var3.o) <= i) {
            return null;
        }
        int size = list.size();
        int i10 = 0;
        while (i10 < size) {
            dv6 dv6Var4 = (dv6) list.get(i10);
            boolean z2 = dv6Var4.c;
            int[] iArr = dv6Var4.w;
            if (!dv6Var4.s) {
                dv6Var4.o += i;
                int length = iArr.length;
                for (int i11 = 0; i11 < length; i11++) {
                    int i12 = i11 & 1;
                    if ((z2 && i12 != 0) || (!z2 && i12 == 0)) {
                        iArr[i11] = iArr[i11] + i;
                    }
                }
                if (z) {
                    int size2 = dv6Var4.b.size();
                    int i13 = 0;
                    while (i13 < size2) {
                        mt6 mt6VarA = dv6Var4.m.a(i13, dv6Var4.k);
                        if (mt6VarA != null) {
                            long j = mt6VarA.l;
                            if (z2) {
                                i2 = i10;
                                i3 = (int) (j >> 32);
                                i4 = ((int) (j & 4294967295L)) + i;
                            } else {
                                i2 = i10;
                                i3 = ((int) (j >> 32)) + i;
                                i4 = (int) (j & 4294967295L);
                            }
                            mt6VarA.l = (((long) i4) & 4294967295L) | (((long) i3) << 32);
                        } else {
                            i2 = i10;
                        }
                        i13++;
                        i10 = i2;
                    }
                }
            }
            i10++;
        }
        return new cv6(this.a, i6, this.c || i > 0, i, this.e, this.f, this.g, this.h, this.i, this.j, list, this.l, this.m, this.n, this.o, this.p, this.q);
    }

    public final long g() {
        al7 al7Var = this.e;
        return (((long) al7Var.b()) << 32) | (((long) al7Var.a()) & 4294967295L);
    }
}
