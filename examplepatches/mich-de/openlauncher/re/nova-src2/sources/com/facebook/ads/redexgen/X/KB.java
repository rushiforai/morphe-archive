package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.protocol.AdErrorType;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: assets/audience_network/classes.dex */
public class KB extends AbstractRunnableC2319oq {
    public final /* synthetic */ C07207m A00;
    public final /* synthetic */ C1782fz A01;
    public final /* synthetic */ C07087a A02;

    public KB(C07087a c07087a, C1782fz c1782fz, C07207m c07207m) {
        this.A02 = c07087a;
        this.A01 = c1782fz;
        this.A00 = c07207m;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A02.A0S(this.A01);
        this.A02.A0P(this.A00);
        this.A02.A00 = null;
        AdErrorType adErrorType = AdErrorType.RV_AD_TIMEOUT;
        this.A02.A0B.A0F().A6F(adErrorType.getErrorCode(), adErrorType.getDefaultErrorMessage());
        if (this.A02.A07 != null) {
            this.A02.A07.A0G(new C2262nt(adErrorType, b.f42142b));
        }
    }
}
