package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.oL, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2289oL {
    public static byte[] A00;
    public static final C2289oL A01;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{116, 113, 74, 103, 112, 101, 122, 103, 97, 124, 123, 114, 74, 118, 122, 123, 115, 124, 114, 49, 52, 49, 32, 36, 53, 34, 47, 42, 61, 23, 24, 41, 0, 23, 26, 31, 18, 23, 2, 31, 25, 24, 41, 3, 3, 31, 18, 96, 98, 96, 107, 102, 23, 28, 21, 29, 26, 43, 4, 21, 6, 21, 25, 7, 96, 108, 103, 102, 65, 68, 81, 68, 44, 41, 60, 41, 7, 42, 34, 45, 43, 60, 104, 33, 59, 104, 38, 61, 36, 36, 68, 65, 84, 65, AbstractJsonLexerKt.TC_INVALID, 77, 79, 68, 69, 76, AbstractJsonLexerKt.TC_INVALID, 84, 89, 80, 69, 85, 84, 83, 68, 86, 110, 87, 68, 95, 95, 84, 93, 110, 82, 94, 95, 87, 88, 86, 75, 74, 73, 70, 65, 70, 91, 70, 64, 65, 0, 23, 23, 10, 23, 4, 7, 3, 22, 23, 16, 7, 61, 1, 13, 12, 4, 11, 5, 85, 86, 94, 102, 90, 76, 75, 75, 92, 87, 77, 102, 95, 76, 87, 87, 92, 85, 64, 72, 94, 94, 76, 74, 72, 65, 93, 80, 82, 84, 92, 84, 95, 69, 66, 42, 61, 50, 6, 58, 56, 58, 49, 60, 67, 69, 86, 84, 92, 82, 69, 68, 71, 74, 67, 86};
    }

    static {
        A05();
        A01 = new C2289oL();
    }

    public static synchronized C2289oL A00() {
        return A01;
    }

    private GG A01(C0958Hi c0958Hi, JSONObject data, long j11) throws JSONException {
        JSONArray placements = data.getJSONArray(A04(178, 10, 70));
        JSONObject jSONObject = placements.getJSONObject(0);
        C2146lz c2146lzA00 = C2146lz.A00(jSONObject.getJSONObject(A04(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 10, 88)));
        String adReportingConfig = jSONObject.optString(A04(139, 14, 21));
        String strA04 = A04(47, 5, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
        String str = null;
        String sdkManagedCache = jSONObject.has(strA04) ? jSONObject.optString(strA04) : null;
        String strA042 = A04(188, 9, 46);
        C2145ly c2145ly = new C2145ly(c2146lzA00, adReportingConfig, jSONObject.optString(A04(0, 19, 98)), sdkManagedCache, jSONObject.has(strA042) ? jSONObject.optString(strA042) : null, A06(jSONObject));
        String strA043 = A04(26, 3, 57);
        if (jSONObject.has(strA043)) {
            JSONArray jSONArray = jSONObject.getJSONArray(strA043);
            int i5 = 0;
            while (i5 < jSONArray.length()) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i5);
                AbstractC2234nQ.A06(c0958Hi, jSONObject2, j11, str);
                String strOptString = jSONObject2.optString(A04(19, 7, 39));
                String strOptString2 = jSONObject2.optString(A04(90, 15, 87));
                JSONObject jSONObjectOptJSONObject = jSONObject2.optJSONObject(A04(68, 4, 82));
                JSONArray jSONArrayOptJSONArray = jSONObject2.optJSONArray(A04(197, 8, 64));
                if (jSONObjectOptJSONObject != null) {
                    c2145ly.A0E(new C2143lw(strOptString, strOptString2, jSONObjectOptJSONObject, jSONArrayOptJSONArray));
                } else {
                    c0958Hi.A0F().A6F(AdErrorType.UNKNOWN_ERROR.getErrorCode(), A04(72, 18, 63));
                }
                i5++;
                str = null;
            }
        }
        String strA044 = A04(52, 12, 3);
        if (jSONObject.has(strA044)) {
            c2145ly.A0F(jSONObject.getJSONObject(strA044));
        }
        String anValidationUuid = data.optString(A04(29, 18, 1));
        return new GG(c2145ly, anValidationUuid);
    }

    private GF A02(JSONObject jSONObject) {
        return new GF(jSONObject.optString(A04(171, 7, 90), A04(0, 0, 87)), jSONObject.optInt(A04(64, 4, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), 0), null);
    }

    private GF A03(JSONObject jSONObject) throws JSONException {
        String strA04 = A04(188, 9, 46);
        String strA042 = A04(47, 5, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
        try {
            JSONObject jSONObject2 = jSONObject.getJSONArray(A04(178, 10, 70)).getJSONObject(0);
            C2146lz placementDefinition = C2146lz.A00(jSONObject2.getJSONObject(A04(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 10, 88)));
            String featureConfig = jSONObject2.optString(A04(139, 14, 21));
            String cache = jSONObject2.has(strA042) ? jSONObject2.optString(strA042) : null;
            String sdkManagedCache = jSONObject2.has(strA04) ? jSONObject2.optString(strA04) : null;
            String adReportingConfig = jSONObject2.optString(A04(0, 19, 98));
            return new GF(jSONObject.optString(A04(171, 7, 90), A04(0, 0, 87)), jSONObject.optInt(A04(64, 4, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), 0), new C2145ly(placementDefinition, featureConfig, adReportingConfig, cache, sdkManagedCache, A06(jSONObject2)));
        } catch (JSONException unused) {
            return A02(jSONObject);
        }
    }

    public static boolean A06(JSONObject jSONObject) throws JSONException {
        String strA04 = A04(105, 19, 70);
        if (jSONObject.has(strA04)) {
            return jSONObject.getJSONObject(strA04).optBoolean(A04(153, 18, 78), false);
        }
        return false;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0028  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final C2291oN A07(C0958Hi c0958Hi, String str, long j11) throws JSONException {
        char c11;
        if (!TextUtils.isEmpty(str)) {
            JSONObject jSONObject = new JSONObject(str);
            String strOptString = jSONObject.optString(A04(Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, 4, 68));
            int iHashCode = strOptString.hashCode();
            String strA04 = A04(Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 5, 18);
            switch (iHashCode) {
                case 96432:
                    if (!strOptString.equals(A04(26, 3, 57))) {
                        c11 = 65535;
                        break;
                    } else {
                        c11 = 0;
                        break;
                    }
                case 96784904:
                    if (strOptString.equals(strA04)) {
                        c11 = 1;
                        break;
                    }
                    break;
            }
            switch (c11) {
                case 0:
                    return A01(c0958Hi, jSONObject, j11);
                case 1:
                    return A03(jSONObject);
                default:
                    JSONObject jsonResponse = jSONObject.optJSONObject(strA04);
                    if (jsonResponse != null) {
                        return A02(jsonResponse);
                    }
                    break;
            }
        }
        return new C2291oN(EnumC2290oM.A05);
    }
}
