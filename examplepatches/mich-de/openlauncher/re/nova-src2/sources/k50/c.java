package k50;

import ab.e0;
import kotlin.jvm.internal.Intrinsics;
import o50.a0;
import o50.n;
import o50.r;
import o50.s;
import t70.i2;
import t70.m0;

/* loaded from: classes.dex */
public final class c implements r {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f71117a = new a0();

    /* renamed from: b, reason: collision with root package name */
    public s f71118b = s.f79583b;

    /* renamed from: c, reason: collision with root package name */
    public final n f71119c = new n();

    /* renamed from: d, reason: collision with root package name */
    public Object f71120d = m50.b.f76012a;

    /* renamed from: e, reason: collision with root package name */
    public i2 f71121e = m0.d();

    /* renamed from: f, reason: collision with root package name */
    public final s50.d f71122f = new s50.d();

    @Override // o50.r
    public final n a() {
        return this.f71119c;
    }

    public final void b(x50.a aVar) {
        s50.d dVar = this.f71122f;
        if (aVar != null) {
            dVar.e(h.f71148a, aVar);
            return;
        }
        s50.a key = h.f71148a;
        dVar.getClass();
        Intrinsics.g(key, "key");
        dVar.c().remove(key);
    }

    public final void c(s sVar) {
        Intrinsics.g(sVar, "<set-?>");
        this.f71118b = sVar;
    }

    public final void d(c builder) {
        Intrinsics.g(builder, "builder");
        this.f71118b = builder.f71118b;
        this.f71120d = builder.f71120d;
        s50.d dVar = builder.f71122f;
        b((x50.a) dVar.d(h.f71148a));
        a0 a0Var = builder.f71117a;
        a0 a0Var2 = this.f71117a;
        e0.W(a0Var2, a0Var);
        a0Var2.d(a0Var2.f79537h);
        ul.b.f(this.f71119c, builder.f71119c);
        s50.d dVar2 = this.f71122f;
        Intrinsics.g(dVar2, "<this>");
        for (s50.a aVar : b70.g.I1(dVar.c().keySet())) {
            Intrinsics.e(aVar, "null cannot be cast to non-null type io.ktor.util.AttributeKey<kotlin.Any>");
            dVar2.e(aVar, dVar.b(aVar));
        }
    }
}
