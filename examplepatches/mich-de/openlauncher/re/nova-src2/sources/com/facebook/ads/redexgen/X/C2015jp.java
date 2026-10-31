package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.facebook.ads.AudienceNetworkAds;
import com.facebook.ads.internal.api.InitApi;
import com.facebook.ads.internal.settings.MultithreadedBundleWrapper;

/* renamed from: com.facebook.ads.redexgen.X.jp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2015jp implements InitApi {
    @Override // com.facebook.ads.internal.api.InitApi
    public final void initialize(Context context, MultithreadedBundleWrapper multithreadedBundleWrapper, AudienceNetworkAds.InitListener initListener, int i5) {
        C2150m4.A0G(C2013jn.A09(context), multithreadedBundleWrapper, initListener, i5);
    }

    @Override // com.facebook.ads.internal.api.InitApi
    public final boolean isInitialized() {
        return C2150m4.A0H();
    }

    @Override // com.facebook.ads.internal.api.InitApi
    public final void onAdLoadInvoked(Context context) {
        C2150m4.A08(C2013jn.A09(context));
    }

    @Override // com.facebook.ads.internal.api.InitApi
    public final void onContentProviderCreated(Context context) {
        C2150m4.A09(C2013jn.A09(context));
    }
}
