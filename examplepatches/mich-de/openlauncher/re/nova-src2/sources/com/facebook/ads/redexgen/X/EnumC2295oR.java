package com.facebook.ads.redexgen.X;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.facebook.ads.redexgen.X.oR, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class EnumC2295oR {
    public static byte[] A01;
    public static String[] A02 = {"kDoQarFxLQHBquKQI3VPKy", "9AxX8k3SjfAPczOm5o1pFhY20JZoz4Ml", b.f42142b, "gSmJR3wNYFnqEnL1PSLdRa", "5ccjAAo96Wq4Tsfs9puLOfBkSU5", "OqBmnFsqHOuOb80rkNIcS8o4JP0opsoj", "gvTokOJruRwfELD25ec76V", "grxvXWL4nqU0V5bmiOXWaGHTgk0bleOA"};
    public static final /* synthetic */ EnumC2295oR[] A03;
    public static final EnumC2295oR A04;
    public static final EnumC2295oR A05;
    public static final EnumC2295oR A06;
    public static final EnumC2295oR A07;
    public static final EnumC2295oR A08;
    public static final EnumC2295oR A09;
    public static final EnumC2295oR A0A;
    public static final EnumC2295oR A0B;
    public static final EnumC2295oR A0C;
    public static final EnumC2295oR A0D;
    public static final EnumC2295oR A0E;
    public static final EnumC2295oR A0F;
    public static final EnumC2295oR A0G;
    public static final EnumC2295oR A0H;
    public static final EnumC2295oR A0I;
    public static final EnumC2295oR A0J;
    public static final EnumC2295oR A0K;
    public static final EnumC2295oR A0L;
    public final String A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 37);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-101, -85, -88, -80, -84, -98, -85, -42, -37, -44, -36, -31, -40, -41, -14, -36, -31, -25, -14, -44, -41, -81, -76, -83, -75, -70, -79, -80, -53, -66, -62, -53, -83, -80, -49, -28, -39, -52, -40, -44, -50, -22, -44, -39, -33, -48, -35, -34, -33, -44, -33, -44, -52, -41, -66, -45, -56, -69, -57, -61, -67, -39, -56, -69, -50, -61, -48, -65, -91, -70, -81, -94, -82, -86, -92, -64, -77, -90, -72, -94, -77, -91, -90, -91, -64, -73, -86, -91, -90, -80, -49, -34, -43, -43, -24, -36, -52, -37, -50, -50, -41, -24, -33, -46, -51, -50, -40, -57, -52, -46, -61, -48, -47, -46, -57, -46, -57, -65, -54, -35, -52, -65, -46, -57, -44, -61, -35, -63, -65, -48, -51, -45, -47, -61, -54, -100, -95, -89, -104, -91, -90, -89, -100, -89, -100, -108, -97, -78, -95, -108, -89, -100, -87, -104, -78, -100, -96, -108, -102, -104, 113, 118, 124, 109, 122, 123, 124, 113, 124, 113, 105, 116, -121, 118, 105, 124, 113, 126, 109, -121, 120, 116, 105, -127, 105, 106, 116, 109, -41, -36, -30, -45, -32, -31, -30, -41, -30, -41, -49, -38, -19, -36, -49, -30, -41, -28, -45, -19, -28, -41, -46, -45, -35, -31, -26, -20, -35, -22, -21, -20, -31, -20, -31, -39, -28, -9, -18, -31, -36, -35, -25, -9, -28, -35, -39, -36, -31, -26, -33, -9, -24, -28, -39, -15, -39, -38, -28, -35, -123, 120, -128, -126, -121, 120, -110, 116, 118, -121, 124, -119, 124, -121, -116, -110, AbstractJsonLexerKt.TC_INVALID, 116, -120, -127, 118, 123, 120, -123, -49, -62, -44, -66, -49, -63, -62, -63, -36, -64, -66, -49, -52, -46, -48, -62, -55, -106, -119, -101, -123, -106, -120, -119, -120, -93, -115, -111, -123, -117, -119, -40, -53, -35, -57, -40, -54, -53, -54, -27, -42, -46, -57, -33, -57, -56, -46, -53, -125, 118, -120, 114, -125, 117, 118, 117, -112, -121, 122, 117, 118, -128, -14, -27, -32, -31, -21, -5, -24, -31, -35, -32, -27, -22, -29, -5, -20, -24, -35, -11, -35, -34, -24, -31, -71, -55, -58, -50, -54, -68, -55, -111, -106, -113, -105, -100, -109, -110, -115, -105, -100, -94, -115, -113, -110, -35, -30, -37, -29, -24, -33, -34, -39, -20, -16, -39, -37, -34, -32, -11, -22, -35, -23, -27, -33, -37, -27, -22, -16, -31, -18, -17, -16, -27, -16, -27, -35, -24, -8, 13, 2, -11, 1, -3, -9, -13, 2, -11, 8, -3, 10, -7, 4, 25, 14, 1, 13, 9, 3, -1, 18, 5, 23, 1, 18, 4, 5, 4, -1, 22, 9, 4, 5, 15, 1, 16, 7, 7, -6, 14, -2, 13, 0, 0, 9, -6, 17, 4, -1, 0, 10, -45, -40, -34, -49, -36, -35, -34, -45, -34, -45, -53, -42, -55, -40, -53, -34, -45, -32, -49, -55, -51, -53, -36, -39, -33, -35, -49, -42, -48, -43, -37, -52, -39, -38, -37, -48, -37, -48, -56, -45, -58, -43, -56, -37, -48, -35, -52, -58, -48, -44, -56, -50, -52, -70, -65, -59, -74, -61, -60, -59, -70, -59, -70, -78, -67, -80, -65, -78, -59, -70, -57, -74, -80, -63, -67, -78, -54, -78, -77, -67, -74, -105, -100, -94, -109, -96, -95, -94, -105, -94, -105, -113, -102, -115, -100, -113, -94, -105, -92, -109, -115, -92, -105, -110, -109, -99, -12, -7, -1, -16, -3, -2, -1, -12, -1, -12, -20, -9, -22, 1, -12, -17, -16, -6, -22, -9, -16, -20, -17, -12, -7, -14, -22, -5, -9, -20, 4, -20, -19, -9, -16, 3, -10, -2, 0, 5, -10, -16, -14, -12, 5, -6, 7, -6, 5, 10, -16, -3, -14, 6, -1, -12, -7, -10, 3, -43, -56, -38, -60, -43, -57, -56, -57, -62, -58, -60, -43, -46, -40, -42, -56, -49, -105, -118, -100, -122, -105, -119, -118, -119, -124, -114, -110, -122, -116, -118, -41, -54, -36, -58, -41, -55, -54, -55, -60, -43, -47, -58, -34, -58, -57, -47, -54, -94, -107, -89, -111, -94, -108, -107, -108, -113, -90, -103, -108, -107, -97, -25, -38, -43, -42, -32, -48, -35, -42, -46, -43, -38, -33, -40, -48, -31, -35, -46, -22, -46, -45, -35, -42};
    }

    static {
        A01();
        A0E = new EnumC2295oR(A00(188, 25, 105), 0, A00(544, 25, 9));
        A0C = new EnumC2295oR(A00(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 25, 46), 1, A00(491, 25, 66));
        A0B = new EnumC2295oR(A00(107, 28, 89), 2, A00(463, 28, 69));
        A0D = new EnumC2295oR(A00(160, 28, 3), 3, A00(516, 28, 44));
        A0F = new EnumC2295oR(A00(Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, 35, 115), 4, A00(569, 35, 102));
        A0A = new EnumC2295oR(A00(90, 17, 100), 5, A00(446, 17, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
        A0K = new EnumC2295oR(A00(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 14, 12), 6, A00(676, 14, 11));
        A0J = new EnumC2295oR(A00(303, 17, 97), 7, A00(659, 17, 64));
        A0H = new EnumC2295oR(A00(272, 17, 88), 8, A00(628, 17, 62));
        A04 = new EnumC2295oR(A00(0, 7, 52), 9, A00(356, 7, 50));
        A08 = new EnumC2295oR(A00(54, 14, 85), 10, A00(TTAdConstant.IMAGE_LIST_SIZE_CODE, 14, 111));
        A07 = new EnumC2295oR(A00(34, 20, 102), 11, A00(390, 20, 87));
        A09 = new EnumC2295oR(A00(68, 22, 60), 12, A00(424, 22, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        A06 = new EnumC2295oR(A00(21, 13, 71), 13, A00(377, 13, 85));
        A05 = new EnumC2295oR(A00(7, 14, 110), 14, A00(363, 14, 9));
        A0G = new EnumC2295oR(A00(248, 24, 14), 15, A00(604, 24, 108));
        A0L = new EnumC2295oR(A00(334, 22, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), 16, A00(690, 22, 76));
        A0I = new EnumC2295oR(A00(289, 14, 31), 17, A00(645, 14, 0));
        A03 = A02();
    }

    public EnumC2295oR(String str, int i5, String str2) {
        this.A00 = str2;
    }

    public static /* synthetic */ EnumC2295oR[] A02() {
        EnumC2295oR[] enumC2295oRArr = new EnumC2295oR[18];
        enumC2295oRArr[0] = A0E;
        enumC2295oRArr[1] = A0C;
        enumC2295oRArr[2] = A0B;
        enumC2295oRArr[3] = A0D;
        enumC2295oRArr[4] = A0F;
        enumC2295oRArr[5] = A0A;
        EnumC2295oR enumC2295oR = A0K;
        String[] strArr = A02;
        if (strArr[7].charAt(15) != strArr[1].charAt(15)) {
            throw new RuntimeException();
        }
        A02[3] = "wwKP57wMdvJjY0qKYcxKFn";
        enumC2295oRArr[6] = enumC2295oR;
        enumC2295oRArr[7] = A0J;
        enumC2295oRArr[8] = A0H;
        enumC2295oRArr[9] = A04;
        enumC2295oRArr[10] = A08;
        enumC2295oRArr[11] = A07;
        enumC2295oRArr[12] = A09;
        enumC2295oRArr[13] = A06;
        enumC2295oRArr[14] = A05;
        enumC2295oRArr[15] = A0G;
        enumC2295oRArr[16] = A0L;
        enumC2295oRArr[17] = A0I;
        return enumC2295oRArr;
    }

    public final String A03() {
        return this.A00;
    }

    public static EnumC2295oR valueOf(String str) {
        return (EnumC2295oR) Enum.valueOf(EnumC2295oR.class, str);
    }

    public static EnumC2295oR[] values() {
        return (EnumC2295oR[]) A03.clone();
    }
}
