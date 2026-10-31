package com.fyber.inneractive.sdk.web;

/* loaded from: classes3.dex */
public final class e1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i1 f31294a;

    public e1(i1 i1Var) {
        this.f31294a = i1Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        m mVar = this.f31294a.f31304b;
        if (mVar != null) {
            mVar.getViewTreeObserver().addOnPreDrawListener(this.f31294a.K);
        }
    }
}
