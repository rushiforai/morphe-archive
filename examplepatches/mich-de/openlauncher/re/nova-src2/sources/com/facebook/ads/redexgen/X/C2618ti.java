package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;

/* renamed from: com.facebook.ads.redexgen.X.ti, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2618ti {
    public static byte[] A01;
    public static String[] A02 = {"CvydOG1rdpeZVjh1I2HxFGGpkCBtP1uR", "LPAb8wO4e9Bm4297vBHQiNlf50jewka4", "p6i6iSivtdsam", "kr1L5mV", "OjxdnAkOIagRjcigNYlctVvlDEXS237l", "CTcf", "XEPmNqkHOtxVdZCukAC2cQoZWEBCmlPv", "qw43eBE0dfm3vpW8jqKcT1ME9HQ7Rm2E"};
    public final Map<String, String> A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 113);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {70, 71, 81, 86, 75, 76, 67, 86, 75, 77, 76, 125, 87, 80, 78, 20, 9, 5, 3, 16, 46, 25, 24, 31, 5, 2, 64, 91, 65, 87, 92};
        String[] strArr = A02;
        if (strArr[6].charAt(15) == strArr[1].charAt(15)) {
            throw new RuntimeException();
        }
        A02[3] = "rnLFNN7HWa";
        A01 = bArr;
    }

    static {
        A01();
    }

    public C2618ti() {
        this.A00 = new HashMap();
    }

    public C2618ti(Map<String, String> extraData) {
        this.A00 = extraData;
    }

    public final C2618ti A02(Context context, AbstractC1701ef abstractC1701ef) {
        Uri linkUrl;
        if ((abstractC1701ef instanceof C07297v) && (linkUrl = ((C07297v) abstractC1701ef).A0O()) != null) {
            A03(context, linkUrl.toString());
        }
        return this;
    }

    public final C2618ti A03(Context context, String str) {
        if (context != null && !TextUtils.isEmpty(str) && C2203mv.A2V(context)) {
            this.A00.put(A00(0, 15, 83), str);
        }
        return this;
    }

    public final C2618ti A04(C2417qT c2417qT) throws JSONException {
        if (c2417qT != null) {
            this.A00.put(A00(26, 5, 69), AbstractC2392q4.A01(c2417qT.A04()));
        }
        return this;
    }

    public final C2618ti A05(C1539c2 c1539c2) {
        if (c1539c2 != null) {
            this.A00.putAll(c1539c2.A0S());
        }
        return this;
    }

    public final C2618ti A06(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.A00.put(A00(15, 11, 0), str);
        }
        return this;
    }

    public final Map<String, String> A07() {
        return this.A00;
    }
}
