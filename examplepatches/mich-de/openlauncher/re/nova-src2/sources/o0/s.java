package o0;

import java.util.List;
import n0.g0;
import z2.i1;

/* loaded from: classes.dex */
public final class s implements g0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f78795a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f78796b;

    /* renamed from: c, reason: collision with root package name */
    public final List f78797c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f78798d;

    /* renamed from: e, reason: collision with root package name */
    public final int f78799e;

    /* renamed from: f, reason: collision with root package name */
    public final int f78800f;

    /* renamed from: g, reason: collision with root package name */
    public final int f78801g;

    /* renamed from: h, reason: collision with root package name */
    public final int f78802h;

    /* renamed from: i, reason: collision with root package name */
    public final Object f78803i;

    /* renamed from: j, reason: collision with root package name */
    public final androidx.compose.foundation.lazy.layout.c f78804j;

    /* renamed from: k, reason: collision with root package name */
    public final long f78805k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f78806l = true;

    /* renamed from: m, reason: collision with root package name */
    public final int f78807m;
    public final int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f78808p;

    /* renamed from: q, reason: collision with root package name */
    public int f78809q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f78810r;

    /* renamed from: s, reason: collision with root package name */
    public final long f78811s;

    /* renamed from: t, reason: collision with root package name */
    public long f78812t;

    public s(int i5, Object obj, List list, boolean z11, int i11, int i12, int i13, int i14, int i15, Object obj2, androidx.compose.foundation.lazy.layout.c cVar, long j11) {
        int i16;
        long j12;
        long j13;
        this.f78795a = i5;
        this.f78796b = obj;
        this.f78797c = list;
        this.f78798d = z11;
        this.f78799e = i12;
        this.f78800f = i13;
        this.f78801g = i14;
        this.f78802h = i15;
        this.f78803i = obj2;
        this.f78804j = cVar;
        this.f78805k = j11;
        int i17 = 1;
        int i18 = 0;
        if (list.isEmpty()) {
            i16 = 0;
        } else {
            i1 i1Var = (i1) list.get(0);
            i16 = z11 ? i1Var.f98082b : i1Var.f98081a;
            int iK = ul.b.K(list);
            if (1 <= iK) {
                int i19 = 1;
                while (true) {
                    i1 i1Var2 = (i1) list.get(i19);
                    int i21 = this.f78798d ? i1Var2.f98082b : i1Var2.f98081a;
                    i16 = i21 > i16 ? i21 : i16;
                    if (i19 == iK) {
                        break;
                    } else {
                        i19++;
                    }
                }
            }
        }
        this.f78807m = i16;
        int i22 = i16 + i11;
        this.n = i22 < 0 ? 0 : i22;
        List list2 = this.f78797c;
        if (!list2.isEmpty()) {
            i1 i1Var3 = (i1) list2.get(0);
            int i23 = this.f78798d ? i1Var3.f98081a : i1Var3.f98082b;
            int iK2 = ul.b.K(list2);
            if (1 <= iK2) {
                while (true) {
                    i1 i1Var4 = (i1) list2.get(i17);
                    int i24 = this.f78798d ? i1Var4.f98081a : i1Var4.f98082b;
                    i23 = i24 > i23 ? i24 : i23;
                    if (i17 == iK2) {
                        break;
                    } else {
                        i17++;
                    }
                }
            }
            i18 = i23;
        }
        this.o = Integer.MIN_VALUE;
        if (this.f78798d) {
            j12 = i18 << 32;
            j13 = this.f78807m;
        } else {
            j12 = this.f78807m << 32;
            j13 = i18;
        }
        this.f78811s = (j13 & 4294967295L) | j12;
        this.f78812t = 0L;
    }

    @Override // n0.g0
    public final int a() {
        return this.f78797c.size();
    }

    @Override // n0.g0
    public final int b() {
        return this.f78800f;
    }

    @Override // n0.g0
    public final long c() {
        return this.f78805k;
    }

    @Override // n0.g0
    public final boolean d() {
        return this.f78798d;
    }

    @Override // n0.g0
    public final void e(int i5, int i11, int i12, int i13) {
        if (this.f78798d) {
            i12 = i13;
        }
        m(i5, i11, i12);
    }

    @Override // n0.g0
    public final int f() {
        return this.n;
    }

    @Override // n0.g0
    public final Object g(int i5) {
        return ((i1) this.f78797c.get(i5)).k();
    }

    @Override // n0.g0
    public final int getIndex() {
        return this.f78795a;
    }

    @Override // n0.g0
    public final Object getKey() {
        return this.f78796b;
    }

    @Override // n0.g0
    public final void h() {
        this.f78810r = true;
    }

    @Override // n0.g0
    public final long i(int i5) {
        return this.f78812t;
    }

    @Override // n0.g0
    public final int j() {
        return this.f78799e;
    }

    public final int k(long j11) {
        return (int) (this.f78798d ? j11 & 4294967295L : j11 >> 32);
    }

    public final int l() {
        return (int) (!this.f78798d ? this.f78812t >> 32 : this.f78812t & 4294967295L);
    }

    public final void m(int i5, int i11, int i12) {
        long j11;
        this.o = i12;
        this.f78808p = -this.f78801g;
        this.f78809q = i12 + this.f78802h;
        if (this.f78798d) {
            j11 = (i11 << 32) | (4294967295L & i5);
        } else {
            j11 = (i11 & 4294967295L) | (i5 << 32);
        }
        this.f78812t = j11;
    }
}
