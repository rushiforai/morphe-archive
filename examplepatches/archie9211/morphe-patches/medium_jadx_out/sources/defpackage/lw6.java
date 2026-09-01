package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lw6 implements zt6 {
    public final int a;
    public final Object b;
    public final List c;
    public final boolean d;
    public final int e;
    public final int f;
    public final int g;
    public final int h;
    public final Object i;
    public final st6 j;
    public final long k;
    public boolean l = true;
    public final int m;
    public final int n;
    public int o;
    public int p;
    public int q;
    public boolean r;
    public final long s;
    public long t;

    public lw6(int i, Object obj, List list, boolean z, int i2, int i3, int i4, int i5, int i6, Object obj2, st6 st6Var, long j) {
        int i7;
        this.a = i;
        this.b = obj;
        this.c = list;
        this.d = z;
        this.e = i3;
        this.f = i4;
        this.g = i5;
        this.h = i6;
        this.i = obj2;
        this.j = st6Var;
        this.k = j;
        int i8 = 1;
        int i9 = 0;
        if (list.isEmpty()) {
            i7 = 0;
        } else {
            t99 t99Var = (t99) list.get(0);
            i7 = z ? t99Var.b : t99Var.a;
            int size = list.size() - 1;
            if (1 <= size) {
                int i10 = 1;
                while (true) {
                    t99 t99Var2 = (t99) list.get(i10);
                    int i11 = this.d ? t99Var2.b : t99Var2.a;
                    i7 = i11 > i7 ? i11 : i7;
                    if (i10 == size) {
                        break;
                    } else {
                        i10++;
                    }
                }
            }
        }
        this.m = i7;
        int i12 = i7 + i2;
        this.n = i12 < 0 ? 0 : i12;
        List list2 = this.c;
        if (!list2.isEmpty()) {
            t99 t99Var3 = (t99) list2.get(0);
            int i13 = this.d ? t99Var3.a : t99Var3.b;
            int size2 = list2.size() - 1;
            if (1 <= size2) {
                while (true) {
                    t99 t99Var4 = (t99) list2.get(i8);
                    int i14 = this.d ? t99Var4.a : t99Var4.b;
                    i13 = i14 > i13 ? i14 : i13;
                    if (i8 == size2) {
                        break;
                    } else {
                        i8++;
                    }
                }
            }
            i9 = i13;
        }
        this.o = Integer.MIN_VALUE;
        boolean z2 = this.d;
        int i15 = this.m;
        this.s = z2 ? (((long) i15) & 4294967295L) | (((long) i9) << 32) : (((long) i15) << 32) | (4294967295L & ((long) i9));
        this.t = 0L;
    }

    @Override // defpackage.zt6
    public final int a() {
        return this.c.size();
    }

    @Override // defpackage.zt6
    public final int b() {
        return this.n;
    }

    @Override // defpackage.zt6
    public final int c() {
        return this.f;
    }

    @Override // defpackage.zt6
    public final Object d(int i) {
        return ((t99) this.c.get(i)).w();
    }

    @Override // defpackage.zt6
    public final long e() {
        return this.k;
    }

    @Override // defpackage.zt6
    public final boolean f() {
        return this.d;
    }

    @Override // defpackage.zt6
    public final void g() {
        this.r = true;
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
        return this.e;
    }

    @Override // defpackage.zt6
    public final void j(int i, int i2, int i3, int i4) {
        if (this.d) {
            i3 = i4;
        }
        m(i, i2, i3);
    }

    public final int k(long j) {
        return this.d ? (int) (j & 4294967295L) : (int) (j >> 32);
    }

    public final int l() {
        long j = this.t;
        return (int) (!this.d ? j >> 32 : j & 4294967295L);
    }

    public final void m(int i, int i2, int i3) {
        long j;
        this.o = i3;
        this.p = -this.g;
        this.q = i3 + this.h;
        if (this.d) {
            j = (((long) i2) << 32) | (4294967295L & ((long) i));
        } else {
            j = (((long) i2) & 4294967295L) | (((long) i) << 32);
        }
        this.t = j;
    }
}
