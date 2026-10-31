package com.facebook.ads.internal.dynamicloading;

import com.facebook.ads.Ad;
import com.facebook.ads.AdError;
import com.facebook.ads.AdListener;

/* loaded from: classes2.dex */
public final class f implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AdListener f27522a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ad f27523b;

    public f(AdListener adListener, Ad ad) {
        this.f27522a = adListener;
        this.f27523b = ad;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f27522a.onError(this.f27523b, new AdError(-1, "Can't load Audience Network Dex. Please, check that audience_network folder is inside of assets folder."));
    }
}
