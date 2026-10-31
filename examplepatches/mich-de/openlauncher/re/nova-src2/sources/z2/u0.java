package z2;

/* loaded from: classes2.dex */
public final class u0 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public final s f98152a;

    /* renamed from: b, reason: collision with root package name */
    public final w0 f98153b;

    /* renamed from: c, reason: collision with root package name */
    public final x0 f98154c;

    public u0(s sVar, w0 w0Var, x0 x0Var) {
        this.f98152a = sVar;
        this.f98153b = w0Var;
        this.f98154c = x0Var;
    }

    @Override // z2.s
    public final int E(int i5) {
        return this.f98152a.E(i5);
    }

    @Override // z2.s
    public final int F(int i5) {
        return this.f98152a.F(i5);
    }

    @Override // z2.q0
    public final i1 H(long j11) {
        x0 x0Var = this.f98154c;
        x0 x0Var2 = x0.f98174a;
        w0 w0Var = this.f98153b;
        s sVar = this.f98152a;
        if (x0Var == x0Var2) {
            return new v0(w0Var == w0.f98170b ? sVar.F(y3.a.g(j11)) : sVar.E(y3.a.g(j11)), y3.a.c(j11) ? y3.a.g(j11) : 32767);
        }
        return new v0(y3.a.d(j11) ? y3.a.h(j11) : 32767, w0Var == w0.f98170b ? sVar.b(y3.a.h(j11)) : sVar.t(y3.a.h(j11)));
    }

    @Override // z2.s
    public final int b(int i5) {
        return this.f98152a.b(i5);
    }

    @Override // z2.s
    public final Object k() {
        return this.f98152a.k();
    }

    @Override // z2.s
    public final int t(int i5) {
        return this.f98152a.t(i5);
    }
}
