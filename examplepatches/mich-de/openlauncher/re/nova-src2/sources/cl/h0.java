package cl;

import java.util.concurrent.Callable;

/* loaded from: classes.dex */
public final class h0 extends i0 {

    /* renamed from: e, reason: collision with root package name */
    public final Callable f20014e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ j0 f20015f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(j0 j0Var, Callable callable) {
        super(j0Var, m0.f20038a);
        this.f20015f = j0Var;
        this.f20014e = callable;
    }

    @Override // cl.c1
    public final Object e() {
        return this.f20014e.call();
    }

    @Override // cl.c1
    public final String f() {
        return this.f20014e.toString();
    }

    @Override // cl.i0
    public final void h(Object obj) {
        this.f20015f.n(obj);
    }
}
