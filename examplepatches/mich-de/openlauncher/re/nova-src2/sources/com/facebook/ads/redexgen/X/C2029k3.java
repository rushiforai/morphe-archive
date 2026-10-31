package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.api.NativeAdViewTypeApi;

/* renamed from: com.facebook.ads.redexgen.X.k3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2029k3 implements NativeAdViewTypeApi {
    public final EnumC2255nl A00;

    public C2029k3(int i5) {
        this.A00 = EnumC2255nl.A00(i5);
    }

    @Override // com.facebook.ads.internal.api.NativeAdViewTypeApi
    public final int getHeight() {
        return this.A00.A04();
    }

    @Override // com.facebook.ads.internal.api.NativeAdViewTypeApi
    public final int getValue() {
        return this.A00.A05();
    }

    @Override // com.facebook.ads.internal.api.NativeAdViewTypeApi
    public final int getWidth() {
        return this.A00.A06();
    }
}
