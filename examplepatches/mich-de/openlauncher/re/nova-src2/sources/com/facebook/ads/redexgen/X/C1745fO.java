package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.Arrays;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.fO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1745fO implements Serializable {
    public static byte[] A03 = null;
    public static final long serialVersionUID = 6010729991575063286L;
    public final int A00;
    public final int A01;
    public final String A02;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 88);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A03 = new byte[]{-15, -18, -14, -16, -15, -3, 69, 66, 60, -43, -57, -62, -46, -58};
    }

    public C1745fO(String str, int i5, int i11) {
        this.A02 = str;
        this.A01 = i5;
        this.A00 = i11;
    }

    public static C1745fO A00(JSONObject jSONObject) {
        String strOptString;
        if (jSONObject == null || (strOptString = jSONObject.optString(A01(6, 3, 120))) == null) {
            return null;
        }
        return new C1745fO(strOptString, jSONObject.optInt(A01(9, 5, 6), 0), jSONObject.optInt(A01(0, 6, 49), 0));
    }

    public final int A03() {
        return this.A00;
    }

    public final int A04() {
        return this.A01;
    }

    public final String A05() {
        return this.A02;
    }
}
