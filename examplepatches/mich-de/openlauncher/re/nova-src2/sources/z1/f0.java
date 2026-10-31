package z1;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class f0 extends f {

    /* renamed from: e, reason: collision with root package name */
    public final f f97923e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f97924f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f97925g;

    /* renamed from: h, reason: collision with root package name */
    public Function1 f97926h;

    /* renamed from: i, reason: collision with root package name */
    public final long f97927i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f0(f fVar, Function1 function1, boolean z11, boolean z12) {
        Function1 function1E;
        super(0L, j.f97936e);
        t70.a0 a0Var = k.f97941a;
        this.f97923e = fVar;
        this.f97924f = z11;
        this.f97925g = z12;
        this.f97926h = k.l(function1, (fVar == null || (function1E = fVar.e()) == null) ? k.f97950j.f97892e : function1E, z11);
        this.f97927i = x1.f.c();
    }

    @Override // z1.f
    public final void c() {
        f fVar;
        this.f97921c = true;
        if (!this.f97925g || (fVar = this.f97923e) == null) {
            return;
        }
        fVar.c();
    }

    @Override // z1.f
    public final j d() {
        return v().d();
    }

    @Override // z1.f
    public final Function1 e() {
        return this.f97926h;
    }

    @Override // z1.f
    public final boolean f() {
        return v().f();
    }

    @Override // z1.f
    public final long g() {
        return v().g();
    }

    @Override // z1.f
    public final Function1 i() {
        return null;
    }

    @Override // z1.f
    public final void k() {
        t.a();
        throw null;
    }

    @Override // z1.f
    public final void l() {
        t.a();
        throw null;
    }

    @Override // z1.f
    public final void m() {
        v().m();
    }

    @Override // z1.f
    public final void n(z zVar) {
        v().n(zVar);
    }

    @Override // z1.f
    public final f u(Function1 function1) {
        Function1 function1L = k.l(function1, this.f97926h, true);
        return !this.f97924f ? k.h(v().u(null), function1L, true) : v().u(function1L);
    }

    public final f v() {
        f fVar = this.f97923e;
        return fVar == null ? k.f97950j : fVar;
    }
}
