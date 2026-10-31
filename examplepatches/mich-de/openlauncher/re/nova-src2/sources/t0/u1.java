package t0;

import p1.m2;
import p1.o2;

/* loaded from: classes.dex */
public final class u1 {

    /* renamed from: g, reason: collision with root package name */
    public static final ab.c0 f88225g = y1.j.b(new m3.a0(11), new q20.c(29));

    /* renamed from: a, reason: collision with root package name */
    public final m2 f88226a;

    /* renamed from: b, reason: collision with root package name */
    public final m2 f88227b = androidx.compose.runtime.d.f(0.0f);

    /* renamed from: c, reason: collision with root package name */
    public final o2 f88228c = androidx.compose.runtime.d.g(0);

    /* renamed from: d, reason: collision with root package name */
    public h2.c f88229d = h2.c.f59017e;

    /* renamed from: e, reason: collision with root package name */
    public long f88230e = m3.o0.f75944b;

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f88231f;

    public u1(g0.d1 d1Var, float f11) {
        this.f88226a = androidx.compose.runtime.d.f(f11);
        this.f88231f = androidx.compose.runtime.d.j(d1Var, p1.g1.f81425e);
    }

    public final float a() {
        return this.f88226a.m();
    }

    public final void b(g0.d1 d1Var, h2.c cVar, int i5, int i11) {
        float f11 = i11 - i5;
        this.f88227b.p(f11);
        float f12 = cVar.f59018a;
        float f13 = cVar.f59019b;
        h2.c cVar2 = this.f88229d;
        float f14 = cVar2.f59018a;
        m2 m2Var = this.f88226a;
        if (f12 != f14 || f13 != cVar2.f59019b) {
            boolean z11 = d1Var == g0.d1.f56493a;
            if (z11) {
                f12 = f13;
            }
            float f15 = z11 ? cVar.f59021d : cVar.f59020c;
            float fA = a();
            float f16 = i5;
            float f17 = fA + f16;
            m2Var.p(a() + ((f15 <= f17 && (f12 >= fA || f15 - f12 <= f16)) ? (f12 >= fA || f15 - f12 > f16) ? 0.0f : f12 - fA : f15 - f17));
            this.f88229d = cVar;
        }
        m2Var.p(kotlin.ranges.a.d0(a(), 0.0f, f11));
        this.f88228c.p(i5);
    }
}
