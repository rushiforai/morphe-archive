package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdExperienceType;
import com.facebook.ads.CacheFlag;
import com.facebook.ads.RewardData;
import com.facebook.ads.internal.protocol.AdPlacementType;
import java.util.EnumSet;
import java.util.LinkedHashSet;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.fy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1781fy {
    public static String[] A0E = {"erlsxJKV5RGKo0fyhsjft4C8myFkBTFD", "xxCOSS58nTJL4g358MAx2boWparhVsnt", "50HA7KO7TX73z1", "kwTSvTyvqMkAeNvnsZNufhK8xoNKpC5A", "CvvJJ5wn5WoPjh", "PJeUG8MSArG13FCqdbuWaTyquTMQa3YW", "KbVXHt7uQSAfPtAdYM2eE220TAgmiqZ3", "QWgxf2msfb1fWKXeTjGnwNJbVHOPLzwf"};
    public int A00;
    public long A01;
    public RewardData A02;
    public EnumC2246nc A03;
    public String A04;
    public String A05;
    public boolean A06;
    public final InterfaceC2151m5 A07;
    public final EnumC2264nw A08;
    public final EnumC2265nx A09;
    public final String A0A;
    public final EnumSet<CacheFlag> A0B;
    public final int A0C;
    public final AdPlacementType A0D;

    public C1781fy(String str, EnumC2265nx enumC2265nx, AdPlacementType adPlacementType, EnumC2264nw enumC2264nw, int i5, InterfaceC2151m5 interfaceC2151m5) {
        this(str, enumC2265nx, adPlacementType, enumC2264nw, i5, EnumSet.of(CacheFlag.NONE), interfaceC2151m5);
    }

    public C1781fy(String str, EnumC2265nx enumC2265nx, AdPlacementType adPlacementType, EnumC2264nw enumC2264nw, int i5, EnumSet<CacheFlag> cacheFlags, InterfaceC2151m5 interfaceC2151m5) {
        this.A0A = str;
        this.A0D = adPlacementType;
        this.A08 = enumC2264nw;
        this.A0C = i5;
        this.A0B = cacheFlags;
        this.A09 = enumC2265nx;
        this.A00 = -1;
        this.A07 = interfaceC2151m5;
    }

    public final C2285oH A00(C0958Hi c0958Hi, C2269o1 c2269o1, AdExperienceType adExperienceType) {
        return new C2285oH(c0958Hi, this.A0A, this.A08 != null ? new C2402qE(this.A08.A04(), this.A08.A03()) : null, this.A09, this.A0C, c2269o1, AbstractC2408qK.A01(C2203mv.A0L(c0958Hi)), this.A04, adExperienceType != null ? adExperienceType.getAdExperienceType() : null, this.A07);
    }

    public final Set<AdPlacementType> A01() {
        LinkedHashSet linkedHashSet = new LinkedHashSet(2);
        if (this.A0D == AdPlacementType.BANNER && this.A09 == EnumC2265nx.A0C) {
            linkedHashSet.add(AdPlacementType.BANNER);
            linkedHashSet.add(AdPlacementType.MEDIUM_RECTANGLE);
            return linkedHashSet;
        }
        AdPlacementType adPlacementType = this.A0D;
        String[] strArr = A0E;
        if (strArr[1].charAt(17) != strArr[6].charAt(17)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0E;
        strArr2[1] = "zbxk3g2hc91z08wwyMRddWTvjbNPPYOq";
        strArr2[6] = "pRmd8QufQxWOhwmR0MzBqVe9WVYKkaUX";
        if (adPlacementType != null) {
            linkedHashSet.add(this.A0D);
            return linkedHashSet;
        }
        if (this.A08 == null) {
            linkedHashSet.add(AdPlacementType.NATIVE);
            return linkedHashSet;
        }
        if (this.A08 == EnumC2264nw.A07) {
            linkedHashSet.add(AdPlacementType.INTERSTITIAL);
            return linkedHashSet;
        }
        linkedHashSet.add(AdPlacementType.BANNER);
        return linkedHashSet;
    }

    public final void A02(int i5) {
        this.A00 = i5;
    }

    public final void A03(long j11) {
        this.A01 = j11;
    }

    public final void A04(RewardData rewardData) {
        this.A02 = rewardData;
    }

    public final void A05(EnumC2246nc enumC2246nc) {
        this.A03 = enumC2246nc;
    }

    public final void A06(String str) {
        this.A04 = str;
    }

    public final void A07(String str) {
        this.A05 = str;
    }

    public final void A08(boolean z11) {
        this.A06 = z11;
    }
}
