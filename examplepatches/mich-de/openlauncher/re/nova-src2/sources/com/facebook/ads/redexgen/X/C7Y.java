package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.facebook.ads.AdExperienceType;
import com.facebook.ads.RewardData;
import com.facebook.ads.RewardedVideoAd;

/* renamed from: com.facebook.ads.redexgen.X.7Y, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C7Y extends K6 {
    public static String[] A02 = {"6CKGqR2K2MH05agWbJN3ka4F1ij3xhtD", "25gFyXHUhXKi43K8KJ4chgoS7w07JQQZ", "vjdmG7Wc53PSGoj25veSMfUO8xL7SxfR", "TQa00i6LjIP9KGMZzj8Rx2HUQjG1dRa1", "ap4e45gngLG", "PTi4Abr85pNMPfkRgyZo1NxbOs1aDg0f", "O7pu2EfbMgektne8Y3vUNLOEHbflJ4Uv", "IlEhKaiOmMN"};
    public C1021Jw A00;
    public final C1003Jc A01;

    public C7Y(C1003Jc c1003Jc, String str) {
        super(c1003Jc.A0B, str, A00(c1003Jc));
        this.A01 = c1003Jc;
    }

    public static C1002Jb A00(C1003Jc c1003Jc) {
        return new C1002Jb(c1003Jc);
    }

    @Override // com.facebook.ads.redexgen.X.K6
    public final void A08() {
        if (super.A01.A01) {
            this.A05.A6U();
        }
        if (this.A00 != null) {
            C1021Jw c1021Jw = this.A00;
            String[] strArr = A02;
            if (strArr[5].charAt(27) == strArr[1].charAt(27)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[7] = "OTs4vDTOcZJ";
            strArr2[4] = "GHmi9WBRjgB";
            c1021Jw.destroy();
        }
        InterfaceC1788g5 interfaceC1788g5 = super.A00;
        String[] strArr3 = A02;
        if (strArr3[5].charAt(27) == strArr3[1].charAt(27)) {
            interfaceC1788g5.AKe(EnumC1787g4.A04);
        } else {
            A02[0] = "w6lX3gRSvxAib5TV4LicqhPN1UIY4bV3";
            interfaceC1788g5.AKe(EnumC1787g4.A04);
        }
    }

    @Override // com.facebook.ads.redexgen.X.K6
    public final void A09() {
        this.A00 = new C1021Jw(this.A01, this, A04());
        this.A00.A0J(this.A01.A05, this.A01.A02, this.A01.A08);
    }

    @Override // com.facebook.ads.redexgen.X.K6
    public final void A0A() {
        EnumC2154m8.A05(EnumC2154m8.A0A, EnumC2154m8.A08);
    }

    @Override // com.facebook.ads.redexgen.X.K6
    public final void A0E(boolean z11) {
        this.A05.AL5(z11);
    }

    public final C1003Jc A0F() {
        return this.A01;
    }

    public final void A0G(com.facebook.ads.Ad ad, String str, AdExperienceType adExperienceType, boolean z11) {
        if (super.A00.A73()) {
            return;
        }
        this.A01.A02(ad);
        if (this.A00 != null) {
            this.A00.A0J(str, adExperienceType, z11);
            String[] strArr = A02;
            if (strArr[7].length() != strArr[4].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[5] = "snzzAybKLkKRz85P4BzzU6VwJ24uwEo8";
            strArr2[1] = "iwkpZYLOXs3iYxZlCgOD0Nxy0vDnSGoK";
            return;
        }
        this.A01.A05 = str;
        this.A01.A02 = adExperienceType;
        this.A01.A08 = z11;
        if (AbstractC2206my.A0F(this.A02) && AbstractC2206my.A0H(this.A02)) {
            if (AbstractC2206my.A0U(str)) {
                EnumC2154m8.A03(EnumC2154m8.A0A);
                A05();
                return;
            } else {
                EnumC2154m8.A03(EnumC2154m8.A0B);
                A09();
                return;
            }
        }
        EnumC2154m8.A03(EnumC2154m8.A0C);
        A09();
    }

    public final void A0H(RewardData rewardData) {
        this.A01.A03 = rewardData;
        if (super.A01.A01) {
            super.A01.A0F(2003, AbstractC1811gS.A00(new Bundle(), rewardData));
        } else if (this.A00 != null) {
            this.A00.A0I(rewardData);
        }
    }

    public final boolean A0I() {
        if (this.A00 != null) {
            return this.A00.A0K();
        }
        return this.A01.A01 > 0 && C2416qS.A00() > this.A01.A01;
    }

    public final boolean A0J() {
        if (this.A00 != null) {
            return this.A00.A0L();
        }
        return super.A00.A7P() == EnumC1787g4.A06;
    }

    public final boolean A0K(com.facebook.ads.Ad ad, RewardedVideoAd.RewardedVideoShowAdConfig rewardedVideoShowAdConfig) {
        int iA00 = ((C2047kL) rewardedVideoShowAdConfig).A00();
        long previousAdViewTime = ((C2047kL) rewardedVideoShowAdConfig).A01();
        if (super.A00.A74()) {
            return false;
        }
        this.A01.A02(ad);
        if (super.A01.A01) {
            A0B(iA00);
            return true;
        }
        if (this.A00 != null) {
            return this.A00.A0M(iA00, previousAdViewTime);
        }
        this.A00 = new C1021Jw(this.A01, this, A04());
        this.A00.A0M(iA00, previousAdViewTime);
        return false;
    }
}
