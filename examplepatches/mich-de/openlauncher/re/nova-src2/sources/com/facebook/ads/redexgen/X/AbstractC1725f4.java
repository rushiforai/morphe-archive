package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import javax.annotation.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.f4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1725f4 {
    public static byte[] A00;
    public static String[] A01 = {"qHmRz", "buvn2cesYrN8zmkoMAJdpkbnyQRY3iAF", "x7vS8I9TWcDRkC3QyQGWlMzhObF4g2wW", "AIjy2jeTbkREqnWnmOA9dVfWABJZ", "IfUpOWHYsX9n2UOxpamTmBNI3XVXxi7a", "s9Ktc", "3piv7SWQV7vtTtwTZRFeo4G9v1NaSSob", "iW7v8IxehIW1LC67DBoujqNPrB3dw9pM"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static LK A01(@Nullable C0958Hi c0958Hi, JSONObject jSONObject, String str, boolean z11, int i5, int i11) {
        if (jSONObject == null) {
            return new LK();
        }
        AbstractC2358pW.A04(c0958Hi, A02(0, 23, 77));
        String strOptString = jSONObject.optString(A02(479, 10, 93));
        int iOptInt = jSONObject.optInt(A02(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 12, 73), 0);
        String strOptString2 = jSONObject.optString(A02(253, 13, 84));
        String strA02 = AbstractC2392q4.A02(jSONObject, A02(266, 12, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        Uri uriA00 = TextUtils.isEmpty(strA02) ? null : AbstractC2351pP.A00(strA02);
        String strA022 = AbstractC2392q4.A02(jSONObject, A02(128, 4, 27));
        String strA01 = AbstractC2410qM.A01(strA022);
        String strA023 = AbstractC2392q4.A02(jSONObject, A02(101, 15, 115));
        String strA024 = AbstractC2392q4.A02(jSONObject, A02(593, 5, 95));
        String strA025 = AbstractC2392q4.A02(jSONObject, A02(585, 8, 77));
        String strA026 = AbstractC2392q4.A02(jSONObject, A02(386, 8, 91));
        String strA027 = AbstractC2392q4.A02(jSONObject, A02(539, 14, 93));
        String strA028 = AbstractC2392q4.A02(jSONObject, A02(TTAdConstant.DEEPLINK_UNAVAILABLE_CODE, 16, 77));
        String strA029 = AbstractC2392q4.A02(jSONObject, A02(553, 21, 84));
        String strA0210 = AbstractC2392q4.A02(jSONObject, A02(87, 14, 42));
        String strA0211 = AbstractC2392q4.A02(jSONObject, A02(459, 20, 38));
        String strA0212 = AbstractC2392q4.A02(jSONObject, A02(443, 16, 21));
        String strA0213 = AbstractC2392q4.A02(jSONObject, A02(426, 17, 112));
        String strA0214 = AbstractC2392q4.A02(jSONObject, A02(Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, 14, 22));
        C07157h c07157hA00 = C07157h.A00(jSONObject, c0958Hi);
        C2252ni c2252niA00 = C2252ni.A00(jSONObject.optJSONObject(A02(394, 4, 98)));
        C2252ni c2252niA002 = C2252ni.A00(jSONObject.optJSONObject(A02(398, 5, 70)));
        C2253nj c2253njA00 = C2253nj.A00(jSONObject.optJSONObject(A02(574, 11, 61)));
        String strA0215 = AbstractC2392q4.A02(jSONObject, A02(598, 15, 56));
        boolean zOptBoolean = jSONObject.optBoolean(A02(238, 15, 6));
        boolean zOptBoolean2 = jSONObject.optBoolean(A02(Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 19, 21));
        int iOptInt2 = jSONObject.optInt(A02(514, 25, 5), 4);
        int iOptInt3 = jSONObject.optInt(A02(489, 25, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE), 0);
        int iOptInt4 = jSONObject.optInt(A02(695, 31, 100), 0);
        int iOptInt5 = jSONObject.optInt(A02(726, 26, 50), 1000);
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(A02(53, 15, 6));
        C2252ni c2252niA003 = jSONObjectOptJSONObject != null ? C2252ni.A00(jSONObjectOptJSONObject) : null;
        String strA0216 = AbstractC2392q4.A02(jSONObject, A02(68, 19, 17));
        EnumC1703eh enumC1703ehA00 = AbstractC1705ej.A00(jSONObject);
        Collection<String> collectionA03 = AbstractC1705ej.A03(c0958Hi, jSONObject);
        String strA0217 = AbstractC2392q4.A02(jSONObject, A02(686, 9, 101));
        int iOptInt6 = jSONObject.optInt(A02(635, 18, 108), 0);
        long jOptLong = jSONObject.optLong(A02(662, 24, 67), -1L);
        String strA0218 = AbstractC2392q4.A02(jSONObject, A02(653, 9, 102));
        String strA0219 = A02(613, 22, 30);
        EnumC2256nm enumC2256nm = !jSONObject.has(strA0219) ? EnumC2256nm.A03 : jSONObject.optBoolean(strA0219) ? EnumC2256nm.A05 : EnumC2256nm.A04;
        boolean zOptBoolean3 = jSONObject.optBoolean(A02(190, 29, 72));
        int iOptInt7 = jSONObject.optInt(A02(154, 36, 110), 100);
        boolean zOptBoolean4 = jSONObject.optBoolean(A02(278, 18, 19), false);
        int iOptInt8 = jSONObject.optInt(A02(296, 26, 64), 10);
        boolean zOptBoolean5 = jSONObject.optBoolean(A02(353, 33, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), false);
        int iOptInt9 = jSONObject.optInt(A02(Sdk.SDKError.Reason.MRAID_UNRECOGNIZED_COMMAND_VALUE, 31, 93), 1);
        ArrayList arrayList = null;
        try {
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(A02(146, 8, 0));
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
                int length = jSONArrayOptJSONArray.length();
                ArrayList arrayList2 = new ArrayList(length);
                for (int i12 = 0; i12 < length; i12++) {
                    try {
                        arrayList2.add(A01(c0958Hi, jSONArrayOptJSONArray.getJSONObject(i12), str, true, i12, length));
                    } catch (JSONException e3) {
                        e = e3;
                        if (A01[6].charAt(19) != 'e') {
                            throw new RuntimeException();
                        }
                        String[] strArr = A01;
                        strArr[0] = "nA4Cb";
                        strArr[5] = "npWbY";
                        arrayList = arrayList2;
                        c0958Hi.A08().ABz(A02(419, 7, 84), AbstractC2126lf.A2A, new C2127lg(e));
                        Log.e(C1056Lh.A0E, A02(23, 30, 50), e);
                        return new LK(strA0216, strA01, strA022, strA023, strA024, strA025, strA026, strA027, strA028, strA029, strA0210, strA0211, strA0212, strA0213, strA0214, c2252niA003, c07157hA00, c2252niA00, c2252niA002, c2253njA00, strA0217, strA0218, jOptLong, enumC2256nm, z11, i5, i11, arrayList, str, strOptString, iOptInt, strOptString2, uriA00, strA0215, zOptBoolean, zOptBoolean2, iOptInt3, iOptInt2, iOptInt4, iOptInt5, enumC1703ehA00, collectionA03, iOptInt7, zOptBoolean3, iOptInt6, zOptBoolean4, iOptInt8, zOptBoolean5, iOptInt9);
                    }
                }
                arrayList = arrayList2;
            }
        } catch (JSONException e11) {
            e = e11;
        }
        return new LK(strA0216, strA01, strA022, strA023, strA024, strA025, strA026, strA027, strA028, strA029, strA0210, strA0211, strA0212, strA0213, strA0214, c2252niA003, c07157hA00, c2252niA00, c2252niA002, c2253njA00, strA0217, strA0218, jOptLong, enumC2256nm, z11, i5, i11, arrayList, str, strOptString, iOptInt, strOptString2, uriA00, strA0215, zOptBoolean, zOptBoolean2, iOptInt3, iOptInt2, iOptInt4, iOptInt5, enumC1703ehA00, collectionA03, iOptInt7, zOptBoolean3, iOptInt6, zOptBoolean4, iOptInt8, zOptBoolean5, iOptInt9);
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 112);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{-2, 50, 33, 38, 34, 43, 32, 34, -35, 11, 34, 49, 52, 44, 47, 40, -35, 9, 44, 30, 33, 34, 33, -9, 16, 3, 4, 14, 7, -62, 22, 17, -62, 18, 3, 20, 21, 7, -62, 5, 3, 20, 17, 23, 21, 7, 14, -62, 6, 3, 22, 3, -48, -41, -38, -43, -39, -34, -27, -33, -39, -37, -23, -43, -33, -39, -27, -28, -30, -27, -32, -28, -23, -16, -22, -28, -26, -12, -32, -19, -22, -17, -20, -32, -10, -13, -19, -5, -2, -7, 14, 12, -5, 8, 13, 6, -5, 14, 3, 9, 8, 68, 71, 89, 72, 85, 87, 76, 86, 72, 85, 66, 81, 68, 80, 72, 26, 39, 24, 37, 40, 32, 40, 24, 45, 50, 41, 30, -19, -6, -17, 4, -23, -25, -14, -14, -27, -6, -11, -27, -25, -23, -6, -17, -11, -12, -45, -47, -30, -33, -27, -29, -43, -36, 65, 77, 76, 82, 63, 71, 76, 67, 80, 61, 84, 71, 67, 85, 63, 64, 71, 74, 71, 82, 87, 61, 65, 70, 67, 65, 73, 61, 71, 76, 82, 67, 80, 84, 63, 74, 27, 39, 38, 44, 25, 33, 38, 29, 42, 23, 46, 33, 29, 47, 25, 26, 33, 36, 33, 44, 49, 23, 29, 38, 25, 26, 36, 29, 28, -22, -13, -26, -25, -15, -22, -28, -8, -13, -26, -11, -8, -19, -12, -7, -28, -15, -12, -20, -37, -28, -41, -40, -30, -37, -43, -20, -33, -37, -19, -43, -30, -27, -35, 41, 50, 39, 54, 61, 52, 56, 41, 40, 35, 39, 52, 49, 75, 71, 70, 73, 68, 72, 84, 82, 82, 70, 83, 73, -21, -24, -30, -26, -14, -8, -15, -9, -24, -11, -30, -24, -15, -28, -27, -17, -24, -25, 24, 21, 15, 19, 31, 37, 30, 36, 21, 34, 15, 36, 25, 29, 21, 15, 25, 30, 15, 35, 21, 19, 31, 30, 20, 35, 53, 50, 44, 58, 66, 57, 65, 54, 44, 48, 57, 54, 48, 56, 44, 48, 57, 60, 64, 50, 44, 54, 48, 60, 59, 44, 48, 60, 66, 59, 65, 76, 73, 67, 81, 89, 80, 88, 77, 67, 71, 80, 77, 71, 79, 67, 71, 80, 83, 87, 73, 67, 77, 71, 83, 82, 67, 73, 82, 69, 70, 80, 73, 72, 51, 48, 44, 47, 55, 52, 57, 48, 59, 53, 65, 64, 31, 35, 23, 29, 27, 41, 38, 43, 40, 28, 33, 34, 48, 32, 47, 38, 45, 49, 38, 44, 43, 52, 37, 54, 55, 45, 50, 43, 80, 65, 85, 83, 69, 63, 84, 82, 65, 78, 83, 76, 65, 84, 73, 79, 78, -11, -15, -26, -2, -28, -7, -9, -26, -13, -8, -15, -26, -7, -18, -12, -13, 6, 8, 5, 3, 5, 10, -5, -6, -11, 10, 8, -9, 4, 9, 2, -9, 10, -1, 5, 4, 63, 50, 62, 66, 50, 64, 65, 44, 54, 49, 96, 91, 78, 93, 96, 85, 92, 97, 76, 80, 92, 90, 93, 95, 82, 96, 96, 76, 94, 98, 78, 89, 86, 97, 102, -24, -29, -42, -27, -24, -35, -28, -23, -44, -31, -28, -36, -44, -39, -38, -31, -42, -18, -44, -24, -38, -40, -28, -29, -39, 64, 60, 48, 54, 46, 57, 44, 48, 60, 59, 65, 50, 69, 65, 55, 52, 51, 50, 55, 51, 54, 41, 40, 35, 56, 54, 37, 50, 55, 48, 37, 56, 45, 51, 50, 32, 33, 14, 31, 12, 31, 14, 33, 22, 27, 20, 48, 50, 31, 49, 38, 49, 41, 34, 67, 56, 67, 59, 52, 29, 27, 13, 12, 7, 26, 13, 24, 23, 26, 28, 7, 29, 26, 20, 4, -9, -14, -13, -3, -19, -17, 3, 2, -3, -2, -6, -17, 7, -19, -13, -4, -17, -16, -6, -13, -14, 82, 69, 64, 65, 75, 59, 64, 81, 78, 61, 80, 69, 75, 74, 59, 79, 65, 63, 76, 63, 58, 59, 69, 53, 67, 70, 58, 41, 28, 23, 24, 34, 18, 35, 37, 24, 31, 34, 20, 23, 18, 38, 28, 45, 24, 18, 21, 44, 39, 24, 38, 75, 62, 57, 58, 68, 52, 74, 71, 65, 74, 61, 57, 75, 53, 54, 61, 64, 61, 72, 77, 51, 55, 60, 57, 55, 63, 51, 61, 66, 61, 72, 61, 53, 64, 51, 56, 57, 64, 53, 77, 24, 11, 7, 25, 3, 4, 11, 14, 11, 22, 27, 1, 5, 10, 7, 5, 13, 1, 11, 16, 22, 7, 20, 24, 3, 14};
        String[] strArr = A01;
        if (strArr[1].charAt(29) != strArr[4].charAt(29)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[0] = "aYUm7";
        strArr2[5] = "aSssW";
    }

    static {
        A03();
    }

    public static LK A00(C0958Hi c0958Hi, JSONObject jSONObject, String str) {
        return A01(c0958Hi, jSONObject, str, false, -1, 0);
    }
}
