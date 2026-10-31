package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.pp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2377pp {
    public static C1758fb A00(LA la2) {
        return la2.A32().A0I().A07();
    }

    public static EnumC1766fj A01(LA la2) {
        C1758fb playableData = A00(la2);
        if (playableData != null) {
            return playableData.A0H();
        }
        return EnumC1766fj.A04;
    }

    public static boolean A02(boolean z11, LA la2) {
        return A03(z11, la2) && A01(la2) == EnumC1766fj.A05;
    }

    public static boolean A03(boolean z11, LA la2) {
        C1758fb playableData = A00(la2);
        return z11 && playableData != null && playableData.A0Y();
    }
}
