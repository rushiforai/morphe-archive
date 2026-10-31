package com.facebook.ads.redexgen.X;

import com.facebook.ads.ExtraHints;
import com.facebook.ads.InterstitialAd;
import com.facebook.ads.RewardedVideoAd;
import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.pQ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2352pQ {
    public static byte[] A00;

    static {
        A04();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 39);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{121, 123, 110, 111, -120, 119, 126, 118, -120, 106, 109, 124, -120, 119, 120, -120, 108, 113, 106, 114, 119, -71, -73, -55, -71, -73, -70, -69, -70, -75, -73, -70, -25, -6, -10, -12, -29, -31, -26, -29, -10, -29, -82, -81, -76, -70, -71, -58, -57, -58, -69, -64, -71, -63, -58, -67, -68, -73, -71, -68, -53, -8, -6};
    }

    public static int A00(C0958Hi c0958Hi, int i5) {
        return AbstractC2297oU.A00(c0958Hi).getInt(A01(0, 21, 2), i5);
    }

    public static String A02(C0958Hi c0958Hi, String str) {
        int iA00 = A00(c0958Hi, -1);
        if (iA00 == -1) {
            return null;
        }
        try {
            return new ExtraHints.Builder().extraData(A03(str, A01(47, 14, 49), Integer.valueOf(iA00))).build().getHints();
        } catch (JSONException unused) {
            return null;
        }
    }

    public static String A03(String str, String str2, Object obj) throws JSONException {
        String strA01 = A01(61, 2, 86);
        if (str != null) {
            JSONObject jSONObject = new JSONObject(str);
            String extraData = A01(42, 5, 31);
            JSONObject jSONObject2 = jSONObject.getJSONObject(extraData);
            String extraData2 = A01(32, 10, 91);
            strA01 = jSONObject2.optString(extraData2, strA01);
        }
        JSONObject jSONObject3 = new JSONObject(strA01);
        jSONObject3.put(str2, obj);
        String extraData3 = jSONObject3.toString();
        return extraData3;
    }

    public static boolean A05(String str) throws JSONException {
        return str != null && new JSONObject(new JSONObject(str).getJSONObject(A01(42, 5, 31)).optString(A01(32, 10, 91), A01(61, 2, 86))).optBoolean(A01(21, 11, 47), false);
    }

    public final InterstitialAd A06(C0958Hi c0958Hi, String str, String str2) {
        if (c0958Hi == null) {
            return null;
        }
        try {
            InterstitialAd interstitialAd = new InterstitialAd(c0958Hi, str);
            interstitialAd.setExtraHints(new ExtraHints.Builder().extraData(A03(str2, A01(21, 11, 47), true)).build());
            return interstitialAd;
        } catch (JSONException unused) {
            return null;
        }
    }

    public final RewardedVideoAd A07(C0958Hi c0958Hi, String str, String str2) {
        if (c0958Hi == null) {
            return null;
        }
        try {
            RewardedVideoAd rewardedVideoAd = new RewardedVideoAd(c0958Hi, str);
            rewardedVideoAd.setExtraHints(new ExtraHints.Builder().extraData(A03(str2, A01(21, 11, 47), true)).build());
            return rewardedVideoAd;
        } catch (JSONException unused) {
            return null;
        }
    }

    public final void A08(C0958Hi c0958Hi, boolean z11) {
        int i5 = 0;
        String strA01 = A01(0, 21, 2);
        if (!z11) {
            int lastNonChainedAds = AbstractC2297oU.A00(c0958Hi).getInt(strA01, 0);
            i5 = lastNonChainedAds + 1;
        }
        AbstractC2297oU.A00(c0958Hi).edit().putInt(strA01, i5).apply();
    }

    public final boolean A09(C0958Hi c0958Hi, String str, int i5) {
        if (i5 <= 0) {
            return false;
        }
        try {
            if (!A05(str)) {
                int lastNonChainedAds = A00(c0958Hi, i5 - 1);
                return lastNonChainedAds >= i5 + (-1);
            }
        } catch (JSONException unused) {
        }
        return false;
    }
}
