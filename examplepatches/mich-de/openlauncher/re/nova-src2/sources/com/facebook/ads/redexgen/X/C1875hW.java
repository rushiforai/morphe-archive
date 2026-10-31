package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.webkit.JavascriptInterface;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.hW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1875hW {
    public static byte[] A09;
    public static String[] A0A = {"wShQC8dEdCdDsonD9ckCi5w9U", "b5c2oWnzHv5UWiyt71KIAMilmtcSqC1N", "4oZvc6d7ZwR5AqDgCDxuZ3", "CpRmP5RSNkzg3ZlMUDzKwsVogZKCCIfv", "sNKw3geGf4TvnRH7EsTwjKTQ1PVdzKbr", "vkOXVJfFXuiRjckYDq31YMz3bRLaI4ty", "WCP05eFM3owSSVORqqhL5dWCzqIHotme", "3PgjMBtjqMKuKf4b6dM3cFumw"};
    public String A00;
    public String A01;
    public final C2095lA A02;
    public final InterfaceC2224nG A03;
    public final C2232nO A04;
    public final C1876hX A05;
    public final String A06;
    public final Map<String, String> A07;
    public final boolean A08;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 9);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A09 = new byte[]{-110, -91, -92, -92, -97, -98, -113, -109, -100, -103, -109, -101, -128, -109, -110, -110, -115, -116, 125, -116, AbstractJsonLexerKt.TC_INVALID, -117, -125, -112, -103, -113, -118, -114, -116, -99, -113, -118, -98, -109, -102, -94, -118, -96, -101, -59, -42, -59, -50, -44, -65, -59, -40, -44, -46, -63, 123, -116, 123, -124, -118, 117, -118, -113, -122, 123, -46, -52, -40, -48, -54, -41, -38, -52, -49, -110, -117, -100, -117, -110, -123, -119, -107, -109, -106, -110, -117, -102, -117, -122, AbstractJsonLexerKt.TC_INVALID, -112, AbstractJsonLexerKt.TC_INVALID, -122, 121, -120, 123, -121, AbstractJsonLexerKt.TC_INVALID, -40, -63};
    }

    static {
        A04();
    }

    public C1875hW(C2095lA c2095lA, C1876hX c1876hX, InterfaceC2224nG interfaceC2224nG, Map<String, String> metricsData, String str) {
        this.A02 = c2095lA;
        this.A05 = c1876hX;
        this.A03 = interfaceC2224nG;
        this.A07 = metricsData;
        this.A06 = str;
        this.A04 = new C2232nO(this.A06, this.A03);
        this.A08 = C2203mv.A2G(c1876hX.getContext());
    }

    private void A01() {
        HashMap map = new HashMap();
        map.put(A00(50, 10, 13), A00(60, 9, 98));
        A07(map);
    }

    private void A02() {
        this.A04.A04(EnumC2231nN.A0e, null);
    }

    private void A03() {
        HashMap map = new HashMap();
        map.put(A00(50, 10, 13), A00(23, 16, 34));
        A07(map);
    }

    private void A05(String str) {
        HashMap map = new HashMap();
        map.put(A00(83, 10, 17), String.valueOf(str));
        HashMap map2 = new HashMap();
        map2.put(A00(50, 10, 13), A00(69, 14, 29));
        map2.put(A00(39, 11, 87), AbstractC2392q4.A01(map));
        A07(map2);
    }

    private void A06(String str, float f11, float f12) {
        HashMap map = new HashMap();
        map.put(A00(12, 11, 21), str);
        map.put(A00(93, 1, 87), String.valueOf(f11));
        map.put(A00(94, 1, 63), String.valueOf(f12));
        HashMap map2 = new HashMap();
        map2.put(A00(50, 10, 13), A00(0, 12, 39));
        map2.put(A00(39, 11, 87), AbstractC2392q4.A01(map));
        A07(map2);
    }

    private void A07(Map<String, String> data) {
        if (TextUtils.isEmpty(this.A06)) {
            return;
        }
        data.putAll(this.A07);
        data.putAll(AbstractC1874hV.A01(this.A02, this.A00, this.A01));
        this.A03.ACg(this.A06, data);
        if (A0A[2].length() != 22) {
            throw new RuntimeException();
        }
        String[] strArr = A0A;
        strArr[0] = "HxovkwELrWr5bBRZF5CQfpfOo";
        strArr[7] = "TU6dTWUJiKZlmHYRZZZtjyCrH";
    }

    @JavascriptInterface
    public void initializeLogging(String str, String str2) {
        if (!this.A08) {
            return;
        }
        this.A00 = str;
        this.A01 = str2;
    }

    @JavascriptInterface
    public void logButtonClick(String str, float f11, float f12) {
        if (!this.A08) {
            return;
        }
        A06(str, f11, f12);
    }

    @JavascriptInterface
    public void logEndCardShowUp() {
        if (!this.A08) {
            return;
        }
        A03();
    }

    @JavascriptInterface
    public void logGameLoad() {
        if (!this.A08) {
            return;
        }
        A01();
    }

    @JavascriptInterface
    public void logLevelComplete(String str) {
        if (!this.A08) {
            return;
        }
        A05(str);
    }

    @JavascriptInterface
    public void onCTAClick() {
        A02();
        this.A05.A0B();
    }
}
