package com.fyber.inneractive.sdk.config;

/* loaded from: classes.dex */
public final class s implements com.fyber.inneractive.sdk.network.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v f27932a;

    public s(v vVar) {
        this.f27932a = vVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        r rVar = (r) obj;
        if (rVar != null) {
            v vVar = this.f27932a;
            if (rVar.equals(vVar.f27936b)) {
                return;
            }
            vVar.f27938d = true;
            vVar.f27936b = rVar;
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new t(vVar));
        }
    }
}
