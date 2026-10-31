package com.facebook.ads.internal.protocol;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;

/* loaded from: assets/audience_network/classes.dex */
public enum AdPlacementType {
    BANNER(A00(74, 6, 17)),
    MEDIUM_RECTANGLE(A00(92, 16, 15)),
    INTERSTITIAL(A00(80, 12, 77)),
    NATIVE(A00(108, 6, 100)),
    NATIVE_BANNER(A00(114, 13, 15)),
    REWARDED_VIDEO(A00(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 14, 107)),
    UNKNOWN(A00(141, 7, 57));

    public static byte[] A01;
    public String A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 99);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{20, 19, 32, 32, 23, 36, 35, 40, 46, 31, 44, 45, 46, 35, 46, 35, 27, 38, 37, 29, 28, 33, 45, 37, 55, 42, 29, 27, 44, 25, 38, 31, 36, 29, 4, -9, 10, -1, 12, -5, -44, -57, -38, -49, -36, -53, -27, -56, -57, -44, -44, -53, -40, 19, 6, 24, 2, 19, 5, 6, 5, 32, 23, 10, 5, 6, 16, -57, -64, -67, -64, -63, -55, -64, -42, -43, -30, -30, -39, -26, 25, 30, 36, 21, 34, 35, 36, 25, 36, 25, 17, 28, -33, -41, -42, -37, -25, -33, -47, -28, -41, -43, -26, -45, -32, -39, -34, -41, 53, 40, 59, 48, 61, 44, -32, -45, -26, -37, -24, -41, -47, -44, -45, -32, -32, -41, -28, 64, 51, 69, 47, 64, 50, 51, 50, 45, 68, 55, 50, 51, 61, 17, 10, 7, 10, 11, 19, 10};
    }

    static {
        A01();
    }

    AdPlacementType(String str) {
        this.A00 = str;
    }

    public static AdPlacementType fromString(String str) {
        if (TextUtils.isEmpty(str)) {
            return UNKNOWN;
        }
        try {
            return valueOf(str.toUpperCase(Locale.US));
        } catch (Exception unused) {
            return UNKNOWN;
        }
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.A00;
    }
}
