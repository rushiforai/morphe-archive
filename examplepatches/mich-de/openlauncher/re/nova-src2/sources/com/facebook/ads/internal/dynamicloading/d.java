package com.facebook.ads.internal.dynamicloading;

import com.facebook.ads.AudienceNetworkAds;

/* loaded from: classes2.dex */
public final class d implements AudienceNetworkAds.InitResult {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Throwable f27512a;

    public d(Throwable th2) {
        this.f27512a = th2;
    }

    @Override // com.facebook.ads.AudienceNetworkAds.InitResult
    public final String getMessage() {
        return DynamicLoaderFactory.createErrorMessage(this.f27512a);
    }

    @Override // com.facebook.ads.AudienceNetworkAds.InitResult
    public final boolean isSuccess() {
        return false;
    }
}
