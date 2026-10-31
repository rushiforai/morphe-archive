package com.fyber.inneractive.sdk.network;

/* loaded from: classes.dex */
public final class s0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f28773a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Exception f28774b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f28775c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ t0 f28776d;

    public s0(t0 t0Var, Object obj, Exception exc, boolean z11) {
        this.f28776d = t0Var;
        this.f28773a = obj;
        this.f28774b = exc;
        this.f28775c = z11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f28776d.f28778b.a(this.f28773a, this.f28774b, this.f28775c);
    }
}
