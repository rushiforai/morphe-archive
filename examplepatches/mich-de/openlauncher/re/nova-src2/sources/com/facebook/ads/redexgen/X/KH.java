package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.protocol.AdErrorType;

/* loaded from: assets/audience_network/classes.dex */
public class KH extends AbstractRunnableC2319oq {
    public static String[] A03 = {"yrAoLlhy", "vjKRanDE0ikxU4tUHx1JmWQDvFUAaqx2", "G8wXLa7S", "9J53mmPk6os8gDVcVJiXfdfZJDEQMT6X", "kfMskHW9TbZqzkqhamfHgTOsKT3rM1iE", "Mg52vw4TxXqfT32sREgq1aGh5Zqj2TwE", "nRFH5QMgskhjbVKjSOKCK9T059kaNprb", "vKZwNFsd8PUl35Ni"};
    public final /* synthetic */ C1065Lq A00;
    public final /* synthetic */ C1782fz A01;
    public final /* synthetic */ C07127e A02;

    public KH(C07127e c07127e, C1782fz c1782fz, C1065Lq c1065Lq) {
        this.A02 = c07127e;
        this.A01 = c1782fz;
        this.A00 = c1065Lq;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A02.A0S(this.A01);
        this.A02.A0P(this.A00);
        this.A02.A00 = null;
        C2262nt c2262ntA00 = C2262nt.A00(AdErrorType.INTERSTITIAL_AD_TIMEOUT);
        this.A02.A0B.A0F().A6F(c2262ntA00.A03().getErrorCode(), c2262ntA00.A04());
        if (this.A02.A07 != null) {
            AbstractC1709eo abstractC1709eo = this.A02.A07;
            if (A03[2].length() == 26) {
                throw new RuntimeException();
            }
            A03[2] = "dFgz35Aa9EKDn";
            abstractC1709eo.A0G(c2262ntA00);
        }
    }
}
