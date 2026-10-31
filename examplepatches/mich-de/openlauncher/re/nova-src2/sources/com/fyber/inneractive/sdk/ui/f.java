package com.fyber.inneractive.sdk.ui;

import com.fyber.inneractive.sdk.web.m;

/* loaded from: classes3.dex */
public final class f implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IAmraidWebViewController f31159a;

    public f(IAmraidWebViewController iAmraidWebViewController) {
        this.f31159a = iAmraidWebViewController;
    }

    @Override // java.lang.Runnable
    public final void run() {
        m mVar = this.f31159a.f31304b;
        if (mVar != null) {
            try {
                mVar.invalidate();
            } catch (Throwable unused) {
            }
        }
    }
}
