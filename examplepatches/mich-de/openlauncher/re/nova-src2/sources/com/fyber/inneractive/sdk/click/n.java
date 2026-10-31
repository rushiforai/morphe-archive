package com.fyber.inneractive.sdk.click;

/* loaded from: classes3.dex */
public final class n implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b f27728a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f27729b;

    public n(r rVar, b bVar) {
        this.f27729b = rVar;
        this.f27728a = bVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        o oVar = this.f27729b.f27734e;
        if (oVar != null) {
            oVar.a(this.f27728a);
        }
    }
}
