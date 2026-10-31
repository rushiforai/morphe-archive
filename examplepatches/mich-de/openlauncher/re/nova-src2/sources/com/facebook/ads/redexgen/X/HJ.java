package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.api.BuildConfigApi;
import com.facebook.ads.internal.bridge.fbsdk.FBLoginASID;
import com.facebook.ads.internal.bridge.gms.AdvertisingId;
import com.facebook.ads.internal.settings.AdInternalSettings;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class HJ implements InterfaceC2100lF {
    public static byte[] A01;
    public static String[] A02 = {"5s7Vvh0NyBhQSPw27iRWGG1DtqQsP1Sv", "FrTyZebbkrmGpsa0d1dFSR1fbKrcWzi5", "vbBgTS8gp4295EX74czAq4g", "ai", "WolquZ0AL0Qdfn", "cakCtq0fnE5al5DYRrCiV1B2lu7xESbR", "HXQXhYUpdji2Kg3a54R03lC9IEJsCvaM", "NPxj8bqKiKcB9Z0ZqCVSMRQGt9eaxHA1"};
    public final C2095lA A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 16);
            String[] strArr = A02;
            if (strArr[2].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[0] = "3cPMFplOUK5Ssg4O5bRCUJRCJG4m75Bq";
            strArr2[6] = "bSCrfJrMY4RCrVdm5HRU5l61ngvuX2qf";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-81, -36, -46, -32, -35, -41, -46};
    }

    static {
        A01();
    }

    public HJ(C2095lA c2095lA) {
        this.A00 = c2095lA;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final String A7j() {
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final String A8h() {
        return AbstractC2293oP.A02(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final String A8i() {
        return FBLoginASID.getFBLoginASID();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final String A98() {
        return AdInternalSettings.getMediationService();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final String A9F() {
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final InterfaceC2099lE A9a() {
        AdvertisingId advertisingIdInfoDirectly = AdvertisingId.getAdvertisingIdInfoDirectly(this.A00);
        if (advertisingIdInfoDirectly == null) {
            return null;
        }
        return new HK(this, advertisingIdInfoDirectly);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final String AA3() {
        return AdInternalSettings.getUrlPrefix();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final String AA5() {
        return A00(0, 7, 94);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final String AA6() {
        return BuildConfigApi.getVersionName(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2100lF
    public final boolean AB6() {
        return BuildConfigApi.isDebug();
    }
}
