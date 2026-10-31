package com.facebook.ads.redexgen.X;

import com.facebook.ads.RewardData;
import com.facebook.ads.internal.protocol.AdPlacementType;

/* loaded from: assets/audience_network/classes.dex */
public abstract class LG implements InterfaceC1708en {
    public int A00;
    public long A01;
    public RewardData A02;

    public abstract int A0I();

    public abstract AbstractC1734fD A0J();

    public abstract boolean A0K();

    public final void A00(int i5) {
        this.A00 = i5;
    }

    public final void A01(long j11) {
        this.A01 = j11;
    }

    public final void A02(RewardData rewardData) {
        this.A02 = rewardData;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final AdPlacementType A9N() {
        return AdPlacementType.REWARDED_VIDEO;
    }
}
