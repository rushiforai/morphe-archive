package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.bridge.gms.AdvertisingId;

/* loaded from: assets/audience_network/classes.dex */
public class HK implements InterfaceC2099lE {
    public final /* synthetic */ AdvertisingId A00;
    public final /* synthetic */ HJ A01;

    public HK(HJ hj2, AdvertisingId advertisingId) {
        this.A01 = hj2;
        this.A00 = advertisingId;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2099lE
    public final boolean ABF() {
        return this.A00.isLimitAdTracking();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2099lE
    public final String getId() {
        return this.A00.getId();
    }
}
