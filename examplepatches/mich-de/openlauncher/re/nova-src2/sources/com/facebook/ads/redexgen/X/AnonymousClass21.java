package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.21, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AnonymousClass21 {
    public static byte[] A00;
    public static String[] A01 = {"xPMOoUfbkmQ5kvnU3jbgLL47OcFEjU7z", "1dodMLotzUEJucQn2MWgY64F", "Ei0kY7ZOP", "czo3jP2JN", b.f42142b, "hHdeWCinA2EaAz86iaUgwk6OrkZVXmHI", "CkfkaUvdCRi5J5AIUl6JSr62iIVQ3RiE", "AT3hLPm3hPYjZ73rxoY4ER"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static AnonymousClass26 A00(C0958Hi c0958Hi, JSONObject jSONObject, C2086kz c2086kz, C2232nO c2232nO, C2758vy c2758vy, boolean z11) throws JSONException {
        boolean z12;
        String strA0S;
        boolean z13 = z11;
        String strA01 = A01(101, 3, 106);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        String strOptString = jSONObject.optString(A01(51, 26, 80));
        arrayList3.add(strOptString);
        if (z13) {
            strA0S = c2086kz.A0S(strOptString);
            if (strOptString.equals(strA0S)) {
                z13 = false;
                z12 = false;
            } else {
                z12 = z13;
            }
        } else {
            z12 = z13;
            strA0S = strOptString;
        }
        c2232nO.A04(EnumC2231nN.A0P, null);
        try {
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(A01(92, 4, 1));
            if (jSONObjectOptJSONObject != null && jSONObjectOptJSONObject.optString(strA01) != null) {
                arrayList.add(jSONObjectOptJSONObject.optString(strA01));
                if (z12) {
                    jSONObjectOptJSONObject.put(strA01, c2086kz.A0R(jSONObjectOptJSONObject.optString(strA01)));
                }
            }
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(A01(77, 15, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
            if (jSONArrayOptJSONArray != null) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    String strOptString2 = jSONArrayOptJSONArray.optString(i5);
                    arrayList.add(strOptString2);
                    if (z12) {
                        jSONArrayOptJSONArray.put(i5, c2086kz.A0R(strOptString2));
                    }
                }
            }
            JSONArray jSONArrayOptJSONArray2 = jSONObject.optJSONArray(A01(43, 8, 26));
            if (jSONArrayOptJSONArray2 != null) {
                for (int i11 = 0; i11 < jSONArrayOptJSONArray2.length(); i11++) {
                    A03(arrayList, arrayList2, jSONArrayOptJSONArray2.optJSONObject(i11), c2086kz, z12);
                }
            } else {
                A03(arrayList, arrayList2, jSONObject, c2086kz, z12);
            }
        } catch (JSONException unused) {
            c2758vy.A04(AbstractC2126lf.A15, A01(0, 43, 79));
        }
        return new AnonymousClass26(jSONObject, strA0S, arrayList, arrayList2, arrayList3, z13);
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 79);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{69, 114, 114, 111, 114, 32, 116, 114, 97, 110, 115, 102, 111, 114, 109, 105, 110, 103, 32, 74, 83, 79, 78, 32, 105, 110, 32, 117, 112, 100, 97, 116, 101, 67, 97, 99, 104, 101, 100, 85, 114, 108, 115, 54, 52, 39, 58, 32, 38, 48, 57, 123, 102, 113, 126, 114, 118, 124, 64, 108, 123, 116, 64, 115, 126, 102, 122, 109, 64, 119, 107, 114, 115, 64, 106, 109, 115, 84, 95, 85, 110, 82, 80, 67, 85, 110, 88, 92, 80, 86, 84, 66, 39, 45, 33, 32, 2, 6, 10, 12, 14, 80, 87, 73, 107, 116, 121, 120, 114, 66, 104, 111, 113};
    }

    static {
        A02();
    }

    public static void A03(ArrayList<String> videoUrls, ArrayList<String> arrayList, JSONObject jSONObject, C2086kz c2086kz, boolean z11) throws JSONException {
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(A01(96, 5, 36));
        if (jSONObjectOptJSONObject != null) {
            String strA01 = A01(101, 3, 106);
            if (A01[1].length() == 1) {
                throw new RuntimeException();
            }
            A01[7] = "G1neCcMuoIIVUH8A2yIEObncf";
            if (jSONObjectOptJSONObject.optString(strA01) != null) {
                String strOptString = jSONObjectOptJSONObject.optString(strA01);
                videoUrls.add(strOptString);
                if (z11) {
                    jSONObjectOptJSONObject.put(strA01, c2086kz.A0R(strOptString));
                }
            }
        }
        String strA012 = A01(104, 9, 82);
        if (!TextUtils.isEmpty(jSONObject.optString(strA012))) {
            String strOptString2 = jSONObject.optString(strA012);
            arrayList.add(strOptString2);
            if (z11) {
                jSONObject.put(strA012, c2086kz.A0S(strOptString2));
            }
        }
    }
}
