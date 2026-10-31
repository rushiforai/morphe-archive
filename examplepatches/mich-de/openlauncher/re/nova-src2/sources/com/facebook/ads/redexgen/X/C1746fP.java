package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.Arrays;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.fP, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1746fP implements Serializable {
    public static byte[] A05 = null;
    public static final long serialVersionUID = -4041915335826065133L;
    public final String A00;
    public final String A01;
    public final String A02;
    public final String A03;
    public final String A04;

    static {
        A03();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 66);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A05 = new byte[]{91, 64, 89, 89, 82, 85, 75};
    }

    public C1746fP(String str, String str2, JSONObject jSONObject, String str3, String str4) {
        this.A04 = A01(str);
        this.A03 = A01(str2);
        this.A00 = A01(str3);
        this.A01 = A02(jSONObject);
        this.A02 = A01(str4);
    }

    public static String A01(String str) {
        if (A00(0, 4, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE).equalsIgnoreCase(str)) {
            return A00(0, 0, 68);
        }
        return str;
    }

    private String A02(JSONObject jSONObject) {
        String strOptString;
        String strA00 = A00(0, 0, 68);
        return (jSONObject == null || (strOptString = jSONObject.optString(A00(4, 3, 101), strA00)) == null) ? strA00 : strOptString;
    }

    public final String A04() {
        return this.A02;
    }

    public final String A05() {
        return this.A03;
    }

    public final String A06() {
        return this.A04;
    }

    public final boolean A07() {
        return !TextUtils.isEmpty(this.A01);
    }
}
