package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.io.Serializable;
import java.util.Arrays;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.fT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1750fT implements Serializable {
    public static byte[] A05 = null;
    public static String[] A06 = {"d", "N8LJkoTRbuRbC1tJ", "jfJOiGRwPDVL1NrTNwB42KXE8H2UBngU", "vBF5X8psVmC8vN2i9Fb6pwYPcFw8P16Y", "MnzIPqWVO6BB6yg7oNwcPff6zueAQoos", "vMZUyoTb2kOawbdq3lii4zyBkGUB4gvd", "5yRYj6PaRtwfaNlpyi5ySSeMn9NdrDw4", "Ti3I"};
    public static final long serialVersionUID = 238472947123L;
    public int A00;
    public String A01;
    public String A02;
    public String A03;
    public boolean A04;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 10
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C1750fT A00(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        String strOptString = jSONObject.optString(A04(0, 6, 35));
        String strOptString2 = jSONObject.optString(A04(36, 8, 108));
        String strOptString3 = jSONObject.optString(A04(24, 12, 29));
        int iOptInt = jSONObject.optInt(A04(44, 14, 36), -1);
        boolean zOptBoolean = jSONObject.optBoolean(A04(6, 18, 62), false);
        if (TextUtils.isEmpty(strOptString) || TextUtils.isEmpty(strOptString2) || TextUtils.isEmpty(strOptString3) || iOptInt == -1) {
            return null;
        }
        return new C1750fT(strOptString, strOptString2, strOptString3, iOptInt, zOptBoolean);
    }

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] ^ i12) ^ 96;
            String[] strArr = A06;
            if (strArr[0].length() == strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A06;
            strArr2[0] = "o";
            strArr2[1] = "Fs5WcDJhxaD3DdRX";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A05 = new byte[]{34, 51, 51, 28, 42, 39, 56, 63, 50, 50, 60, 63, 61, 53, 1, 55, 48, 45, 42, 63, 57, 44, 63, 51, 13, 28, 30, 22, 28, 26, 24, 34, 19, 28, 16, 24, 126, 105, 106, 105, 126, 126, 105, 126, 54, 33, 52, 43, 54, 48, 45, 42, 35, 27, 41, 43, 32, 33};
    }

    static {
        A05();
    }

    public C1750fT(String str, String str2, String str3, int i5, boolean z11) {
        this.A01 = str;
        this.A03 = str2;
        this.A02 = str3;
        this.A00 = i5;
        this.A04 = z11;
    }

    private final String A01() {
        return this.A01;
    }

    private final String A02() {
        return this.A02;
    }

    private final String A03() {
        return this.A03;
    }

    public static void A06(C1750fT c1750fT, C0958Hi c0958Hi) {
        if (c1750fT != null && c1750fT.A09()) {
            new C0937Gn(c0958Hi).A04(true, c1750fT.A01(), c1750fT.A03(), c1750fT.A02(), System.currentTimeMillis(), c1750fT.A08());
        }
    }

    public static void A07(C1750fT c1750fT, C0958Hi c0958Hi) {
        if (c1750fT != null && c1750fT.A0A()) {
            new C0937Gn(c0958Hi).A04(false, c1750fT.A01(), c1750fT.A03(), c1750fT.A02(), System.currentTimeMillis(), c1750fT.A08());
        }
    }

    private final boolean A08() {
        return this.A04;
    }

    private final boolean A09() {
        return (this.A00 & 2) != 0;
    }

    private final boolean A0A() {
        return (this.A00 & 1) != 0;
    }
}
