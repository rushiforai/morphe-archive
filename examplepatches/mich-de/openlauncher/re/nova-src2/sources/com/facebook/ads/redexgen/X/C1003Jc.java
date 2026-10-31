package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdExperienceType;
import com.facebook.ads.RewardData;
import com.facebook.ads.RewardedVideoAdListener;
import java.lang.ref.WeakReference;

/* renamed from: com.facebook.ads.redexgen.X.Jc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1003Jc implements InterfaceC2092l7 {
    public static String[] A0E = {"pQFQWrff5apwgeDCfICDjWO2FINXUEGY", "Zrlf7mbphLj9aknW7PcFFQ", "n3KJlhWP5Ju2JP4ez23sn5JFnk3TGtqs", "LKe9A2", "QZ6oU5eByjCJaazPOJhmSAWWHc", "bIzEhjdis4s2Gtu6NLj44xIWpvJeHb48", "cSwbeF06gtlZkK5ZI0p5Ev", "223A19fPLhE6SS6l"};
    public int A00 = -1;
    public long A01 = -1;
    public AdExperienceType A02;
    public RewardData A03;
    public RewardedVideoAdListener A04;
    public String A05;
    public String A06;
    public String A07;
    public boolean A08;
    public com.facebook.ads.Ad A09;
    public WeakReference<com.facebook.ads.Ad> A0A;
    public final C0958Hi A0B;
    public final InterfaceC2151m5 A0C;
    public final String A0D;

    public C1003Jc(C0958Hi c0958Hi, String str, com.facebook.ads.Ad ad, InterfaceC2151m5 interfaceC2151m5) {
        this.A0B = c0958Hi;
        this.A0D = str;
        this.A09 = ad;
        this.A0A = new WeakReference<>(ad);
        this.A0C = interfaceC2151m5;
        c0958Hi.A0N(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2092l7
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final RewardedVideoAdListener A7O() {
        return this.A04;
    }

    public final C0958Hi A01() {
        return this.A0B;
    }

    public final void A02(com.facebook.ads.Ad ad) {
        if (ad == null) {
            C0958Hi c0958Hi = this.A0B;
            String[] strArr = A0E;
            if (strArr[1].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            A0E[4] = "e0pPDU8i87wGcMU5DIxBijYJQd";
            if (!C2203mv.A0t(c0958Hi)) {
                return;
            }
        }
        this.A09 = ad;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2092l7
    public final com.facebook.ads.Ad A7K() {
        return this.A09 != null ? this.A09 : this.A0A.get();
    }
}
