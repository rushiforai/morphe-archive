package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.l2, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2089l2 {
    public static int A00;
    public static int A01;
    public static int A02;
    public static int A03;
    public static int A04;
    public static int A05;
    public static int A06;
    public static int A07;
    public static byte[] A08;
    public static final String A09;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 62);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A08 = new byte[]{-120, -90, -88, -83, -86, 101, -87, -82, -72, -80, 101, -85, -90, -82, -79, -70, -73, -86, 115, -63, -33, -31, -26, -29, -98, -30, -25, -15, -23, -98, -15, -13, -31, -31, -29, -15, -15, -84, -63, -33, -31, -26, -29, -98, -30, -19, -11, -20, -22, -19, -33, -30, -98, -28, -33, -25, -22, -13, -16, -29, -84, -127, -97, -95, -90, -93, 94, -90, -89, -78, 108, -72, -42, -40, -35, -38, -107, -30, -34, -24, -24, -93, -83, -80, -85, -81, -66, -79, -83, -64, -75, -62, -79, -85, -65, -75, -58, -79, -85, -82, -59, -64, -79, -65, -55, -52, -57, -53, -38, -51, -55, -36, -47, -34, -51, -57, -36, -31, -40, -51, -95, -92, -97, -90, -81, -78, -83, -95, -76, -97, -76, -71, -80, -91, 21, 24, 19, 38, 25, 37, 41, 25, 39, 40, 19, 29, 24, -79, -60, -60, -75, -67, -64, -60, -78, -80, -78, -73, -76, 24, 22, 24, 29, 26, 20, 24, 36, 35, 41, 26, 45, 41, -50, -55, -47, -44, -35, -38, -51, -57, -38, -51, -55, -37, -41, -42, 22, 26, 14, 20, 18, 11, 14, 0, 3, -2, 19, 8, 12, 4, 5, 2, -4};
    }

    static {
        A01();
        A09 = C2089l2.class.getSimpleName();
        A05 = AbstractC2126lf.A0o;
        A06 = AbstractC2126lf.A0s;
        A02 = AbstractC2126lf.A0l;
        A01 = AbstractC2126lf.A0k;
        A03 = AbstractC2126lf.A0m;
        A00 = AbstractC2126lf.A0i;
        A04 = AbstractC2126lf.A0n;
        A07 = AbstractC2126lf.A0t;
    }

    public static void A02(C2095lA c2095lA, C2079ks c2079ks, int i5, String str, long j11) {
        if (!A06(c2095lA)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(A00(120, 14, 2), c2079ks.A01);
            jSONObject.put(A00(Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 13, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), c2079ks.A02);
            if (j11 > 0) {
                jSONObject.put(A00(191, 9, 97), C2416qS.A07(System.currentTimeMillis() - j11));
            }
            C2127lg c2127lg = new C2127lg(str);
            c2127lg.A07(jSONObject);
            c2127lg.A05(1);
            c2095lA.A08().AC0(A00(154, 5, 17), i5, c2127lg);
        } catch (Throwable deLogException) {
            c2095lA.A08().A4j(deLogException);
        }
    }

    public static void A03(C2095lA c2095lA, C2084kx c2084kx, String str, int i5, String str2, Long l9, Long l11) {
        if (A06(c2095lA)) {
            A05(c2095lA, c2084kx.A06, c2084kx.A07, c2084kx.A08, A00(186, 5, 111), str, i5, str2, l9, l11, null);
        }
    }

    public static void A04(C2095lA c2095lA, C2088l1 c2088l1, boolean z11) {
        if (!A06(c2095lA)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(A00(120, 14, 2), c2088l1.A01);
            jSONObject.put(A00(Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 13, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), c2088l1.A03);
            jSONObject.put(A00(104, 16, 42), c2088l1.A02);
            jSONObject.put(A00(159, 13, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), c2088l1.A00);
            if (C2203mv.A2U(c2095lA)) {
                jSONObject.put(A00(200, 3, 82), c2088l1.A04);
            }
            String strA00 = z11 ? A00(61, 10, 0) : A00(71, 11, 55);
            int i5 = z11 ? A05 : A06;
            C2127lg c2127lg = new C2127lg(strA00);
            c2127lg.A07(jSONObject);
            c2127lg.A05(1);
            c2095lA.A08().AC0(A00(154, 5, 17), i5, c2127lg);
        } catch (Throwable th2) {
            c2095lA.A08().A4j(th2);
        }
    }

    public static void A05(C2095lA c2095lA, String str, String str2, String str3, String str4, String str5, int i5, String str6, Long l9, Long l11, Integer num) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(A00(120, 14, 2), str);
            jSONObject.put(A00(Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 13, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), str2);
            jSONObject.put(A00(104, 16, 42), str4);
            if (str6 != null) {
                jSONObject.put(A00(172, 14, 42), str6);
            }
            if (l9 != null) {
                jSONObject.put(A00(82, 22, 14), String.valueOf(l9));
            }
            if (l11 != null) {
                jSONObject.put(A00(191, 9, 97), String.valueOf(l11));
            }
            if (num != null) {
                jSONObject.put(A00(147, 7, 18), String.valueOf(num));
            }
            jSONObject.put(A00(159, 13, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), str5);
            if (C2203mv.A2U(c2095lA)) {
                jSONObject.put(A00(200, 3, 82), str3);
            }
            String strA00 = A00(19, 19, 64);
            if (i5 == A03) {
                strA00 = A00(38, 23, 64);
            } else if (i5 == A01) {
                strA00 = A00(0, 19, 7);
            }
            C2127lg c2127lg = new C2127lg(strA00);
            c2127lg.A07(jSONObject);
            c2127lg.A05(1);
            c2095lA.A08().AC0(A00(154, 5, 17), i5, c2127lg);
        } catch (Throwable th2) {
            c2095lA.A08().A4j(th2);
        }
    }

    public static boolean A06(C2095lA c2095lA) {
        int iA06;
        if (c2095lA.A05().AB6()) {
            iA06 = 1;
        } else {
            iA06 = AbstractC2205mx.A06(c2095lA);
        }
        if (iA06 == 0) {
            return false;
        }
        return iA06 <= 0 || c2095lA.A09().A00() <= 1.0d / ((double) iA06);
    }
}
