package com.fyber.inneractive.sdk.web;

/* loaded from: classes3.dex */
public final class s0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v0 f31380a;

    public s0(v0 v0Var) {
        this.f31380a = v0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f31380a.f31403u.compareAndSet(false, true)) {
            this.f31380a.d("onCancelResult(true);");
            this.f31380a.f31404v.set(false);
        }
    }
}
