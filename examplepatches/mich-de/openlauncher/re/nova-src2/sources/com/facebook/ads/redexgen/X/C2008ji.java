package com.facebook.ads.redexgen.X;

import android.content.Intent;
import com.facebook.ads.AudienceNetworkActivity;
import com.facebook.ads.internal.api.AudienceNetworkActivityApi;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.ji, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2008ji {
    public static byte[] A07;
    public static String[] A08 = {"XH1nM", "M0ankU3RYMrdrj1Us3p7qULr3mpg4pO5", "Dw7K55t6soSKzqOeZ743B9f8IBqvV1DS", "s7G", "N", "Mxlo3HwT2z9Ee0UJhHgw07ZR", "58Sw0E1W92Rv7nBY91W7Ry4mCTu6w2My", "1a89emvHyGNg9bMuKpFFJrallY17ElFt"};
    public boolean A00;
    public boolean A01;
    public boolean A02;
    public boolean A03;
    public final AudienceNetworkActivity A04;
    public final AudienceNetworkActivityApi A05;
    public final C0958Hi A06;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A07 = new byte[]{47, 3, 15, 13, 78, 6, 1, 3, 5, 2, 15, 15, 11, 78, 1, 4, 19, 78, 1, 4, 18, 5, 16, 15, 18, 20, 9, 14, 7, 78, 38, 41, 46, 41, 51, 40, 63, 33, 36, 63, 50, 37, 48, 47, 50, 52, 41, 46, 39, 63, 38, 44, 47, 55, 117, 121, 123, 56, 112, 119, 117, 115, 116, 121, 121, 125, 56, 119, 114, 101, 56, AbstractJsonLexerKt.TC_INVALID, 120, 98, 115, 100, 101, 98, AbstractJsonLexerKt.TC_INVALID, 98, AbstractJsonLexerKt.TC_INVALID, 119, 122, 56, 119, 117, 98, AbstractJsonLexerKt.TC_INVALID, 96, AbstractJsonLexerKt.TC_INVALID, 98, 111, 73, 114, 115, 101, 98, 100, 121, 111, 115, 114, 83, 95, 93, 30, 86, 81, 83, 85, 82, 95, 95, 91, 30, 81, 84, 67, 30, 89, 94, 68, 85, 66, 67, 68, 89, 68, 89, 81, 92, 30, 84, 89, 67, 93, 89, 67, 67, 85, 84, 84, 88, 90, 25, 81, 86, 84, 82, 85, 88, 88, 92, 25, 86, 83, 68, 25, 94, 89, 67, 82, 69, 68, 67, 94, 67, 94, 86, 91, 25, 82, 69, 69, 88, 69, 90, 86, 84, 23, 95, 88, 90, 92, 91, 86, 86, 82, 23, 88, 93, 74, 23, 80, 87, 77, 92, 75, 74, 77, 80, 77, 80, 88, 85, 23, 95, 80, 87, 80, 74, 81, 102, 88, 90, 77, 80, 79, 80, 77, 64, 114, 126, 124, 63, 119, 112, 114, 116, 115, 126, 126, 122, 63, 112, 117, 98, 63, 120, AbstractJsonLexerKt.TC_INVALID, 101, 116, 99, 98, 101, 120, 101, 120, 112, 125, 63, 120, 124, 97, 99, 116, 98, 98, 120, 126, AbstractJsonLexerKt.TC_INVALID, 63, 125, 126, 118, 118, 116, 117, 111, 124, 111, 100, 126};
    }

    static {
        A01();
    }

    public C2008ji(AudienceNetworkActivityApi audienceNetworkActivityApi, C0958Hi c0958Hi, AudienceNetworkActivity audienceNetworkActivity) {
        this.A05 = audienceNetworkActivityApi;
        this.A06 = c0958Hi;
        this.A04 = audienceNetworkActivity;
    }

    private final void A02(boolean z11) {
        this.A03 = z11;
    }

    private final boolean A03(EnumC2295oR enumC2295oR) {
        if (enumC2295oR != EnumC2295oR.A0K && enumC2295oR != EnumC2295oR.A0J && enumC2295oR != EnumC2295oR.A09 && enumC2295oR != EnumC2295oR.A06 && enumC2295oR != EnumC2295oR.A0H) {
            EnumC2295oR enumC2295oR2 = EnumC2295oR.A0L;
            String[] strArr = A08;
            if (strArr[0].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A08;
            strArr2[6] = "FGUNQ6qcLs6RDIqlgO5xyG1y2uU5IpD5";
            strArr2[2] = "KgNUwxDdB1c1lHJonivIfFXKpYBX3VEU";
            if (enumC2295oR != enumC2295oR2) {
                return false;
            }
        }
        return true;
    }

    public final void A04(EnumC2295oR enumC2295oR, String str) {
        boolean z11 = !this.A03 || C2203mv.A23(this.A06);
        boolean shouldCallOnDestroy = this.A02;
        if (!shouldCallOnDestroy && z11) {
            boolean shouldCallOnDestroy2 = A03(enumC2295oR);
            if (shouldCallOnDestroy2) {
                A09(EnumC1658dy.A03.A03(), str);
            } else {
                A09(A00(54, 48, 24), str);
            }
            this.A02 = true;
        }
    }

    public final void A05(EnumC2295oR enumC2295oR, String str) {
        if (A03(enumC2295oR)) {
            A09(EnumC1658dy.A09.A03(), str);
        } else {
            A09(A00(141, 35, 57), str);
        }
    }

    public final void A06(EnumC2295oR enumC2295oR, String str) {
        if (A03(enumC2295oR)) {
            A09(EnumC1658dy.A05.A03(), str);
        } else {
            A09(A00(102, 39, 62), str);
        }
        A02(true);
        A04(enumC2295oR, str);
    }

    public final void A07(EnumC2295oR enumC2295oR, String str) {
        if (C2203mv.A1x(this.A06) && !this.A01 && !this.A00) {
            this.A06.A0F().ADU();
            String[] strArr = A08;
            if (strArr[6].charAt(21) == strArr[2].charAt(21)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A08;
            strArr2[1] = "b4x3McMksK7HY4HIHPc61kASUX9xDx5l";
            strArr2[7] = "6od6j09MwT35SfgpLDazU7DHAYlIaL8o";
            A05(enumC2295oR, str);
        }
    }

    public final void A08(String str, C2170mO c2170mO, String str2) {
        Intent intent = new Intent(str + A00(0, 1, 27) + str2);
        if (c2170mO != null) {
            intent.putExtra(A00(268, 5, 4), c2170mO);
        }
        C1840gw.A00(this.A04).A07(intent);
    }

    public final void A09(String str, String str2) {
        if (A00(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 47, 31).equals(str) || EnumC1658dy.A0A.A03().equals(str)) {
            this.A01 = true;
        }
        boolean zEquals = A00(141, 35, 57).equals(str);
        String[] strArr = A08;
        if (strArr[1].charAt(21) != strArr[7].charAt(21)) {
            A08[3] = "lCLWoBssT1DE3iatQdqVM";
            if (zEquals || EnumC1658dy.A09.A03().equals(str)) {
                this.A00 = true;
            }
            String[] strArr2 = A08;
            if (strArr2[0].length() != strArr2[4].length()) {
                A08[5] = "yptSXZ0a2h3otP7nUfRtW4me";
                if (A00(1, 53, 110).equals(str)) {
                    this.A05.finish(9);
                    return;
                } else if (A00(176, 45, 55).equals(str)) {
                    this.A05.finish(10);
                    return;
                } else {
                    A08(str, null, str2);
                    return;
                }
            }
        }
        throw new RuntimeException();
    }
}
