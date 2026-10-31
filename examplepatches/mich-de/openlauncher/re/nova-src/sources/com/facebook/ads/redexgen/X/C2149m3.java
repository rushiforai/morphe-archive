package com.facebook.ads.redexgen.X;

import com.facebook.ads.AudienceNetworkAds;

/* renamed from: com.facebook.ads.redexgen.X.m3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2149m3 implements AudienceNetworkAds.InitResult {
    public final String A00;
    public final boolean A01;

    public C2149m3(boolean z11, String str) {
        this.A01 = z11;
        this.A00 = str;
    }

    @Override // com.facebook.ads.AudienceNetworkAds.InitResult
    public final String getMessage() {
        return this.A00;
    }

    @Override // com.facebook.ads.AudienceNetworkAds.InitResult
    public final boolean isSuccess() {
        return this.A01;
    }
}
