package m0;

import java.util.List;
import kotlin.KotlinNothingValueException;
import n0.g0;
import n0.h0;
import p1.s2;
import t70.m0;
import z2.h1;
import z2.i1;

/* loaded from: classes.dex */
public final class r implements h, g0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f75481a;

    /* renamed from: b, reason: collision with root package name */
    public final List f75482b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f75483c;

    /* renamed from: d, reason: collision with root package name */
    public final b2.e f75484d;

    /* renamed from: e, reason: collision with root package name */
    public final b2.j f75485e;

    /* renamed from: f, reason: collision with root package name */
    public final y3.n f75486f;

    /* renamed from: g, reason: collision with root package name */
    public final int f75487g;

    /* renamed from: h, reason: collision with root package name */
    public final int f75488h;

    /* renamed from: i, reason: collision with root package name */
    public final int f75489i;

    /* renamed from: j, reason: collision with root package name */
    public final long f75490j;

    /* renamed from: k, reason: collision with root package name */
    public final Object f75491k;

    /* renamed from: l, reason: collision with root package name */
    public final Object f75492l;

    /* renamed from: m, reason: collision with root package name */
    public final androidx.compose.foundation.lazy.layout.c f75493m;
    public final long n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f75494p;

    /* renamed from: q, reason: collision with root package name */
    public final int f75495q;

    /* renamed from: r, reason: collision with root package name */
    public final int f75496r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f75497s;

    /* renamed from: t, reason: collision with root package name */
    public int f75498t = Integer.MIN_VALUE;

    /* renamed from: u, reason: collision with root package name */
    public int f75499u;

    /* renamed from: v, reason: collision with root package name */
    public int f75500v;

    /* renamed from: w, reason: collision with root package name */
    public final int[] f75501w;

    public r(int i5, List list, boolean z11, b2.e eVar, b2.j jVar, y3.n nVar, int i11, int i12, int i13, long j11, Object obj, Object obj2, androidx.compose.foundation.lazy.layout.c cVar, long j12) {
        this.f75481a = i5;
        this.f75482b = list;
        this.f75483c = z11;
        this.f75484d = eVar;
        this.f75485e = jVar;
        this.f75486f = nVar;
        this.f75487g = i11;
        this.f75488h = i12;
        this.f75489i = i13;
        this.f75490j = j11;
        this.f75491k = obj;
        this.f75492l = obj2;
        this.f75493m = cVar;
        this.n = j12;
        int size = list.size();
        int i14 = 0;
        int iMax = 0;
        for (int i15 = 0; i15 < size; i15++) {
            i1 i1Var = (i1) list.get(i15);
            boolean z12 = this.f75483c;
            i14 += z12 ? i1Var.f98082b : i1Var.f98081a;
            iMax = Math.max(iMax, !z12 ? i1Var.f98082b : i1Var.f98081a);
        }
        this.f75494p = i14;
        int i16 = i14 + this.f75489i;
        this.f75495q = i16 >= 0 ? i16 : 0;
        this.f75496r = iMax;
        this.f75501w = new int[this.f75482b.size() * 2];
    }

    @Override // n0.g0
    public final int a() {
        return this.f75482b.size();
    }

    @Override // n0.g0
    public final int b() {
        return 1;
    }

    @Override // n0.g0
    public final long c() {
        return this.n;
    }

    @Override // n0.g0
    public final boolean d() {
        return this.f75483c;
    }

    @Override // n0.g0
    public final void e(int i5, int i11, int i12, int i13) {
        m(i5, i12, i13);
    }

    @Override // n0.g0
    public final int f() {
        return this.f75495q;
    }

    @Override // n0.g0
    public final Object g(int i5) {
        return ((i1) this.f75482b.get(i5)).k();
    }

    @Override // n0.g0
    public final int getIndex() {
        return this.f75481a;
    }

    @Override // n0.g0
    public final Object getKey() {
        return this.f75491k;
    }

    @Override // n0.g0
    public final void h() {
        this.f75497s = true;
    }

    @Override // n0.g0
    public final long i(int i5) {
        if (i5 == 0 && this.f75482b.size() == 0) {
            if (this.f75483c) {
                return (4294967295L & this.o) | (0 << 32);
            }
            return (4294967295L & 0) | (this.o << 32);
        }
        int[] iArr = this.f75501w;
        return (4294967295L & iArr[r7 + 1]) | (iArr[i5 * 2] << 32);
    }

    @Override // n0.g0
    public final int j() {
        return 0;
    }

    public final int k(long j11) {
        return (int) (this.f75483c ? j11 & 4294967295L : j11 >> 32);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void l(h1 h1Var, boolean z11) {
        List list;
        int i5;
        if (this.f75498t == Integer.MIN_VALUE) {
            j0.b.a("position() should be called first");
        }
        List list2 = this.f75482b;
        int size = list2.size();
        int i11 = 0;
        while (i11 < size) {
            i1 i1Var = (i1) list2.get(i11);
            int i12 = this.f75499u;
            boolean z12 = this.f75483c;
            int i13 = i12 - (z12 ? i1Var.f98082b : i1Var.f98081a);
            int i14 = this.f75500v;
            long jI = i(i11);
            n0.t tVarA = this.f75493m.a(i11, this.f75491k);
            l2.b bVar = null;
            Object[] objArr = 0;
            if (tVarA != null) {
                if (z11) {
                    tVarA.f77504r = jI;
                    list = list2;
                    i5 = size;
                } else {
                    long j11 = tVarA.f77504r;
                    int i15 = n0.t.f77488t;
                    h0.b();
                    list = list2;
                    i5 = size;
                    if (!y3.k.b(j11, n0.t.f77487s)) {
                        jI = tVarA.f77504r;
                    }
                    long jD = y3.k.d(jI, ((y3.k) ((s2) tVarA.f77503q).getValue()).f96605a);
                    if (((k(jI) <= i13 && k(jD) <= i13) || (k(jI) >= i14 && k(jD) >= i14)) && ((Boolean) ((s2) tVarA.f77496h).getValue()).booleanValue()) {
                        m0.t(tVarA.f77489a, null, null, new n0.r(tVarA, objArr == true ? 1 : 0, 1), 3);
                    }
                    jI = jD;
                }
                bVar = tVarA.n;
            } else {
                list = list2;
                i5 = size;
            }
            long jD2 = y3.k.d(jI, this.f75490j);
            if (!z11 && tVarA != null) {
                tVarA.f77501m = jD2;
            }
            if (z12) {
                if (bVar != null) {
                    h1Var.getClass();
                    h1.a(h1Var, i1Var);
                    i1Var.T(y3.k.d(jD2, i1Var.f98085e), 0.0f, bVar);
                } else {
                    h1.x(h1Var, i1Var, jD2);
                }
            } else if (bVar != null) {
                h1.q(h1Var, i1Var, jD2, bVar);
            } else {
                h1.o(h1Var, i1Var, jD2);
            }
            i11++;
            list2 = list;
            size = i5;
        }
    }

    public final void m(int i5, int i11, int i12) {
        int i13;
        this.o = i5;
        boolean z11 = this.f75483c;
        this.f75498t = z11 ? i12 : i11;
        List list = this.f75482b;
        int size = list.size();
        for (int i14 = 0; i14 < size; i14++) {
            i1 i1Var = (i1) list.get(i14);
            int i15 = i14 * 2;
            int[] iArr = this.f75501w;
            if (z11) {
                b2.e eVar = this.f75484d;
                if (eVar == null) {
                    j0.b.b("null horizontalAlignment when isVertical == true");
                    throw new KotlinNothingValueException();
                }
                iArr[i15] = eVar.a(i1Var.f98081a, i11, this.f75486f);
                iArr[i15 + 1] = i5;
                i13 = i1Var.f98082b;
            } else {
                iArr[i15] = i5;
                int i16 = i15 + 1;
                b2.j jVar = this.f75485e;
                if (jVar == null) {
                    j0.b.b("null verticalAlignment when isVertical == false");
                    throw new KotlinNothingValueException();
                }
                iArr[i16] = jVar.a(i1Var.f98082b, i12);
                i13 = i1Var.f98081a;
            }
            i5 += i13;
        }
        this.f75499u = -this.f75487g;
        this.f75500v = this.f75498t + this.f75488h;
    }
}
