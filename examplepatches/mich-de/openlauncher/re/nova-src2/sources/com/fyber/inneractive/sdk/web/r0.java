package com.fyber.inneractive.sdk.web;

/* loaded from: classes3.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v0 f31372a;

    public r0(v0 v0Var) {
        this.f31372a = v0Var;
    }

    public final void a(boolean z11) {
        if (this.f31372a.f31403u.compareAndSet(false, true)) {
            this.f31372a.d("onCancelResult(" + z11 + ");");
            this.f31372a.f31404v.set(false);
        }
    }
}
