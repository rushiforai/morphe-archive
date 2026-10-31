package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.cJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1556cJ {
    public static byte[] A02;
    public static String[] A03 = {"lJvTV1IM7hs7", "PRNnRUobRpGnXZ0gXytIbuZj8kp2Tifj", "bNkW6dQCxzm9LdB00jKOopGfFc2AT89t", "s4KtPf2K9cUmExQNthjfTOUPHZLuZKNx", "o3KU9lQ4nBxOI8hzckWmUjJto4sHKy9y", "J1fzOlq2Er4uvigloMbfYHOhugPrJLAR", "sUNUKGwXbPm6aeYl7n3VTxidrVyIUsqM", "XoghjSlHxjFBvsqjlEabTUzlw8OeuE7g"};
    public static final Pattern A04;
    public static final Pattern A05;
    public final C1084Mk A00 = new C1084Mk();
    public final StringBuilder A01 = new StringBuilder();

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 1);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A02 = new byte[]{53, 12, 5, 124, 105, 56, 75, 75, 18, 4, 20, 94, 55, 16, 8, 31, 18, 23, 26, 94, 24, 17, 16, 10, 83, 13, 23, 4, 27, 68, 94, 89, 35, 17, 22, 2, 0, 0, 55, 7, 7, 36, 21, 6, 7, 17, 6, 74, 56, 126, 121, 84, 77, 75, 65, 71, 31, 0, 10, 121, 124, 0, AbstractJsonLexerKt.TC_INVALID, 8, 11, 0, 126, AbstractJsonLexerKt.TC_INVALID, 114, 4, 4, 19, 22, 119, 28, 1, 21, 113, 6, 112, 2, 5, 19, 119, 28, 1, 21, 113, 7, 5, 4, 92, 84, 80, 73, 65, 80, 9, 5, 8, 64, 77, 77, 4, 7, 5, 13, 1, 20, 9, 19, 8, 2, 75, 5, 9, 10, 9, 20, 21, 24, 27, 19, 32, 44, 47, 44, 49, 62, 51, 61, 51, 46, 41, 19, 27, 62, 55, 54, 44, 117, 62, 57, 53, 49, 52, 33, 112, 121, 120, 98, 59, 101, AbstractJsonLexerKt.TC_INVALID, 108, 115, 89, 80, 81, 75, 18, 76, 75, 70, 83, 90, 86, 95, 94, 68, 29, 71, 85, 89, 87, 88, 68, 87, 74, 95, 82, 87, 93, 68, 93, 78, 89, 80, 88, 11, 12, 27, 0, 84, 9, 22, 10, 16, 13, 16, 22, 23, 48, 33, 60, 48, 105, 39, 43, 41, 38, 45, 42, 33, 105, 49, 52, 54, 45, 35, 44, 48, 57, 40, 53, 57, 96, 41, 40, 46, 34, 63, 44, 57, 36, 34, 35, 65, 90, 80, 81, 70, 23, 12, 6, 7, 16, 14, 11, 12, 7, 119, 55};
    }

    static {
        A07();
        A05 = Pattern.compile(A01(49, 19, 35));
        A04 = Pattern.compile(A01(68, 32, 45));
    }

    public static char A00(C1084Mk c1084Mk, int i5) {
        return (char) c1084Mk.A0l()[i5];
    }

    public static String A02(C1084Mk c1084Mk) {
        int limit = c1084Mk.A09();
        int iA0A = c1084Mk.A0A();
        char c11 = 0;
        while (limit < iA0A && c11 == 0) {
            int i5 = limit + 1;
            int position = c1084Mk.A0l()[limit];
            int limit2 = (char) position;
            c11 = limit2 == 41 ? (char) 1 : (char) 0;
            limit = i5;
        }
        int position2 = c1084Mk.A09();
        return c1084Mk.A0W((limit - 1) - position2).trim();
    }

    public static String A03(C1084Mk c1084Mk, StringBuilder sb2) {
        sb2.setLength(0);
        int iA09 = c1084Mk.A09();
        int iA0A = c1084Mk.A0A();
        boolean z11 = false;
        while (iA09 < iA0A && !z11) {
            int position = c1084Mk.A0l()[iA09];
            char c11 = (char) position;
            if ((c11 < 'A' || c11 > 'Z') && ((c11 < 'a' || c11 > 'z') && ((c11 < '0' || c11 > '9') && c11 != '#' && c11 != '-'))) {
                int limit = A03[0].length();
                if (limit == 11) {
                    throw new RuntimeException();
                }
                String[] strArr = A03;
                strArr[1] = "mCGtI0QiSkyrfVZGohdEdWQKILFWpqhS";
                strArr[5] = "zdmXXCOsWuQwLgyrBcHPqIAUQwRwnjj9";
                if (c11 != '.' && c11 != '_') {
                    z11 = true;
                }
            }
            iA09++;
            sb2.append(c11);
        }
        int position2 = c1084Mk.A09();
        c1084Mk.A0g(iA09 - position2);
        return sb2.toString();
    }

    public static String A04(C1084Mk c1084Mk, StringBuilder sb2) {
        A09(c1084Mk);
        if (c1084Mk.A07() == 0) {
            return null;
        }
        String strA03 = A03(c1084Mk, sb2);
        String strA01 = A01(0, 0, 65);
        if (!strA01.equals(strA03)) {
            return strA03;
        }
        String identifier = strA01 + ((char) c1084Mk.A0I());
        return identifier;
    }

    public static String A05(C1084Mk c1084Mk, StringBuilder sb2) {
        StringBuilder sb3 = new StringBuilder();
        boolean z11 = false;
        while (!z11) {
            int iA09 = c1084Mk.A09();
            String strA04 = A04(c1084Mk, sb2);
            if (strA04 == null) {
                String[] strArr = A03;
                if (strArr[6].charAt(0) != strArr[3].charAt(0)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A03;
                strArr2[6] = "sG7VvmGnqjfg5AIih5VwIcXymFwlMgD0";
                strArr2[3] = "s5pJ3gpLiyqtX7ScU9oFWVLsaPbWNu74";
                return null;
            }
            if (A01(252, 1, 75).equals(strA04) || A01(11, 1, 100).equals(strA04)) {
                c1084Mk.A0f(iA09);
                String[] strArr3 = A03;
                if (strArr3[6].charAt(0) != strArr3[3].charAt(0)) {
                    z11 = true;
                } else {
                    A03[7] = "46OQjtQYGREU6Yk0poY5rwue5kg79imI";
                    z11 = true;
                }
            } else {
                sb3.append(strA04);
            }
        }
        return sb3.toString();
    }

    public static String A06(C1084Mk c1084Mk, StringBuilder sb2) {
        A09(c1084Mk);
        if (c1084Mk.A07() < 5) {
            return null;
        }
        String strA0W = c1084Mk.A0W(5);
        String cueSelector = A01(6, 5, 112);
        if (!cueSelector.equals(strA0W)) {
            return null;
        }
        int iA09 = c1084Mk.A09();
        String token = A04(c1084Mk, sb2);
        if (token == null) {
            return null;
        }
        String cueSelector2 = A01(251, 1, 13);
        if (cueSelector2.equals(token)) {
            c1084Mk.A0f(iA09);
            String cueSelector3 = A01(0, 0, 65);
            return cueSelector3;
        }
        String target = null;
        String cueSelector4 = A01(3, 1, 85);
        if (cueSelector4.equals(token)) {
            target = A02(c1084Mk);
        }
        String token2 = A04(c1084Mk, sb2);
        String cueSelector5 = A01(4, 1, 65);
        if (cueSelector5.equals(token2)) {
            return target;
        }
        return null;
    }

    public static void A08(C1084Mk c1084Mk) {
        String line;
        do {
            line = c1084Mk.A0T();
        } while (!TextUtils.isEmpty(line));
    }

    public static void A09(C1084Mk c1084Mk) {
        boolean skipping = true;
        while (c1084Mk.A07() > 0 && skipping) {
            boolean skipping2 = A0E(c1084Mk);
            if (!skipping2) {
                boolean skipping3 = A0D(c1084Mk);
                if (!skipping3) {
                    skipping = false;
                }
            }
            skipping = true;
        }
    }

    public static void A0A(C1084Mk c1084Mk, C1560cN c1560cN, StringBuilder sb2) {
        A09(c1084Mk);
        String strA03 = A03(c1084Mk, sb2);
        String strA01 = A01(0, 0, 65);
        if (strA01.equals(strA03)) {
            return;
        }
        String strA012 = A01(5, 1, 3);
        String property = A04(c1084Mk, sb2);
        if (!strA012.equals(property)) {
            return;
        }
        A09(c1084Mk);
        String token = A05(c1084Mk, sb2);
        if (token == null || strA01.equals(token)) {
            return;
        }
        int iA09 = c1084Mk.A09();
        String strA04 = A04(c1084Mk, sb2);
        String property2 = A01(11, 1, 100);
        if (!property2.equals(strA04)) {
            String property3 = A01(252, 1, 75);
            if (property3.equals(strA04)) {
                c1084Mk.A0f(iA09);
            } else {
                return;
            }
        }
        String property4 = A01(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 5, 66);
        if (property4.equals(strA03)) {
            c1560cN.A0C(AbstractC1070Lw.A00(token));
            return;
        }
        String property5 = A01(103, 16, 103);
        if (property5.equals(strA03)) {
            c1560cN.A0B(AbstractC1070Lw.A00(token));
            return;
        }
        String property6 = A01(189, 13, 120);
        boolean z11 = true;
        if (property6.equals(strA03)) {
            String property7 = A01(183, 4, 42);
            if (property7.equals(token)) {
                c1560cN.A0E(1);
                return;
            }
            String property8 = A01(237, 5, 53);
            if (!property8.equals(token)) {
                return;
            }
            c1560cN.A0E(2);
            return;
        }
        String property9 = A01(Sdk.SDKError.Reason.AD_CONSUMED_VALUE, 20, 69);
        if (property9.equals(strA03)) {
            String property10 = A01(100, 3, 32);
            if (!property10.equals(token)) {
                String property11 = A01(128, 6, 91);
                if (!token.startsWith(property11)) {
                    z11 = false;
                }
            }
            c1560cN.A0H(z11);
            return;
        }
        String property12 = A01(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 15, 76);
        if (property12.equals(strA03)) {
            String property13 = A01(242, 9, 99);
            if (!property13.equals(token)) {
                return;
            }
            c1560cN.A0J(true);
            return;
        }
        String property14 = A01(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 11, 89);
        if (property14.equals(strA03)) {
            c1560cN.A0F(token);
            return;
        }
        String property15 = A01(166, 11, 49);
        if (property15.equals(strA03)) {
            String property16 = A01(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 4, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
            if (!property16.equals(token)) {
                return;
            }
            c1560cN.A0G(true);
            return;
        }
        String property17 = A01(156, 10, 62);
        if (property17.equals(strA03)) {
            String property18 = A01(177, 6, 63);
            if (!property18.equals(token)) {
                return;
            }
            c1560cN.A0I(true);
            return;
        }
        String property19 = A01(147, 9, 23);
        if (!property19.equals(strA03)) {
            return;
        }
        A0C(token, c1560cN);
    }

    private void A0B(C1560cN c1560cN, String str) {
        if (A01(0, 0, 65).equals(str)) {
            return;
        }
        int iIndexOf = str.indexOf(91);
        if (iIndexOf != -1) {
            Matcher matcher = A05.matcher(str.substring(iIndexOf));
            if (matcher.matches()) {
                c1560cN.A0N((String) AbstractC1062Ln.A01(matcher.group(1)));
            }
            str = str.substring(0, iIndexOf);
        }
        String[] strArrA1O = N1.A1O(str, A01(47, 2, 23));
        String str2 = strArrA1O[0];
        int iIndexOf2 = str2.indexOf(35);
        if (iIndexOf2 != -1) {
            c1560cN.A0M(str2.substring(0, iIndexOf2));
            int voiceStartIndex = iIndexOf2 + 1;
            c1560cN.A0L(str2.substring(voiceStartIndex));
        } else {
            c1560cN.A0M(str2);
        }
        int voiceStartIndex2 = strArrA1O.length;
        if (voiceStartIndex2 > 1) {
            int voiceStartIndex3 = strArrA1O.length;
            c1560cN.A0O((String[]) N1.A1J(strArrA1O, 1, voiceStartIndex3));
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0058  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A0C(String str, C1560cN c1560cN) {
        char c11;
        Matcher matcher = A04.matcher(XC.A01(str));
        if (!matcher.matches()) {
            MV.A07(A01(32, 15, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), A01(12, 20, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) + str + A01(1, 2, 42));
            return;
        }
        String str2 = (String) AbstractC1062Ln.A01(matcher.group(2));
        switch (str2.hashCode()) {
            case 37:
                if (!str2.equals(A01(0, 1, 17))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 2;
                    break;
                }
            case 3240:
                if (str2.equals(A01(Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 2, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE))) {
                    c11 = 1;
                    break;
                }
                break;
            case 3592:
                if (str2.equals(A01(187, 2, 33))) {
                    c11 = 0;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                c1560cN.A0D(1);
                break;
            case 1:
                c1560cN.A0D(2);
                break;
            case 2:
                c1560cN.A0D(3);
                break;
            default:
                throw new IllegalStateException();
        }
        c1560cN.A0A(Float.parseFloat((String) AbstractC1062Ln.A01(matcher.group(1))));
    }

    public static boolean A0D(C1084Mk c1084Mk) {
        int position = c1084Mk.A09();
        int limit = c1084Mk.A0A();
        byte[] bArrA0l = c1084Mk.A0l();
        if (position + 2 > limit) {
            return false;
        }
        int i5 = position + 1;
        if (bArrA0l[position] != 47) {
            return false;
        }
        int i11 = i5 + 1;
        if (bArrA0l[i5] == 42) {
            while (i11 + 1 < limit) {
                int i12 = i11 + 1;
                char skippedChar = (char) bArrA0l[i11];
                if (skippedChar == '*') {
                    char skippedChar2 = bArrA0l[i12];
                    if (skippedChar2 == '/') {
                        limit = i12 + 1;
                        i11 = limit;
                    }
                }
                i11 = i12;
            }
            c1084Mk.A0g(limit - c1084Mk.A09());
            return true;
        }
        return false;
    }

    public static boolean A0E(C1084Mk c1084Mk) {
        switch (A00(c1084Mk, c1084Mk.A09())) {
            case '\t':
            case '\n':
            case '\f':
            case '\r':
            case ' ':
                c1084Mk.A0g(1);
                return true;
            default:
                return false;
        }
    }

    public final List<C1560cN> A0F(C1084Mk c1084Mk) {
        String selector;
        this.A01.setLength(0);
        int iA09 = c1084Mk.A09();
        A08(c1084Mk);
        C1084Mk c1084Mk2 = this.A00;
        byte[] bArrA0l = c1084Mk.A0l();
        int initialInputPosition = c1084Mk.A09();
        c1084Mk2.A0j(bArrA0l, initialInputPosition);
        this.A00.A0f(iA09);
        ArrayList arrayList = new ArrayList();
        while (true) {
            String selector2 = A06(this.A00, this.A01);
            if (selector2 == null) {
                return arrayList;
            }
            if (!A01(251, 1, 13).equals(A04(this.A00, this.A01))) {
                return arrayList;
            }
            C1560cN c1560cN = new C1560cN();
            A0B(c1560cN, selector2);
            String strA04 = null;
            boolean z11 = false;
            while (true) {
                selector = A01(252, 1, 75);
                if (z11) {
                    break;
                }
                int iA092 = this.A00.A09();
                strA04 = A04(this.A00, this.A01);
                z11 = strA04 == null || selector.equals(strA04);
                if (!z11) {
                    this.A00.A0f(iA092);
                    A0A(this.A00, c1560cN, this.A01);
                }
            }
            if (selector.equals(strA04)) {
                arrayList.add(c1560cN);
            }
        }
    }
}
