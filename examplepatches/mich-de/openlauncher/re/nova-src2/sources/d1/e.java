package d1;

import androidx.compose.ui.node.LayoutNode;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m3.p0;
import m3.t;
import p10.c0;
import q3.o;
import t0.t0;
import y3.n;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public String f48759a;

    /* renamed from: b, reason: collision with root package name */
    public p0 f48760b;

    /* renamed from: c, reason: collision with root package name */
    public o f48761c;

    /* renamed from: d, reason: collision with root package name */
    public int f48762d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f48763e;

    /* renamed from: f, reason: collision with root package name */
    public int f48764f;

    /* renamed from: g, reason: collision with root package name */
    public int f48765g;

    /* renamed from: i, reason: collision with root package name */
    public y3.c f48767i;

    /* renamed from: j, reason: collision with root package name */
    public m3.a f48768j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f48769k;

    /* renamed from: l, reason: collision with root package name */
    public long f48770l;

    /* renamed from: m, reason: collision with root package name */
    public b f48771m;
    public t n;
    public n o;

    /* renamed from: s, reason: collision with root package name */
    public long f48775s;

    /* renamed from: h, reason: collision with root package name */
    public long f48766h = a.f48732a;

    /* renamed from: p, reason: collision with root package name */
    public long f48772p = y3.b.h(0, 0, 0, 0);

    /* renamed from: q, reason: collision with root package name */
    public int f48773q = -1;

    /* renamed from: r, reason: collision with root package name */
    public int f48774r = -1;

    public e(String str, p0 p0Var, o oVar, int i5, boolean z11, int i11, int i12) {
        this.f48759a = str;
        this.f48760b = p0Var;
        this.f48761c = oVar;
        this.f48762d = i5;
        this.f48763e = z11;
        this.f48764f = i11;
        this.f48765g = i12;
        long j11 = 0;
        this.f48770l = (j11 & 4294967295L) | (j11 << 32);
    }

    public static long f(e eVar, long j11, n nVar) {
        p0 p0Var = eVar.f48760b;
        b bVar = eVar.f48771m;
        y3.c cVar = eVar.f48767i;
        Intrinsics.d(cVar);
        b bVarB = c0.B(bVar, nVar, p0Var, cVar, eVar.f48761c);
        eVar.f48771m = bVarB;
        return bVarB.a(eVar.f48765g, j11);
    }

    public final int a(int i5, n nVar) {
        int i11 = this.f48773q;
        int i12 = this.f48774r;
        if (i5 == i11 && i11 != -1) {
            return i12;
        }
        long jA = y3.b.a(0, i5, 0, LayoutNode.NotPlacedPlaceOrder);
        if (this.f48765g > 1) {
            jA = f(this, jA, nVar);
        }
        t tVarE = e(nVar);
        long jC = ul.b.C(jA, this.f48763e, this.f48762d, tVarE.b());
        boolean z11 = this.f48763e;
        int i13 = this.f48762d;
        int i14 = this.f48764f;
        int iP = t0.p(new m3.a((u3.e) tVarE, ((z11 || !(i13 == 2 || i13 == 4 || i13 == 5)) && i14 >= 1) ? i14 : 1, i13, jC).b());
        int i15 = y3.a.i(jA);
        if (iP < i15) {
            iP = i15;
        }
        this.f48773q = i5;
        this.f48774r = iP;
        return iP;
    }

    public final boolean b(long j11, n nVar) {
        t tVar;
        this.f48775s = (this.f48775s << 2) | 3;
        boolean z11 = true;
        long jF = this.f48765g > 1 ? f(this, j11, nVar) : j11;
        m3.a aVar = this.f48768j;
        boolean z12 = false;
        if (aVar != null && (tVar = this.n) != null && !tVar.a() && nVar == this.o && (y3.a.b(jF, this.f48772p) || (y3.a.h(jF) == y3.a.h(this.f48772p) && y3.a.j(jF) == y3.a.j(this.f48772p) && y3.a.g(jF) >= aVar.b() && !aVar.f75837d.f77762d))) {
            if (!y3.a.b(jF, this.f48772p)) {
                m3.a aVar2 = this.f48768j;
                Intrinsics.d(aVar2);
                this.f48770l = y3.b.d(jF, (t0.p(Math.min(aVar2.f75834a.f90529i.c(), aVar2.d())) << 32) | (t0.p(aVar2.b()) & 4294967295L));
                if (this.f48762d == 3 || (((int) (r12 >> 32)) >= aVar2.d() && ((int) (4294967295L & r12)) >= aVar2.b())) {
                    z11 = false;
                }
                this.f48769k = z11;
                this.f48772p = jF;
            }
            return false;
        }
        t tVarE = e(nVar);
        long jC = ul.b.C(jF, this.f48763e, this.f48762d, tVarE.b());
        boolean z13 = this.f48763e;
        int i5 = this.f48762d;
        int i11 = this.f48764f;
        m3.a aVar3 = new m3.a((u3.e) tVarE, ((z13 || !(i5 == 2 || i5 == 4 || i5 == 5)) && i11 >= 1) ? i11 : 1, i5, jC);
        this.f48772p = jF;
        this.f48770l = y3.b.d(jF, (t0.p(aVar3.b()) & 4294967295L) | (t0.p(aVar3.d()) << 32));
        if (this.f48762d != 3 && (((int) (r1 >> 32)) < aVar3.d() || ((int) (r1 & 4294967295L)) < aVar3.b())) {
            z12 = true;
        }
        this.f48769k = z12;
        this.f48768j = aVar3;
        return true;
    }

    public final void c() {
        this.f48768j = null;
        this.n = null;
        this.o = null;
        this.f48773q = -1;
        this.f48774r = -1;
        this.f48772p = y3.b.h(0, 0, 0, 0);
        long j11 = 0;
        this.f48770l = (j11 & 4294967295L) | (j11 << 32);
        this.f48769k = false;
    }

    public final void d(y3.c cVar) {
        long jA;
        y3.c cVar2 = this.f48767i;
        if (cVar != null) {
            int i5 = a.f48733b;
            jA = a.a(cVar.getDensity(), cVar.getFontScale());
        } else {
            jA = a.f48732a;
        }
        if (cVar2 == null) {
            this.f48767i = cVar;
            this.f48766h = jA;
        } else if (cVar == null || this.f48766h != jA) {
            this.f48767i = cVar;
            this.f48766h = jA;
            this.f48775s = (this.f48775s << 2) | 1;
            c();
        }
    }

    public final t e(n nVar) {
        t eVar = this.n;
        if (eVar == null || nVar != this.o || eVar.a()) {
            this.o = nVar;
            String str = this.f48759a;
            p0 p0VarN = fg.a.N(this.f48760b, nVar);
            EmptyList emptyList = EmptyList.f71733a;
            y3.c cVar = this.f48767i;
            Intrinsics.d(cVar);
            eVar = new u3.e(str, p0VarN, emptyList, emptyList, this.f48761c, cVar);
        }
        this.n = eVar;
        return eVar;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ParagraphLayoutCache(paragraph=");
        sb2.append(this.f48768j != null ? "<paragraph>" : AbstractJsonLexerKt.NULL);
        sb2.append(", lastDensity=");
        sb2.append((Object) a.b(this.f48766h));
        sb2.append(", history=");
        return a2.c.i(this.f48775s, ", constraints=$)", sb2);
    }
}
