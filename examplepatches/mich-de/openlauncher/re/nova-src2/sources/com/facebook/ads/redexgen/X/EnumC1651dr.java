package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.dr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1651dr {
    A0D(A00(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 5, 4)),
    A0B(A00(Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 5, 48)),
    A03(A00(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 8, 13)),
    A0C(A00(Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 8, 56)),
    A08(A00(182, 10, 19)),
    A0A(A00(201, 9, 108)),
    A09(A00(192, 9, 112)),
    A04(A00(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, 7, 27)),
    A06(A00(156, 13, 102)),
    A07(A00(169, 13, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)),
    A0E(A00(228, 22, 58)),
    A05(A00(140, 16, 80));

    public static byte[] A01;
    public final String A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 50);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{19, 17, 2, 31, 5, 3, 21, 28, 16, 27, 18, 26, 29, 22, 23, 115, 120, 113, 121, 126, 117, 116, 111, 115, 113, 98, AbstractJsonLexerKt.TC_INVALID, 101, 99, 117, 124, 17, 26, 19, 27, 28, 23, 22, 13, 27, 31, 19, 21, 23, 111, 100, 109, 101, 98, 105, 104, 115, 122, 101, 104, 105, 99, 90, 77, 82, 65, 86, 71, 92, 76, 87, 90, 78, 89, 70, 85, 67, 71, 75, 77, 79, 96, 119, 104, 123, 114, 109, 96, 97, 107, 16, 20, 24, 30, 28, 90, 70, 75, 83, 75, 72, 70, 79, 2, 29, 16, 17, 27, 46, 49, 60, 61, 55, 39, 52, 61, 57, 60, 49, 54, 63, 39, 40, 52, 57, 33, 57, 58, 52, 61, 92, 94, 77, 80, 74, 76, 90, 83, 74, 65, 72, 64, 71, 76, 77, 1, 10, 3, 11, 12, 7, 6, 61, 1, 3, 16, 13, 23, 17, 7, 14, 55, 60, 53, 61, 58, 49, 48, 11, 61, 57, 53, 51, 49, 43, 32, 41, 33, 38, 45, 44, 23, 62, 33, 44, 45, 39, 69, 82, 77, 126, 73, 88, 67, 83, 72, 69, 38, 49, 46, 29, 43, 47, 35, 37, 39, 58, 45, 50, 1, 40, 55, 58, 59, 49, 107, 111, 99, 101, 103, 122, 102, 107, 115, 107, 104, 102, 111, 64, 95, 82, 83, 89, 126, 97, 108, 109, 103, 87, 100, 109, 105, 108, 97, 102, 111, 87, 120, 100, 105, 113, 105, 106, 100, 109};
    }

    static {
        A01();
    }

    EnumC1651dr(String str) {
        this.A00 = str;
    }

    public final String A03() {
        return this.A00;
    }
}
