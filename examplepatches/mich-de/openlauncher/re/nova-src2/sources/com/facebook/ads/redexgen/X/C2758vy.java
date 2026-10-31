package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.util.Log;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.vy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2758vy {
    public static byte[] A03;
    public static String[] A04 = {"fp2CaqTj", "LAEvMYTNrmfm1C97qtviMkf2yRu1DYDl", "t6JdD3of0IxrOsKa9BA81q59Uli9AsT8", "gJC7p3UN", "wkhfqpsDh9pZ7alJINp4k3fYjwmP5ybd", "PXJ05dfTFyjTm8LhPchB38r6NC9RTsQv", "bBNwT5q5CTYqEWiLjNbWq9cYv9", "kUvPfRU87m3C3sqCb"};
    public final int A00;
    public final String A01;
    public final String A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 93);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{37, 50, 45, 45, 14, 6, 6, 4, 19, 65, 122, 117, 118, 120, 113, 52, 96, 123, 52, 119, 102, 113, 117, 96, 113, 52, 117, 112, 112, 125, 96, 125, 123, 122, 117, 120, 93, 122, 114, 123, 89, 92, 103, 91, 74, 93, 89, 76, 81, 78, 93, 103, 76, 65, 72, 93, 12, 9, 50, 11, 2, 31, 0, 12, 25, 50, 25, 20, 29, 8, 108, 105, 82, AbstractJsonLexerKt.TC_INVALID, 104, 124, 120, 104, 126, 121, 82, 100, 105, 116, 99, 124, 111, 107, 103, 97, 99, 21, 10, 7, 6, 12};
    }

    static {
        A03();
    }

    public C2758vy(String str, String str2, int i5) {
        String strA01;
        this.A02 = str;
        this.A00 = i5;
        if (!TextUtils.isEmpty(str2)) {
            strA01 = A01(91, 5, 62);
        } else {
            strA01 = A01(86, 5, 91);
        }
        this.A01 = strA01;
    }

    private C2127lg A00(String str) {
        C2127lg c2127lg = new C2127lg(str);
        c2127lg.A07(A02());
        c2127lg.A05(1);
        return c2127lg;
    }

    private JSONObject A02() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(A01(56, 14, 48), this.A00);
            jSONObject.put(A01(70, 13, 80), this.A02);
            jSONObject.put(A01(40, 16, 101), this.A01);
        } catch (JSONException e3) {
            Log.w(A01(0, 9, 60), A01(9, 31, 73), e3);
        }
        return jSONObject;
    }

    public final void A04(int i5, String str) {
        C0957Hh sdkContext = AbstractC2094l9.A00();
        if (sdkContext != null) {
            InterfaceC2125le interfaceC2125leA08 = sdkContext.A08();
            String[] strArr = A04;
            if (strArr[2].charAt(28) == strArr[4].charAt(28)) {
                throw new RuntimeException();
            }
            A04[1] = "oo4WYpYrHyZLXSXdo0EivsHVHotPm1t3";
            interfaceC2125leA08.ABz(A01(83, 3, 77), i5, A00(str));
        }
    }
}
