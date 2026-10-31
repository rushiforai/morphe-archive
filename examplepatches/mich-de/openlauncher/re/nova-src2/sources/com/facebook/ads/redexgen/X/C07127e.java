package com.facebook.ads.redexgen.X;

import com.facebook.ads.CacheFlag;
import java.util.EnumSet;

/* renamed from: com.facebook.ads.redexgen.X.7e, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07127e extends KI {
    public static String[] A00 = {"Ze8NKKgwBfy46YDq5I0lzRS5nG7yrU8J", "E1ojaS3uTXsRavQORrTdUhX9c7MV5aHd", "ItCt9Q9mXWs9PIywah58uBD5YWxogfVc", "TvzxiXVOv8ol3X69Q34742hsr7pKLonV", "WogP6aaFjSX27EG5W88ejxN6ir7ZffIG", "o9NxBVrFd1YzPTzVCo2rgQ7Rf3HS8hqa", "2XopQN6Gw1", "j82AvX7B8A16DzVk8Gq1uvpNrrFgPLHx"};

    public C07127e(C0958Hi c0958Hi, C1781fy c1781fy) {
        super(c0958Hi, c1781fy);
    }

    private KG A00(Runnable runnable) {
        return new KG(this, runnable);
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final AbstractC1734fD A0H() {
        C1065Lq successfullyLoadedAdapter = (C1065Lq) this.A01;
        if (successfullyLoadedAdapter != null) {
            return successfullyLoadedAdapter.A09();
        }
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0O() {
        C1065Lq interstitialAdapter = (C1065Lq) this.A01;
        if (interstitialAdapter != null) {
            interstitialAdapter.A0B();
        }
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0Q(InterfaceC1708en interfaceC1708en, C2145ly c2145ly, C2143lw c2143lw, C1782fz c1782fz) {
        C1065Lq c1065Lq = (C1065Lq) interfaceC1708en;
        KH kh2 = new KH(this, c1782fz, c1065Lq);
        A0G().postDelayed(kh2, c2145ly.A05().A05());
        EnumSet<CacheFlag> enumSet = this.A08.A0B;
        if (enumSet == null) {
            enumSet = CacheFlag.ALL;
            if (A00[7].charAt(1) == 'D') {
                throw new RuntimeException();
            }
            A00[5] = "sZ24rCHUkfT3uSPodHZqWzeJet0EqBqU";
        }
        c1065Lq.A0A(this.A0B, A00(kh2), c1782fz, enumSet, this.A08.A04, this.A08.A05, this.A08.A02);
    }
}
