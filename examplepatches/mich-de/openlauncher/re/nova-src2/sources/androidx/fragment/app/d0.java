package androidx.fragment.app;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes2.dex */
public final class d0 extends f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ u.a f14511a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AtomicReference f14512b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ k.b f14513c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ j.a f14514d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h0 f14515e;

    public d0(h0 h0Var, u.a aVar, AtomicReference atomicReference, k.b bVar, j.a aVar2) {
        this.f14515e = h0Var;
        this.f14511a = aVar;
        this.f14512b = atomicReference;
        this.f14513c = bVar;
        this.f14514d = aVar2;
    }

    @Override // androidx.fragment.app.f0
    public final void a() {
        h0 h0Var = this.f14515e;
        this.f14512b.set(((j.i) this.f14511a.apply()).c(h0Var.generateActivityResultKey(), h0Var, this.f14513c, this.f14514d));
    }
}
