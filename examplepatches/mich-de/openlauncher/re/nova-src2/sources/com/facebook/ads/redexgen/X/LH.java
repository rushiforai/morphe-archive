package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: assets/audience_network/classes.dex */
public class LH implements InterfaceC2078kr {
    public final /* synthetic */ LG A00;
    public final /* synthetic */ InterfaceC1727f6 A01;
    public final /* synthetic */ AtomicBoolean A02;

    public LH(AtomicBoolean atomicBoolean, InterfaceC1727f6 interfaceC1727f6, LG lg2) {
        this.A02 = atomicBoolean;
        this.A01 = interfaceC1727f6;
        this.A00 = lg2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEJ() {
        this.A01.AGw(this.A00, AdError.CACHE_ERROR);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEU() {
        this.A02.set(true);
        this.A01.AGt(this.A00);
    }
}
