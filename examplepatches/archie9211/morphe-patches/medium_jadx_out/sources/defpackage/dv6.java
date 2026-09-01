package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dv6 implements zt6 {
    public final int a;
    public final List b;
    public final boolean c;
    public final wd d;
    public final zq0 e;
    public final ip6 f;
    public final int g;
    public final int h;
    public final int i;
    public final long j;
    public final Object k;
    public final Object l;
    public final st6 m;
    public final long n;
    public int o;
    public final int p;
    public final int q;
    public final int r;
    public boolean s;
    public int t = Integer.MIN_VALUE;
    public int u;
    public int v;
    public final int[] w;

    public dv6(int i, List list, boolean z, wd wdVar, zq0 zq0Var, ip6 ip6Var, int i2, int i3, int i4, long j, Object obj, Object obj2, st6 st6Var, long j2) {
        this.a = i;
        this.b = list;
        this.c = z;
        this.d = wdVar;
        this.e = zq0Var;
        this.f = ip6Var;
        this.g = i2;
        this.h = i3;
        this.i = i4;
        this.j = j;
        this.k = obj;
        this.l = obj2;
        this.m = st6Var;
        this.n = j2;
        int size = list.size();
        int i5 = 0;
        int iMax = 0;
        for (int i6 = 0; i6 < size; i6++) {
            t99 t99Var = (t99) list.get(i6);
            boolean z2 = this.c;
            i5 += z2 ? t99Var.b : t99Var.a;
            iMax = Math.max(iMax, !z2 ? t99Var.b : t99Var.a);
        }
        this.p = i5;
        int i7 = i5 + this.i;
        this.q = i7 >= 0 ? i7 : 0;
        this.r = iMax;
        this.w = new int[this.b.size() * 2];
    }

    @Override // defpackage.zt6
    public final int a() {
        return this.b.size();
    }

    @Override // defpackage.zt6
    public final int b() {
        return this.q;
    }

    @Override // defpackage.zt6
    public final int c() {
        return 1;
    }

    @Override // defpackage.zt6
    public final Object d(int i) {
        return ((t99) this.b.get(i)).w();
    }

    @Override // defpackage.zt6
    public final long e() {
        return this.n;
    }

    @Override // defpackage.zt6
    public final boolean f() {
        return this.c;
    }

    @Override // defpackage.zt6
    public final void g() {
        this.s = true;
    }

    @Override // defpackage.zt6
    public final int getIndex() {
        return this.a;
    }

    @Override // defpackage.zt6
    public final Object getKey() {
        return this.k;
    }

    @Override // defpackage.zt6
    public final long h(int i) {
        if (i == 0 && this.b.size() == 0) {
            int i2 = this.o;
            return this.c ? ((long) i2) & 4294967295L : ((long) i2) << 32;
        }
        int i3 = i * 2;
        int[] iArr = this.w;
        return (((long) iArr[i3 + 1]) & 4294967295L) | (((long) iArr[i3]) << 32);
    }

    @Override // defpackage.zt6
    public final int i() {
        return 0;
    }

    @Override // defpackage.zt6
    public final void j(int i, int i2, int i3, int i4) {
        m(i, i3, i4);
    }

    public final int k(long j) {
        return this.c ? (int) (j & 4294967295L) : (int) (j >> 32);
    }

    public final void l(s99 s99Var, boolean z) {
        of5 of5Var;
        if (this.t == Integer.MIN_VALUE) {
            e26.a("position() should be called first");
        }
        List list = this.b;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            t99 t99Var = (t99) list.get(i);
            int i2 = this.u;
            boolean z2 = this.c;
            int i3 = i2 - (z2 ? t99Var.b : t99Var.a);
            int i4 = this.v;
            long jH = h(i);
            mt6 mt6VarA = this.m.a(i, this.k);
            if (mt6VarA != null) {
                if (z) {
                    mt6VarA.r = jH;
                } else {
                    if (!k46.b(mt6VarA.r, 9223372034707292159L)) {
                        jH = mt6VarA.r;
                    }
                    long jD = k46.d(jH, ((k46) mt6VarA.q.getValue()).a);
                    if ((k(jH) <= i3 && k(jD) <= i3) || (k(jH) >= i4 && k(jD) >= i4)) {
                        mt6VarA.b();
                    }
                    jH = jD;
                }
                of5Var = mt6VarA.n;
            } else {
                of5Var = null;
            }
            long jD2 = k46.d(jH, this.j);
            if (!z && mt6VarA != null) {
                mt6VarA.m = jD2;
            }
            if (z2) {
                if (of5Var != null) {
                    s99Var.e(t99Var);
                    t99Var.a0(k46.d(jD2, t99Var.e), 0.0f, of5Var);
                } else {
                    s99.s(s99Var, t99Var, jD2);
                }
            } else if (of5Var != null) {
                s99.m(s99Var, t99Var, jD2, of5Var);
            } else {
                s99.l(s99Var, t99Var, jD2);
            }
        }
    }

    public final void m(int i, int i2, int i3) {
        int i4;
        this.o = i;
        boolean z = this.c;
        this.t = z ? i3 : i2;
        List list = this.b;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            t99 t99Var = (t99) list.get(i5);
            int i6 = i5 * 2;
            int[] iArr = this.w;
            if (z) {
                wd wdVar = this.d;
                if (wdVar == null) {
                    e26.b("null horizontalAlignment when isVertical == true");
                    z72.b();
                    return;
                } else {
                    iArr[i6] = wdVar.a(t99Var.a, i2, this.f);
                    iArr[i6 + 1] = i;
                    i4 = t99Var.b;
                }
            } else {
                iArr[i6] = i;
                int i7 = i6 + 1;
                zq0 zq0Var = this.e;
                if (zq0Var == null) {
                    e26.b("null verticalAlignment when isVertical == false");
                    z72.b();
                    return;
                } else {
                    iArr[i7] = zq0Var.a(t99Var.b, i3);
                    i4 = t99Var.a;
                }
            }
            i += i4;
        }
        this.u = -this.g;
        this.v = this.t + this.h;
    }
}
