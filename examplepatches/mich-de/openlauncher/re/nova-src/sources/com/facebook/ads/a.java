package com.facebook.ads;

import android.content.res.Configuration;
import com.facebook.ads.internal.api.AdViewParentApi;

/* loaded from: classes2.dex */
public final class a implements AdViewParentApi {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AdView f27498a;

    public a(AdView adView) {
        this.f27498a = adView;
    }

    @Override // com.facebook.ads.internal.api.AdViewParentApi
    public final void onConfigurationChanged(Configuration configuration) {
        super/*android.view.View*/.onConfigurationChanged(configuration);
    }
}
