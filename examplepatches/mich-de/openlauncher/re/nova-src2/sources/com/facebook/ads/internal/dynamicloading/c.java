package com.facebook.ads.internal.dynamicloading;

import com.facebook.ads.AudienceNetworkAds;

/* loaded from: classes2.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AudienceNetworkAds.InitListener f27510a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Throwable f27511b;

    public c(AudienceNetworkAds.InitListener initListener, Throwable th2) {
        this.f27510a = initListener;
        this.f27511b = th2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f27510a.onInitialized(DynamicLoaderFactory.createErrorInitResult(this.f27511b));
    }
}
