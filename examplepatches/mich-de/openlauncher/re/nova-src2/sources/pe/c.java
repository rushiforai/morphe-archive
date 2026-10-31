package pe;

import ai.k0;
import ke.r;
import ke.s;
import ke.t;

/* loaded from: classes3.dex */
public final class c implements s {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ s f82549a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k0 f82550b;

    public c(k0 k0Var, s sVar) {
        this.f82550b = k0Var;
        this.f82549a = sVar;
    }

    @Override // ke.s
    public final r d(long j11) {
        r rVarD = this.f82549a.d(j11);
        t tVar = rVarD.f71430a;
        long j12 = tVar.f71433a;
        long j13 = tVar.f71434b;
        long j14 = this.f82550b.f13066b;
        t tVar2 = new t(j12, j13 + j14);
        t tVar3 = rVarD.f71431b;
        return new r(tVar2, new t(tVar3.f71433a, tVar3.f71434b + j14));
    }

    @Override // ke.s
    public final boolean f() {
        return this.f82549a.f();
    }

    @Override // ke.s
    public final long i() {
        return this.f82549a.i();
    }
}
