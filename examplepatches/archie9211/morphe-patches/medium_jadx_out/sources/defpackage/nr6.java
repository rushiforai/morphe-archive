package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nr6 implements zt6 {
    public final int a;
    public final Object b;
    public final int c;
    public final ip6 d;
    public final int e;
    public final int f;
    public final List g;
    public final long h;
    public final Object i;
    public final st6 j;
    public final long k;
    public final int l;
    public final int m;
    public final int n;
    public final int o;
    public int p = Integer.MIN_VALUE;
    public int q;
    public int r;
    public final long s;
    public long t;
    public int u;
    public int v;
    public boolean w;

    public nr6(int i, Object obj, int i2, int i3, ip6 ip6Var, int i4, int i5, List list, long j, Object obj2, st6 st6Var, long j2, int i6, int i7) {
        this.a = i;
        this.b = obj;
        this.c = i2;
        this.d = ip6Var;
        this.e = i4;
        this.f = i5;
        this.g = list;
        this.h = j;
        this.i = obj2;
        this.j = st6Var;
        this.k = j2;
        this.l = i6;
        this.m = i7;
        int size = list.size();
        int iMax = 0;
        for (int i8 = 0; i8 < size; i8++) {
            iMax = Math.max(iMax, ((t99) list.get(i8)).b);
        }
        this.n = iMax;
        int i9 = i3 + iMax;
        this.o = i9 >= 0 ? i9 : 0;
        this.s = (((long) this.c) << 32) | (((long) iMax) & 4294967295L);
        this.t = 0L;
        this.u = -1;
        this.v = -1;
    }

    @Override // defpackage.zt6
    public final int a() {
        return this.g.size();
    }

    @Override // defpackage.zt6
    public final int b() {
        return this.o;
    }

    @Override // defpackage.zt6
    public final int c() {
        return this.m;
    }

    @Override // defpackage.zt6
    public final Object d(int i) {
        return ((t99) this.g.get(i)).w();
    }

    @Override // defpackage.zt6
    public final long e() {
        return this.k;
    }

    @Override // defpackage.zt6
    public final boolean f() {
        return true;
    }

    @Override // defpackage.zt6
    public final void g() {
        this.w = true;
    }

    @Override // defpackage.zt6
    public final int getIndex() {
        return this.a;
    }

    @Override // defpackage.zt6
    public final Object getKey() {
        return this.b;
    }

    @Override // defpackage.zt6
    public final long h(int i) {
        return this.t;
    }

    @Override // defpackage.zt6
    public final int i() {
        return this.l;
    }

    @Override // defpackage.zt6
    public final void j(int i, int i2, int i3, int i4) {
        l(i, i2, i3, i4, -1, -1);
    }

    public final void k(s99 s99Var, boolean z) {
        of5 of5Var;
        if (this.p == Integer.MIN_VALUE) {
            e26.a("position() should be called first");
        }
        List list = this.g;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            t99 t99Var = (t99) list.get(i);
            int i2 = this.q - t99Var.b;
            int i3 = this.r;
            long j = this.t;
            mt6 mt6VarA = this.j.a(i, this.b);
            if (mt6VarA != null) {
                if (z) {
                    mt6VarA.r = j;
                } else {
                    long jD = k46.d(!k46.b(mt6VarA.r, 9223372034707292159L) ? mt6VarA.r : j, ((k46) mt6VarA.q.getValue()).a);
                    int i4 = (int) (j & 4294967295L);
                    if ((i4 <= i2 && ((int) (jD & 4294967295L)) <= i2) || (i4 >= i3 && ((int) (jD & 4294967295L)) >= i3)) {
                        mt6VarA.b();
                    }
                    j = jD;
                }
                of5Var = mt6VarA.n;
            } else {
                of5Var = null;
            }
            long jD2 = k46.d(j, this.h);
            if (!z && mt6VarA != null) {
                mt6VarA.m = jD2;
            }
            if (of5Var != null) {
                s99Var.e(t99Var);
                t99Var.a0(k46.d(jD2, t99Var.e), 0.0f, of5Var);
            } else {
                s99.s(s99Var, t99Var, jD2);
            }
        }
    }

    public final void l(int i, int i2, int i3, int i4, int i5, int i6) {
        this.p = i4;
        if (this.d == ip6.Rtl) {
            i2 = (i3 - i2) - this.c;
        }
        this.t = (((long) i2) << 32) | (((long) i) & 4294967295L);
        this.u = i5;
        this.v = i6;
        this.q = -this.e;
        this.r = i4 + this.f;
    }
}
