package gf;

import io.sentry.e3;

/* loaded from: classes3.dex */
public final class e0 implements t0 {

    /* renamed from: a, reason: collision with root package name */
    public final t0 f57482a;

    /* renamed from: b, reason: collision with root package name */
    public final long f57483b;

    public e0(t0 t0Var, long j11) {
        this.f57482a = t0Var;
        this.f57483b = j11;
    }

    @Override // gf.t0
    public final void c() {
        this.f57482a.c();
    }

    @Override // gf.t0
    public final int e(e3 e3Var, ie.f fVar, int i5) {
        int iE = this.f57482a.e(e3Var, fVar, i5);
        if (iE == -4) {
            fVar.f61582f = Math.max(0L, fVar.f61582f + this.f57483b);
        }
        return iE;
    }

    @Override // gf.t0
    public final int f(long j11) {
        return this.f57482a.f(j11 - this.f57483b);
    }

    @Override // gf.t0
    public final boolean isReady() {
        return this.f57482a.isReady();
    }
}
