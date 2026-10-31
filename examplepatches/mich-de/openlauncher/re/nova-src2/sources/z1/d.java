package z1;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class d extends f {

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f97906e;

    /* renamed from: f, reason: collision with root package name */
    public final f f97907f;

    public d(long j11, j jVar, Function1 function1, f fVar) {
        super(j11, jVar);
        this.f97906e = function1;
        this.f97907f = fVar;
        fVar.k();
    }

    @Override // z1.f
    public final void c() {
        if (this.f97921c) {
            return;
        }
        long j11 = this.f97920b;
        f fVar = this.f97907f;
        if (j11 != fVar.g()) {
            a();
        }
        fVar.l();
        super.c();
    }

    @Override // z1.f
    public final Function1 e() {
        return this.f97906e;
    }

    @Override // z1.f
    public final boolean f() {
        return true;
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
    }

    @Override // z1.f
    public final void n(z zVar) {
        t70.a0 a0Var = k.f97941a;
        throw new IllegalStateException("Cannot modify a state object in a read-only snapshot");
    }

    @Override // z1.f
    public final f u(Function1 function1) {
        return new d(this.f97920b, this.f97919a, k.l(function1, this.f97906e, true), this.f97907f);
    }
}
