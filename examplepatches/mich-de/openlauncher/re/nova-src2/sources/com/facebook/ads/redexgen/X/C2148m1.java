package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.api.AdSizeApi;
import com.facebook.ads.internal.dynamicloading.DynamicLoaderImpl;

/* renamed from: com.facebook.ads.redexgen.X.m1, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2148m1 implements AdSizeApi {
    public final /* synthetic */ DynamicLoaderImpl A00;
    public final /* synthetic */ EnumC2264nw A01;

    public C2148m1(DynamicLoaderImpl dynamicLoaderImpl, EnumC2264nw enumC2264nw) {
        this.A00 = dynamicLoaderImpl;
        this.A01 = enumC2264nw;
    }

    @Override // com.facebook.ads.internal.api.AdSizeApi
    public final int getHeight() {
        return this.A01.A03();
    }

    @Override // com.facebook.ads.internal.api.AdSizeApi
    public final int getWidth() {
        return this.A01.A04();
    }
}
