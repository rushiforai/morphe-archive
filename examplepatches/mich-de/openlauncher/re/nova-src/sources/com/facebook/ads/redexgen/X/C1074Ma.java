package com.facebook.ads.redexgen.X;

import android.telephony.TelephonyCallback;
import android.telephony.TelephonyDisplayInfo;

/* renamed from: com.facebook.ads.redexgen.X.Ma, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1074Ma extends TelephonyCallback implements TelephonyCallback.DisplayInfoListener {
    public static String[] A01 = {"qJ49io2EbpxURWUKkMAdMHlA9JYN5Nx4", "mfwonON7wXzSPnH255f9j8pE1fefvDwu", "FvYkXdUo0reKOi4up0muwTRn3FqaqpLa", "c6GPrSjIoHZjgGAXu1GV7xSWA7eqy98w", "JEE49BVEpsHR3WAFPo4mVlXWEy9GYai5", "WI1VXowVkYo8LKiTqFwx9ewX2jx", "4YwPPYvSx3JtrtRsePNFwywRSMcRfEvC", "iRVdC"};
    public final C1078Me A00;

    public C1074Ma(C1078Me c1078Me) {
        this.A00 = c1078Me;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onDisplayInfoChanged(TelephonyDisplayInfo telephonyDisplayInfo) {
        boolean is5gNsa;
        int overrideNetworkType = telephonyDisplayInfo.getOverrideNetworkType();
        if (overrideNetworkType != 3) {
            String[] strArr = A01;
            String str = strArr[3];
            String str2 = strArr[1];
            int iCharAt = str.charAt(26);
            int overrideNetworkType2 = str2.charAt(26);
            if (iCharAt != overrideNetworkType2) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[3] = "Aye3dtDH7Uo1HR1wrzzbgtOGJKeq1ANF";
            strArr2[1] = "zcbTySA6e1TwkaXxCT9LVPuVYYe2fXuv";
            is5gNsa = overrideNetworkType == 4 || overrideNetworkType == 5;
        }
        this.A00.A07(is5gNsa ? 10 : 5);
    }
}
