package z1;

import kotlin.jvm.functions.Function1;
import z.p0;

/* loaded from: classes.dex */
public final class e0 extends b {
    public final b o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f97914p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f97915q;

    /* renamed from: r, reason: collision with root package name */
    public Function1 f97916r;

    /* renamed from: s, reason: collision with root package name */
    public Function1 f97917s;

    /* renamed from: t, reason: collision with root package name */
    public final long f97918t;

    /* JADX WARN: Illegal instructions before constructor call */
    public e0(b bVar, Function1 function1, Function1 function12, boolean z11, boolean z12) {
        Function1 function1I;
        Function1 function1E;
        t70.a0 a0Var = k.f97941a;
        super(0L, j.f97936e, k.l(function1, (bVar == null || (function1E = bVar.e()) == null) ? k.f97950j.f97892e : function1E, z11), k.b(function12, (bVar == null || (function1I = bVar.i()) == null) ? k.f97950j.f97893f : function1I));
        this.o = bVar;
        this.f97914p = z11;
        this.f97915q = z12;
        this.f97916r = this.f97892e;
        this.f97917s = this.f97893f;
        this.f97918t = x1.f.c();
    }

    @Override // z1.b
    public final void B(p0 p0Var) {
        t.a();
        throw null;
    }

    @Override // z1.b
    public final b C(Function1 function1, Function1 function12) {
        Function1 function1L = k.l(function1, this.f97916r, true);
        Function1 function1B = k.b(function12, this.f97917s);
        return !this.f97914p ? new e0(D().C(null, function1B), function1L, function1B, false, true) : D().C(function1L, function1B);
    }

    public final b D() {
        b bVar = this.o;
        return bVar == null ? k.f97950j : bVar;
    }

    @Override // z1.b, z1.f
    public final void c() {
        b bVar;
        this.f97921c = true;
        if (!this.f97915q || (bVar = this.o) == null) {
            return;
        }
        bVar.c();
    }

    @Override // z1.f
    public final j d() {
        return D().d();
    }

    @Override // z1.b, z1.f
    public final Function1 e() {
        return this.f97916r;
    }

    @Override // z1.b, z1.f
    public final boolean f() {
        return D().f();
    }

    @Override // z1.f
    public final long g() {
        return D().g();
    }

    @Override // z1.b, z1.f
    public final int h() {
        return D().h();
    }

    @Override // z1.b, z1.f
    public final Function1 i() {
        return this.f97917s;
    }

    @Override // z1.b, z1.f
    public final void k() {
        t.a();
        throw null;
    }

    @Override // z1.b, z1.f
    public final void l() {
        t.a();
        throw null;
    }

    @Override // z1.b, z1.f
    public final void m() {
        D().m();
    }

    @Override // z1.b, z1.f
    public final void n(z zVar) {
        D().n(zVar);
    }

    @Override // z1.f
    public final void r(j jVar) {
        t.a();
        throw null;
    }

    @Override // z1.f
    public final void s(long j11) {
        t.a();
        throw null;
    }

    @Override // z1.b, z1.f
    public final void t(int i5) {
        D().t(i5);
    }

    @Override // z1.b, z1.f
    public final f u(Function1 function1) {
        Function1 function1L = k.l(function1, this.f97916r, true);
        return !this.f97914p ? k.h(D().u(null), function1L, true) : D().u(function1L);
    }

    @Override // z1.b
    public final w.b w() {
        return D().w();
    }

    @Override // z1.b
    public final p0 x() {
        return D().x();
    }

    @Override // z1.b
    /* renamed from: y */
    public final Function1 e() {
        return this.f97916r;
    }
}
