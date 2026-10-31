package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.facebook.ads.NativeAd;
import com.facebook.ads.NativeAdBase;
import com.facebook.ads.NativeAdListener;
import com.facebook.ads.NativeAdsManager;
import com.facebook.ads.internal.api.NativeAdsManagerApi;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.k4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2030k4 implements NativeAdsManagerApi {
    public NativeAd.NativeOptions A01;
    public NativeAdsManager.Listener A02;
    public KC A03;
    public String A04;
    public final int A07;
    public final C0958Hi A08;
    public final String A09;
    public final List<NativeAd> A0A;
    public int A00 = -1;
    public boolean A05 = false;
    public boolean A06 = false;

    public C2030k4(Context context, String str, int i5) {
        this.A08 = C2013jn.A03(context);
        this.A09 = str;
        this.A07 = Math.max(i5, 0);
        this.A0A = new ArrayList(i5);
    }

    public final NativeAdsManager.Listener A00() {
        return this.A02;
    }

    public final KC A01() {
        return this.A03;
    }

    public final void A02() {
        this.A0A.clear();
    }

    public final void A03(int i5) {
        this.A00 = i5;
    }

    public final void A04(NativeAd nativeAd) {
        this.A0A.add(nativeAd);
    }

    public final void A05(boolean z11) {
        this.A05 = z11;
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final void disableAutoRefresh() {
        this.A06 = true;
        if (this.A03 != null) {
            this.A03.A06();
        }
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final int getUniqueNativeAdCount() {
        return this.A0A.size();
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final boolean isLoaded() {
        return this.A05;
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final void loadAds() {
        loadAds(NativeAdBase.MediaCacheFlag.ALL);
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final void loadAds(NativeAdBase.MediaCacheFlag mediaCacheFlag) {
        EnumC2265nx enumC2265nx = EnumC2265nx.A05;
        int i5 = this.A07;
        KC kc2 = this.A03;
        this.A03 = new KC(this.A08, this.A09, enumC2265nx, null, i5);
        if (this.A06) {
            this.A03.A06();
        }
        this.A03.A09(this.A04);
        this.A03.A08(new I5(this, this.A08, mediaCacheFlag, this.A01));
        this.A03.A07();
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final NativeAd nextNativeAd() {
        return nextNativeAd(null);
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final NativeAd nextNativeAd(NativeAdListener nativeAdListener) {
        if (this.A0A.size() == 0) {
            return null;
        }
        int i5 = this.A00;
        this.A00 = i5 + 1;
        List<NativeAd> list = this.A0A;
        int pos = this.A0A.size();
        NativeAd nativeAd = list.get(i5 % pos);
        if (nativeAdListener != null) {
            ((GT) nativeAd.getInternalNativeAd()).A1b(nativeAd, nativeAdListener);
        }
        int pos2 = this.A0A.size();
        if (i5 >= pos2) {
            return new NativeAd(this.A08, nativeAd, this.A01);
        }
        return nativeAd;
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final void setExtraHints(String str) {
        this.A04 = str;
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final void setListener(NativeAdsManager.Listener listener) {
        this.A02 = listener;
    }

    @Override // com.facebook.ads.internal.api.NativeAdsManagerApi
    public final void setNativeOption(NativeAd.NativeOptions nativeOptions) {
        this.A01 = nativeOptions;
    }
}
