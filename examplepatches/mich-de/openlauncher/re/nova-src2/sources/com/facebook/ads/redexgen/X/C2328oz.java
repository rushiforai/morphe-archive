package com.facebook.ads.redexgen.X;

import android.util.Pair;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.oz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2328oz {
    public static C2328oz A03;
    public static byte[] A04;
    public static String[] A05 = {"NTbRRXzyO1pHj9h9SB1l6scZPb0Q7Nog", "bmOnvW2Dftn9PXphT1BSb1gLyD784HEs", "xXlun2aBYv5AwTNxDDBZ1ozaVoLHmKwC", "fgEap69kh5IQNkCVg2HH2z0FKRiyYkaW", "bjKXkeYdnqU1b06FMW9zlYBuvr", "tlX5oNQdXvFNtUI3yzsY3k1Z5P3Khlzk", "fsVn4bpRmJatZLWZJrcTevSj2nASpmzL", "gGN3n"};
    public final C2095lA A00;
    public final Map<String, Set<String>> A02 = new HashMap();
    public final C2327oy A01 = new C2327oy();

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 51);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A04 = new byte[]{0, 5, 27, 30, 37, 18, 31, 19, 29, 18, 14, 35, 38, 49, 92, 75, 0, 5, 16, 5, 38, 39, 36, 43, 44, 43, 54, 43, 45, 44, 80, 88, 73, 92, 89, 92, 73, 92, 33, 61, 48, 50, 52, 60, 52, 63, 37, 34, 40, 47, 52, 41, 62, 63, 25, 58, 53, 53, 62, 41, 24, 52, 46, 53, 47, 97, 102, 125, 96, 119, 118, 91, 124, 102, 119, 96, 97, 102, 123, 102, 123, 115, 126, 81, 125, 103, 124, 102, 31, 24, 3, 30, 9, 8, 33, 9, 8, 5, 25, 1, 62, 9, 15, 24, 13, 2, 11, 0, 9, 47, 3, 25, 2, 24, 22, 17, 10, 23, 0, 1, 43, 4, 17, 12, 19, 0, 39, 4, 11, 11, 0, 23, 38, 10, 16, 11, 17, 9, 14, 21, 8, 31, 30, 52, 27, 14, 19, 12, 31, 57, 21, 15, 20, 14, 87, 80, 75, 86, 65, 64, 118, 114, 103, 75, 81, 74, 80, 33, 60, 56, 48, 10, 38, 33, 52, 56, 37, 118, 123, 114, 103, 45, 43};
    }

    static {
        A04();
    }

    public C2328oz(C2095lA c2095lA) {
        this.A00 = c2095lA;
    }

    public static C2328oz A00(C2095lA c2095lA) {
        if (A03 == null) {
            A03 = new C2328oz(c2095lA);
        }
        return A03;
    }

    private final String A02(String str) {
        return this.A01.A04(this.A00, str, A01(181, 2, 101));
    }

    private String A03(JSONObject jSONObject) {
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(A01(30, 8, 14));
        if (jSONObjectOptJSONObject == null) {
            return AdPlacementType.BANNER.toString();
        }
        if (jSONObjectOptJSONObject.optString(A01(2, 9, 73)).equals(A01(0, 2, 6))) {
            return AdPlacementType.BANNER.toString();
        }
        return AdPlacementType.MEDIUM_RECTANGLE.toString();
    }

    private void A05(String str) {
        A06(str, 0);
        this.A01.A06(this.A00, str, A01(181, 2, 101));
    }

    private void A06(String str, int i5) {
        if (str.equals(AdPlacementType.REWARDED_VIDEO.toString())) {
            this.A01.A05(this.A00, A01(154, 13, 23), i5);
            return;
        }
        String string = AdPlacementType.INTERSTITIAL.toString();
        if (A05[3].charAt(23) != 'F') {
            throw new RuntimeException();
        }
        A05[3] = "RDLtdD6SrjB0fykZQgyL0TKFAa418ZWI";
        if (str.equals(string)) {
            this.A01.A05(this.A00, A01(65, 23, 33), i5);
            return;
        }
        if (str.equals(AdPlacementType.BANNER.toString())) {
            this.A01.A05(this.A00, A01(48, 17, 104), i5);
            return;
        }
        if (str.equals(AdPlacementType.MEDIUM_RECTANGLE.toString())) {
            this.A01.A05(this.A00, A01(88, 26, 95), i5);
        } else if (str.equals(AdPlacementType.NATIVE.toString())) {
            this.A01.A05(this.A00, A01(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 17, 73), i5);
        } else {
            if (!str.equals(AdPlacementType.NATIVE_BANNER.toString())) {
                return;
            }
            this.A01.A05(this.A00, A01(114, 23, 86), i5);
        }
    }

    private final void A07(String str, String str2) {
        if (this.A02.get(str) == null) {
            this.A02.put(str, new HashSet());
        }
        Set<String> set = this.A02.get(str);
        String[] strArr = A05;
        if (strArr[1].charAt(18) != strArr[2].charAt(18)) {
            throw new RuntimeException();
        }
        A05[0] = "bAvocrMCUlgMfTD7gFcUWEV0GbSc72em";
        set.add(str2);
    }

    private boolean A08(String str, String str2) {
        int iA0H = C2203mv.A0H(this.A00);
        if (str.equals(AdPlacementType.INTERSTITIAL.toString()) || str.equals(AdPlacementType.REWARDED_VIDEO.toString())) {
            iA0H *= 2;
        }
        if (this.A02.get(str) != null) {
            int maxLoadedAdsAllowed = A09(str);
            if (maxLoadedAdsAllowed <= iA0H && this.A02.get(str).contains(str2)) {
                return true;
            }
        }
        return false;
    }

    public final int A09(String str) {
        if (this.A02.get(str) == null) {
            return 0;
        }
        return this.A02.get(str).size();
    }

    public final int A0A(String str) {
        if (str.equals(AdPlacementType.REWARDED_VIDEO.toString())) {
            return this.A01.A03(this.A00, A01(154, 13, 23), 0);
        }
        if (str.equals(AdPlacementType.INTERSTITIAL.toString())) {
            return this.A01.A03(this.A00, A01(65, 23, 33), 0);
        }
        if (str.equals(AdPlacementType.BANNER.toString())) {
            return this.A01.A03(this.A00, A01(48, 17, 104), 0);
        }
        if (str.equals(AdPlacementType.MEDIUM_RECTANGLE.toString())) {
            return this.A01.A03(this.A00, A01(88, 26, 95), 0);
        }
        if (str.equals(AdPlacementType.NATIVE.toString())) {
            return this.A01.A03(this.A00, A01(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 17, 73), 0);
        }
        if (!str.equals(AdPlacementType.NATIVE_BANNER.toString())) {
            return 0;
        }
        return this.A01.A03(this.A00, A01(114, 23, 86), 0);
    }

    public final Pair<String, String> A0B(String str) {
        String strA01 = A01(167, 10, 102);
        String strA02 = A02(str);
        if (strA02 == null) {
            return null;
        }
        try {
            JSONObject storedAdResponse = new JSONObject(strA02);
            Iterator<String> itKeys = storedAdResponse.keys();
            while (itKeys.hasNext()) {
                try {
                    String clientToken = itKeys.next();
                    if (!A08(str, clientToken)) {
                        JSONObject jSONObject = new JSONObject((String) storedAdResponse.get(clientToken));
                        if (!jSONObject.has(strA01)) {
                            continue;
                        } else {
                            if (System.currentTimeMillis() - jSONObject.getLong(strA01) < C2203mv.A00(this.A00)) {
                                String storedResponsesString = (String) storedAdResponse.get(clientToken);
                                Pair<String, String> pair = new Pair<>(clientToken, storedResponsesString);
                                A07(str, clientToken);
                                return pair;
                            }
                            A0E(str, clientToken);
                        }
                    }
                } catch (JSONException unused) {
                    A05(str);
                    return null;
                }
            }
            return null;
        } catch (JSONException unused2) {
            A05(str);
            return null;
        }
    }

    public final void A0C(String str) throws JSONException {
        try {
            JSONObject adData = new JSONObject(str);
            JSONArray jSONArray = adData.getJSONArray(A01(38, 10, 98));
            JSONArray placementJSON = jSONArray.getJSONObject(0).getJSONArray(A01(11, 3, 113));
            if (placementJSON.length() == 0) {
                return;
            }
            JSONObject jSONObject = placementJSON.getJSONObject(0).getJSONObject(A01(16, 4, 87));
            String string = jSONObject.getString(A01(14, 2, 12));
            String clientToken = jSONArray.getJSONObject(0).getJSONObject(A01(20, 10, 113)).getString(A01(177, 4, 49));
            if (A00(this.A00).A0F(clientToken)) {
                return;
            }
            if (clientToken.equals(AdPlacementType.BANNER.toString())) {
                clientToken = A03(jSONObject);
            }
            String strA02 = A02(clientToken);
            if (strA02 == null) {
                return;
            }
            JSONObject jSONObject2 = new JSONObject(strA02);
            adData.put(A01(167, 10, 102), System.currentTimeMillis());
            jSONObject2.put(string, adData.toString());
            this.A01.A06(this.A00, clientToken, jSONObject2.toString());
            A06(clientToken, A0A(clientToken) + 1);
            A07(clientToken, string);
        } catch (JSONException unused) {
        }
    }

    public final void A0D(String str, String str2) {
        if (str == null || str2 == null || this.A02.get(str) == null) {
            return;
        }
        this.A02.get(str).remove(str2);
    }

    public final void A0E(String str, String str2) {
        if (C2203mv.A00(this.A00) <= 0) {
            return;
        }
        int newStoredCount = A0A(str) - 1;
        if (newStoredCount < 0) {
            newStoredCount = 0;
        }
        A06(str, newStoredCount);
        String storedResponses = A02(str);
        if (storedResponses == null) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(storedResponses);
            jSONObject.remove(str2);
            this.A01.A06(this.A00, str, jSONObject.toString());
            A0D(str, str2);
        } catch (JSONException unused) {
        }
    }

    public final boolean A0F(String str) {
        return !C2203mv.A19(this.A00) && (str.equals(AdPlacementType.BANNER.toString()) || str.equals(AdPlacementType.MEDIUM_RECTANGLE.toString()));
    }
}
