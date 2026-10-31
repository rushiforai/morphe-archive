package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.nR, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2235nR {
    public static byte[] A00;
    public static String[] A01 = {"8rCQ87LDNJC1DhxZ6fCr2sl9z", "5Hodpo98FOR", "IALBcgKUANLjYRQ96HtZ7fzkbeR9jBcx", "zTQAh3vDqOojvZYlgAqVeqBvFcLoF4J3", "z7HIEgV6NC3", "WxYOl0mgWg7jzfrY8MiYRxzCEbOVsE5E", "Fx", "GTrmlcJrnfi84XLQulxC5fcTBIr6OicG"};
    public static final String A02;
    public static final Map<String, Integer> A03;
    public static final AtomicInteger A04;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 7);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{57, 43, 89, 112, -126, 43, -127, 108, 119, -128, 112, 69, 43, 96, 111, 87, 124, -122, -125, 116, -121, 118, 123, 124, -127, 122, 51, AbstractJsonLexerKt.TC_INVALID, -126, 118, 116, AbstractJsonLexerKt.TC_INVALID, 51, 118, -126, -120, -127, -121, 120, -123, -122, 77, 51, 122, -97, -108, -93, -106, -98, -106, -97, -91, -102, -97, -104, 81, -108, -96, -90, -97, -91, -106, -93, 107, 81, -56, -21, -33, -35, -24, -65, -21, -15, -22, -16, -31, -18, -17, 116, 119, 119, 124, -121, 124, -126, -127, 116, AbstractJsonLexerKt.TC_INVALID, 114, 124, -127, 121, -126, -43, -24, -24, -39, -31, -28, -24, -111, -113, -93, -107, -106, -94, -115, -109, -90, -111, -109, -98, -94, -105, -99, -100, -46, -34, -36, -99, -43, -48, -46, -44, -47, -34, -34, -38, -99, -48, -45, -30, -99, -69, -66, -78, -80, -69, -50, -78, -66, -60, -67, -61, -76, -63, -62, -103, -106, -87, -106, -42, -25, -42, -33, -27, -28, -49, -46, -58, -60, -49, -62, -58, -46, -40, -47, -41, -56, -43, -42, -121, 120, -112, -125, -122, 120, 123, -95, -94, -113, -111, -103, -94, -96, -113, -111, -109, -124, -122, 115, -123, -118, -127, 118, -37, -35, -54, -36, -31, -40, -51, -57, -53, -41, -52, -51};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A06(C2095lA c2095lA, InterfaceC1529bs interfaceC1529bs, Map<String, ?> map) throws JSONException {
        HashMap map2 = new HashMap();
        map2.put(A01(93, 7, 109), A01(13, 1, 41));
        A0A(c2095lA, map2);
        HashMap map3 = new HashMap();
        map3.put(A01(188, 7, 10), A01(157, 14, 92));
        map3.put(A01(195, 12, 97), String.valueOf(3501));
        map3.put(A01(100, 16, 39), A01(14, 1, 55));
        map3.put(A01(178, 10, 39), A01(65, 13, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        JSONObject jSONObject = new JSONObject();
        for (Map.Entry<String, ?> entry : map.entrySet()) {
            jSONObject.put(entry.getKey(), String.valueOf(entry.getValue()));
        }
        if (c2095lA.A05().AB6()) {
            String str = A01(15, 28, 12) + jSONObject.toString(2);
        }
        map3.put(A01(78, 15, 12), jSONObject.toString());
        A0A(c2095lA, map3);
        C2156mA c2156mAA09 = c2095lA.A09();
        JSONObject jSONObjectA05 = C2128lh.A05(new C2130lj(c2156mAA09.A01(), c2156mAA09.A02(), map3));
        JSONArray jSONArray = new JSONArray();
        jSONArray.put(jSONObjectA05);
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put(A01(147, 4, 46), new JSONObject(map2));
        jSONObject2.put(A01(151, 6, 106), jSONArray);
        C1474az c1474az = new C1474az();
        c1474az.put(A01(171, 7, 16), jSONObject2.toString());
        interfaceC1529bs.AIB(c2095lA.A05().A8h(), c1474az.A08(), new C0939Gp(c2095lA));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A0A(C2095lA c2095lA, Map<String, String> map) {
        map.putAll(c2095lA.A04().A69());
    }

    static {
        A04();
        A02 = C2235nR.class.getSimpleName();
        A04 = new AtomicInteger(0);
        A03 = new HashMap();
    }

    public static /* synthetic */ String A00() {
        String str = A02;
        if (A01[0].length() != 25) {
            throw new RuntimeException();
        }
        A01[5] = "AE0Gj58Mw00GT5T1b1OvPEW6lBfcUrG3";
        return str;
    }

    public static /* synthetic */ Map A02() {
        Map<String, Integer> map = A03;
        if (A01[2].charAt(23) == '7') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[1] = "kE3yWNDHHw7";
        strArr[4] = "pIXzG0En7nL";
        return map;
    }

    public static void A05(C2095lA c2095lA) {
        if (A0C(c2095lA)) {
            return;
        }
        synchronized (C2235nR.class) {
            if (A04.get() != 0) {
                return;
            }
            A04.set(1);
            ExecutorC2431qh.A06.execute(new C0941Gr(c2095lA));
        }
    }

    public static void A08(C2095lA c2095lA, String str) {
        int value;
        int iIntValue;
        if (A0C(c2095lA)) {
            return;
        }
        synchronized (C2235nR.class) {
            if (A04.get() != 2) {
                if (A03.containsKey(str)) {
                    iIntValue = A03.get(str).intValue();
                } else {
                    iIntValue = 0;
                }
                value = iIntValue + 1;
                A03.put(str, Integer.valueOf(value));
            } else {
                SharedPreferences sharedPreferences = c2095lA.getApplicationContext().getSharedPreferences(ProcessUtils.getProcessSpecificName(A01(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 31, 104), c2095lA), 0);
                value = sharedPreferences.getInt(str, 0) + 1;
                sharedPreferences.edit().putInt(str, value).apply();
            }
            if (c2095lA.A05().AB6()) {
                String str2 = A01(43, 22, 42) + str + A01(0, 13, 4) + value;
            }
        }
    }

    public static void A09(C2095lA c2095lA, String str) {
        if (A0C(c2095lA)) {
            return;
        }
        ExecutorC2431qh.A06.execute(new C0940Gq(c2095lA, str));
    }

    public static boolean A0B(double d5, int i5) {
        return i5 <= 0 || d5 >= 1.0d / ((double) i5);
    }

    public static boolean A0C(C2095lA c2095lA) {
        if (c2095lA.A05().AB6()) {
            return false;
        }
        if (!AbstractC2205mx.A0U(c2095lA)) {
            return true;
        }
        return A0B(c2095lA.A09().A00(), AbstractC2205mx.A0C(c2095lA));
    }
}
