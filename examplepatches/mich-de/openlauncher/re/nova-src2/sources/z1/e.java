package z1;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class e extends f {

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f97912e;

    /* renamed from: f, reason: collision with root package name */
    public int f97913f;

    public e(long j11, j jVar, Function1 function1) {
        super(j11, jVar);
        this.f97912e = function1;
        this.f97913f = 1;
    }

    @Override // z1.f
    public final void c() {
        if (this.f97921c) {
            return;
        }
        l();
        super.c();
    }

    @Override // z1.f
    public final Function1 e() {
        return this.f97912e;
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
        this.f97913f++;
    }

    @Override // z1.f
    public final void l() {
        int i5 = this.f97913f - 1;
        this.f97913f = i5;
        if (i5 == 0) {
            a();
        }
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
        k.d(this);
        return new d(this.f97920b, this.f97919a, k.l(function1, this.f97912e, true), this);
    }
}
