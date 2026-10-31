package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.fM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1743fM {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{43, 41, 58, 55, 61, 59, 45, 52, -39, -54, -37, -36, -46, -41, -48, 46, 33, 28, 29, 39, 23, 45, 42, 36};
    }

    public static List<C1735fE> A01(JSONArray jSONArray, JSONObject jSONObject, C0958Hi c0958Hi, InterfaceC1748fR interfaceC1748fR) throws JSONException {
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i5);
                if (i5 == 0) {
                    A03(jSONObject2, jSONObject);
                }
                C1735fE c1735fEA00 = C1735fE.A00(jSONObject2);
                interfaceC1748fR.A4O(c1735fEA00, jSONObject2);
                arrayList.add(c1735fEA00);
            } catch (JSONException e3) {
                c0958Hi.A08().ABz(A00(8, 7, 31), AbstractC2126lf.A2B, new C2127lg(e3));
            }
        }
        return arrayList;
    }

    public static void A03(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        Iterator<String> itKeys = jSONObject2.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!next.equals(A00(15, 9, 110)) && !next.equals(A00(0, 8, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE)) && !jSONObject.has(next)) {
                jSONObject.put(next, jSONObject2.opt(next));
            }
        }
    }
}
