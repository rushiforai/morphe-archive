package com.facebook.ads.redexgen.X;

import android.graphics.Color;
import android.text.SpannableStringBuilder;
import android.text.SpannedString;
import android.text.TextUtils;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.UnderlineSpan;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.cZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1572cZ {
    public static byte[] A00;
    public static String[] A01 = {"6v8", "zfSWx4kkvk7NKb6j574Qzh1ehqPWVXBJ", "k4tsh8ZEDzU1cAoHIV4wBG3pfE", "EGfAZ1IUkUQXFUopLFyyffsKFyGyd3TR", "JSrjBw9biKLFoWVgPhKYCLwUb3hRV", "1G7ywv1e7SgdprbBT1Nw64mInQ", "TlcbJaqckiCcOnwKaYHSEeNhQa", "0TBtFdiJG1pVX1lkXK7keDqrS7O"};
    public static final Pattern A02;
    public static final Map<String, Integer> A03;
    public static final Map<String, Integer> A04;
    public static final Pattern A05;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static int A06(List<C1560cN> list, String str, C1568cV c1568cV) {
        List<C1569cW> listA0E = A0E(list, str, c1568cV);
        for (int i5 = 0; i5 < listA0E.size(); i5++) {
            C1560cN c1560cN = listA0E.get(i5).A01;
            if (c1560cN.A07() != -1) {
                return c1560cN.A07();
            }
        }
        return -1;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static SpannedString A07(String str, String str2, List<C1560cN> list) {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        ArrayDeque arrayDeque = new ArrayDeque();
        int iA05 = 0;
        ArrayList arrayList = new ArrayList();
        while (true) {
            int length = str2.length();
            if (A01[0].length() != 3) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[4] = "jvq9fpfdkdShx4hcabElbHLV0ky6f";
            strArr[5] = "mRcPmReQvAuypAq1aKLIoos46B";
            if (iA05 >= length) {
                while (!arrayDeque.isEmpty()) {
                    A0K(str, (C1568cV) arrayDeque.pop(), arrayList, spannableStringBuilder, list);
                }
                A0K(str, C1568cV.A00(), Collections.emptyList(), spannableStringBuilder, list);
                return SpannedString.valueOf(spannableStringBuilder);
            }
            char cCharAt = str2.charAt(iA05);
            switch (cCharAt) {
                case '&':
                    int iIndexOf = str2.indexOf(59, iA05 + 1);
                    int iIndexOf2 = str2.indexOf(32, iA05 + 1);
                    if (iIndexOf == -1) {
                        iIndexOf = iIndexOf2;
                    } else if (iIndexOf2 != -1) {
                        iIndexOf = Math.min(iIndexOf, iIndexOf2);
                    }
                    if (iIndexOf == -1) {
                        spannableStringBuilder.append(cCharAt);
                        iA05++;
                        break;
                    } else {
                        A0J(str2.substring(iA05 + 1, iIndexOf), spannableStringBuilder);
                        if (iIndexOf == iIndexOf2) {
                            spannableStringBuilder.append((CharSequence) A0C(1, 1, 74));
                        }
                        iA05 = iIndexOf + 1;
                        break;
                    }
                case '<':
                    if (iA05 + 1 < str2.length()) {
                        int i5 = iA05;
                        char cCharAt2 = str2.charAt(i5 + 1);
                        if (A01[0].length() == 3) {
                            A01[0] = "DjA";
                            boolean z11 = cCharAt2 == '/';
                            iA05 = A05(str2, i5 + 1);
                            boolean z12 = str2.charAt(iA05 + (-2)) == '/';
                            String strSubstring = str2.substring((z11 ? 2 : 1) + i5, z12 ? iA05 - 2 : iA05 - 1);
                            if (!strSubstring.trim().isEmpty()) {
                                String strA0D = A0D(strSubstring);
                                if (!A0O(strA0D)) {
                                    break;
                                } else if (!z11) {
                                    if (!z12) {
                                        arrayDeque.push(C1568cV.A01(strSubstring, spannableStringBuilder.length()));
                                        break;
                                    } else {
                                        break;
                                    }
                                } else {
                                    while (!arrayDeque.isEmpty()) {
                                        C1568cV c1568cV = (C1568cV) arrayDeque.pop();
                                        A0K(str, c1568cV, arrayList, spannableStringBuilder, list);
                                        if (arrayDeque.isEmpty()) {
                                            arrayList.clear();
                                        } else {
                                            arrayList.add(new C1567cU(c1568cV, spannableStringBuilder.length()));
                                        }
                                        if (c1568cV.A01.equals(strA0D)) {
                                            break;
                                        }
                                    }
                                    break;
                                }
                            } else {
                                break;
                            }
                        } else {
                            throw new RuntimeException();
                        }
                    } else {
                        iA05++;
                        break;
                    }
                    break;
                default:
                    spannableStringBuilder.append(cCharAt);
                    iA05++;
                    break;
            }
        }
    }

    public static String A0C(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0F() {
        A00 = new byte[]{111, 29, 9, 111, 27, 20, 108, 120, 110, 125, 111, 27, 20, 108, 110, 63, 40, 52, 22, 49, 41, 62, 51, 54, 59, AbstractJsonLexerKt.TC_INVALID, 120, 41, 58, 45, 43, 54, 60, 62, 51, 120, AbstractJsonLexerKt.TC_INVALID, 41, 62, 51, 42, 58, 101, AbstractJsonLexerKt.TC_INVALID, 70, 97, 121, 110, 99, 102, 107, 47, 110, 99, 102, 104, 97, 98, 106, 97, 123, 47, 121, 110, 99, 122, 106, 53, 47, 78, 105, 113, 102, 107, 110, 99, 39, 102, 105, 100, 111, 104, 117, 39, 113, 102, 107, 114, 98, 61, 39, 73, 113, 115, 106, 106, 115, 116, 125, 58, 120, 123, 126, 58, 121, 111, AbstractJsonLexerKt.TC_INVALID, 58, 105, AbstractJsonLexerKt.TC_INVALID, 110, 110, 115, 116, 125, 32, 58, 88, 96, 98, 123, 123, 98, 101, 108, 43, 104, 126, 110, 43, 124, 98, AbstractJsonLexerKt.TC_INVALID, 99, 43, 105, 106, 111, 43, 99, 110, 106, 111, 110, 121, 49, 43, 37, 30, 27, 30, 31, 7, 30, 80, 19, 5, 21, 80, 3, 21, 4, 4, 25, 30, 23, 80, 71, 117, 114, 102, 100, 100, 83, 101, 117, 64, 113, 98, 99, 117, 98, 55, 76, 48, 66, 49, 34, 84, 32, 47, 87, 85, 32, 15, 87, 81, 81, 66, 32, 15, 87, 84, 32, 47, 87, 85, 84, 82, 86, 85, 67, 88, 27, 22, 19, 29, 20, 41, 37, 56, 65, 40, 45, 21, 40, 38, 43, 41, 33, 72, 77, 117, 72, 70, 95, 79, 122, AbstractJsonLexerKt.TC_INVALID, 71, 123, 97, 121, 118, 2, 7, 63, 12, 9, 13, 5, 124, 121, 65, 115, AbstractJsonLexerKt.TC_INVALID, 121, 123, 112, 106, AbstractJsonLexerKt.TC_INVALID, 61, 56, 0, 45, 58, 59, 47, 42, 18, 58, 37, 36, 57, 40, 120, 125, 69, 99, AbstractJsonLexerKt.TC_INVALID, 118, 118, 117, 109, 75, 69, 72, 74, 66, 3, 13, 20, 4, 109, 7, 1, 10, 16, 1, 22, 90, 64, 88, 87, 78, 69, 79, 57, 42, 50, 62, 48, 57, 56, 37, 62, 57, 48, 119, 34, 57, 36, 34, 39, 39, 56, 37, 35, 50, 51, 119, 50, 57, 35, 62, 35, 46, 109, 119, 112, 113, 115, 126, 113, 120, 89, 80, 83, 65, 90, 95, 91, 83, 67, 70, 65, 74, 47, 42, 45, 38, 110, 47, 38, 37, 55, 66, 71, 64, 75, 3, 92, 71, 73, 70, 90, 50, 44, 92, 68, 3, 15, 9, 11, 0, 26, 15, 54, 50, 63, 63, 55, 62, 96, 108, 125, 126, 56, 39, 59, 33, 60, 33, 39, 38, 72, 95, 94, 3, 24, 22, 25, 5, 93, 67, 61, 59, 68, 67, 84, 79, 7, 29, 14, 17, 37, 34, 55, 36, 34, 13, 125, 118, 101, 114, 116, 105, 99, 97, 108, 119, 104, 105, 116, 101, 12, 16, 25, 25, 26, 2};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A0H(SpannableStringBuilder spannableStringBuilder, String str, C1568cV c1568cV, List<C1567cU> list, List<C1560cN> list2) {
        int iA06 = A06(list2, str, c1568cV);
        ArrayList arrayList = new ArrayList(list.size());
        arrayList.addAll(list);
        Collections.sort(arrayList, C1567cU.A02);
        int length = 0;
        int i5 = c1568cV.A00;
        for (int i11 = 0; i11 < arrayList.size(); i11++) {
            if (A0C(TTAdConstant.VIDEO_COVER_URL_CODE, 2, 56).equals(((C1567cU) arrayList.get(i11)).A01.A01)) {
                C1567cU c1567cU = (C1567cU) arrayList.get(i11);
                int iA00 = A00(A06(list2, str, c1567cU.A01), iA06, 1);
                int i12 = c1567cU.A01.A00 - length;
                int i13 = c1567cU.A00 - length;
                CharSequence charSequenceSubSequence = spannableStringBuilder.subSequence(i12, i13);
                spannableStringBuilder.delete(i12, i13);
                spannableStringBuilder.setSpan(new C1247Td(charSequenceSubSequence.toString(), iA00), i5, i12, 33);
                length += charSequenceSubSequence.length();
                i5 = i12;
            }
        }
    }

    static {
        A0F();
        A02 = Pattern.compile(A0C(187, 26, 11));
        A05 = Pattern.compile(A0C(3, 12, 48));
        HashMap map = new HashMap();
        map.put(A0C(440, 5, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), Integer.valueOf(Color.rgb(255, 255, 255)));
        map.put(A0C(349, 4, 65), Integer.valueOf(Color.rgb(0, 255, 0)));
        map.put(A0C(300, 4, 78), Integer.valueOf(Color.rgb(0, 255, 255)));
        map.put(A0C(TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE, 3, 77), Integer.valueOf(Color.rgb(255, 0, 0)));
        map.put(A0C(445, 6, 2), Integer.valueOf(Color.rgb(255, 255, 0)));
        map.put(A0C(380, 7, 25), Integer.valueOf(Color.rgb(255, 0, 255)));
        map.put(A0C(289, 4, 22), Integer.valueOf(Color.rgb(0, 0, 255)));
        map.put(A0C(284, 5, 94), Integer.valueOf(Color.rgb(0, 0, 0)));
        Map<String, Integer> defaultColors = Collections.unmodifiableMap(map);
        A04 = defaultColors;
        HashMap map2 = new HashMap();
        map2.put(A0C(267, 8, 58), Integer.valueOf(Color.rgb(255, 255, 255)));
        map2.put(A0C(244, 7, 23), Integer.valueOf(Color.rgb(0, 255, 0)));
        map2.put(A0C(237, 7, 111), Integer.valueOf(Color.rgb(0, 255, 255)));
        map2.put(A0C(261, 6, 40), Integer.valueOf(Color.rgb(255, 0, 0)));
        map2.put(A0C(275, 9, 109), Integer.valueOf(Color.rgb(255, 255, 0)));
        map2.put(A0C(251, 10, 105), Integer.valueOf(Color.rgb(255, 0, 255)));
        map2.put(A0C(230, 7, 93), Integer.valueOf(Color.rgb(0, 0, 255)));
        map2.put(A0C(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 8, 61), Integer.valueOf(Color.rgb(0, 0, 0)));
        Map<String, Integer> defaultBackgroundColors = Collections.unmodifiableMap(map2);
        A03 = defaultBackgroundColors;
    }

    public static int A00(int i5, int i11, int i12) {
        if (i5 != -1) {
            return i5;
        }
        if (i11 != -1) {
            return i11;
        }
        if (i12 != -1) {
            return i12;
        }
        throw new IllegalArgumentException();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0097 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0098 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0099 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:4:0x000a  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A01(String str) {
        char c11;
        switch (str.hashCode()) {
            case -1364013995:
                c11 = str.equals(A0C(294, 6, 19)) ? (char) 1 : (char) 65535;
                switch (c11) {
                    case 0:
                        return 0;
                    case 1:
                    case 2:
                        return 1;
                    case 3:
                        return 2;
                    default:
                        MV.A07(A0C(167, 15, 103), A0C(69, 22, 112) + str);
                        return Integer.MIN_VALUE;
                }
            case -1074341483:
                if (str.equals(A0C(387, 6, 44))) {
                    c11 = 2;
                }
                switch (c11) {
                }
            case 100571:
                String[] strArr = A01;
                if (strArr[4].length() == strArr[5].length()) {
                    throw new RuntimeException();
                }
                A01[7] = "6VNoPoGqGwpjt6lHxiUXUHsY4OH";
                if (str.equals(A0C(Sdk.SDKError.Reason.AD_EXPIRED_VALUE, 3, 92))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 109757538:
                if (str.equals(A0C(425, 5, 33))) {
                    c11 = 0;
                }
                switch (c11) {
                }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00ba A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00bb A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00bc A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:4:0x000a  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A02(String str) {
        char c11;
        switch (str.hashCode()) {
            case -1842484672:
                c11 = str.equals(A0C(357, 9, 52)) ? (char) 0 : (char) 65535;
                switch (c11) {
                    case 0:
                    case 1:
                        return 0;
                    case 2:
                    case 3:
                        return 1;
                    case 4:
                    case 5:
                        return 2;
                    default:
                        MV.A07(A0C(167, 15, 103), A0C(69, 22, 112) + str);
                        return Integer.MIN_VALUE;
                }
            case -1364013995:
                if (str.equals(A0C(294, 6, 19))) {
                    c11 = 2;
                }
                switch (c11) {
                }
            case -1276788989:
                if (str.equals(A0C(366, 10, 89))) {
                    c11 = 4;
                }
                switch (c11) {
                }
            case -1074341483:
                if (A01[3].charAt(28) == 'r') {
                    throw new RuntimeException();
                }
                A01[3] = "Rh1bbJpmpscE5oNeyjoq3yTjfxZ2Y1Hy";
                if (str.equals(A0C(387, 6, 44))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 100571:
                if (str.equals(A0C(Sdk.SDKError.Reason.AD_EXPIRED_VALUE, 3, 92))) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case 109757538:
                if (str.equals(A0C(425, 5, 33))) {
                    c11 = 1;
                }
                switch (c11) {
                }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:4:0x000c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A03(String str) {
        char c11;
        switch (str.hashCode()) {
            case -1364013995:
                if (!str.equals(A0C(294, 6, 19))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 2;
                    break;
                }
            case -1074341483:
                if (str.equals(A0C(387, 6, 44))) {
                    c11 = 3;
                    break;
                }
                break;
            case 100571:
                if (str.equals(A0C(Sdk.SDKError.Reason.AD_EXPIRED_VALUE, 3, 92))) {
                    c11 = 4;
                    break;
                }
                break;
            case 3317767:
                if (str.equals(A0C(345, 4, 66))) {
                    c11 = 1;
                    break;
                }
                break;
            case 108511772:
                if (str.equals(A0C(TTAdConstant.DOWNLOAD_URL_CODE, 5, 6))) {
                    c11 = 5;
                    break;
                }
                break;
            case 109757538:
                if (str.equals(A0C(425, 5, 33))) {
                    c11 = 0;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                return 1;
            case 1:
                return 4;
            case 2:
            case 3:
                return 2;
            case 4:
                return 3;
            case 5:
                return 5;
            default:
                MV.A07(A0C(167, 15, 103), A0C(44, 25, 120) + str);
                return 2;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0008  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A04(String str) {
        char c11;
        switch (str.hashCode()) {
            case 3462:
                if (!str.equals(A0C(376, 2, 41))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 1;
                    break;
                }
            case 3642:
                if (str.equals(A0C(TTAdConstant.VIDEO_INFO_CODE, 2, 88))) {
                    c11 = 0;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                return 1;
            case 1:
                return 2;
            default:
                MV.A07(A0C(167, 15, 103), A0C(18, 26, 40) + str);
                return Integer.MIN_VALUE;
        }
    }

    public static int A05(String str, int i5) {
        int iIndexOf = str.indexOf(62, i5);
        if (iIndexOf == -1) {
            int index = str.length();
            return index;
        }
        int index2 = iIndexOf + 1;
        return index2;
    }

    public static C1052Ld A08(String str) {
        C1571cY builder = new C1571cY();
        A0L(str, builder);
        return builder.A07();
    }

    public static C1251Th A09(CharSequence charSequence) {
        C1571cY infoBuilder = new C1571cY();
        infoBuilder.A0A = charSequence;
        return infoBuilder.A07().A0H();
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0060, code lost:
    
        if (r6 != false) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0062, code lost:
    
        r0 = r4.trim();
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x006a, code lost:
    
        return A0B(r0, r5, r7, r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x006b, code lost:
    
        if (r6 != false) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x006e, code lost:
    
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static C1564cR A0A(C1084Mk c1084Mk, List<C1560cN> list) {
        String strA0T = c1084Mk.A0T();
        if (strA0T == null) {
            return null;
        }
        Matcher matcher = A02.matcher(strA0T);
        if (A01[3].charAt(28) == 'r') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[4] = "91CWGHq3LpltnZbfESWEUBhgmk9qe";
        strArr[5] = "OnICX6gWtgZDHYEEYRRI64echh";
        if (matcher.matches()) {
            return A0B(null, matcher, c1084Mk, list);
        }
        String strA0T2 = c1084Mk.A0T();
        if (strA0T2 == null) {
            return null;
        }
        Matcher matcher2 = A02.matcher(strA0T2);
        boolean zMatches = matcher2.matches();
        if (A01[3].charAt(28) != 'r') {
            String[] strArr2 = A01;
            strArr2[6] = "tfXkp8rmVMvKE5TvQHTEpsM5Gm";
            strArr2[2] = "bHzMLfZhwx7svyeGK9WfnLq261";
        }
    }

    public static C1564cR A0B(String str, Matcher matcher, C1084Mk c1084Mk, List<C1560cN> list) {
        C1571cY c1571cY = new C1571cY();
        try {
            c1571cY.A09 = AbstractC1573ca.A01((String) AbstractC1062Ln.A01(matcher.group(1)));
            c1571cY.A08 = AbstractC1573ca.A01((String) AbstractC1062Ln.A01(matcher.group(2)));
            A0L((String) AbstractC1062Ln.A01(matcher.group(3)), c1571cY);
            StringBuilder sb2 = new StringBuilder();
            String strA0T = c1084Mk.A0T();
            while (!TextUtils.isEmpty(strA0T)) {
                if (sb2.length() > 0) {
                    sb2.append(A0C(0, 1, 18));
                }
                sb2.append(strA0T.trim());
                strA0T = c1084Mk.A0T();
            }
            c1571cY.A0A = A07(str, sb2.toString(), list);
            return c1571cY.A08();
        } catch (NumberFormatException unused) {
            MV.A07(A0C(167, 15, 103), A0C(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 30, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE) + matcher.group());
            return null;
        }
    }

    public static String A0D(String str) {
        String strTrim = str.trim();
        AbstractC1062Ln.A07(!strTrim.isEmpty());
        return N1.A1P(strTrim, A0C(182, 5, 27))[0];
    }

    public static List<C1569cW> A0E(List<C1560cN> list, String str, C1568cV c1568cV) {
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < list.size(); i5++) {
            C1560cN c1560cN = list.get(i5);
            int i11 = c1560cN.A09(str, c1568cV.A01, c1568cV.A03, c1568cV.A02);
            if (i11 > 0) {
                arrayList.add(new C1569cW(i11, c1560cN));
            }
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    public static void A0G(SpannableStringBuilder spannableStringBuilder, C1560cN c1560cN, int i5, int i11) {
        if (c1560cN == null) {
            return;
        }
        if (c1560cN.A08() != -1) {
            AbstractC1057Li.A00(spannableStringBuilder, new StyleSpan(c1560cN.A08()), i5, i11, 33);
        }
        boolean zA0S = c1560cN.A0S();
        if (A01[0].length() != 3) {
            throw new RuntimeException();
        }
        A01[3] = "Ea2yhfvTbSmnQ3AL9wscme0mkBlQAAQb";
        if (zA0S) {
            spannableStringBuilder.setSpan(new StrikethroughSpan(), i5, i11, 33);
        }
        if (c1560cN.A0T()) {
            spannableStringBuilder.setSpan(new UnderlineSpan(), i5, i11, 33);
        }
        if (c1560cN.A0R()) {
            AbstractC1057Li.A00(spannableStringBuilder, new ForegroundColorSpan(c1560cN.A05()), i5, i11, 33);
        }
        if (c1560cN.A0Q()) {
            AbstractC1057Li.A00(spannableStringBuilder, new BackgroundColorSpan(c1560cN.A04()), i5, i11, 33);
        }
        if (c1560cN.A0K() != null) {
            AbstractC1057Li.A00(spannableStringBuilder, new TypefaceSpan(c1560cN.A0K()), i5, i11, 33);
        }
        switch (c1560cN.A06()) {
            case 1:
                AbstractC1057Li.A00(spannableStringBuilder, new AbsoluteSizeSpan((int) c1560cN.A03(), true), i5, i11, 33);
                break;
            case 2:
                AbstractC1057Li.A00(spannableStringBuilder, new RelativeSizeSpan(c1560cN.A03()), i5, i11, 33);
                break;
            case 3:
                AbstractC1057Li.A00(spannableStringBuilder, new RelativeSizeSpan(c1560cN.A03() / 100.0f), i5, i11, 33);
                break;
        }
        if (c1560cN.A0P()) {
            spannableStringBuilder.setSpan(new C1248Te(), i5, i11, 33);
        }
    }

    public static void A0I(SpannableStringBuilder spannableStringBuilder, Set<String> set, int i5, int i11) {
        for (String className : set) {
            if (A04.containsKey(className)) {
                spannableStringBuilder.setSpan(new ForegroundColorSpan(A04.get(className).intValue()), i5, i11, 33);
            } else if (A03.containsKey(className)) {
                spannableStringBuilder.setSpan(new BackgroundColorSpan(A03.get(className).intValue()), i5, i11, 33);
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0007  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000b  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0041  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A0J(String str, SpannableStringBuilder spannableStringBuilder) {
        char c11;
        switch (str.hashCode()) {
            case 3309:
                String[] strArr = A01;
                if (strArr[4].length() != strArr[5].length()) {
                    String[] strArr2 = A01;
                    strArr2[6] = "GyrUgWYUHRVnM8l23XJQu5UGp1";
                    strArr2[2] = "NiXpxqomIEZVEieKHTFkMNs61I";
                    c11 = str.equals(A0C(Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, 2, 41)) ? (char) 1 : (char) 65535;
                } else {
                    A01[1] = "gYg0TbBGZj44BoLjOyPjmRv7LvSL93bP";
                    if (str.equals(A0C(Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, 2, 17))) {
                    }
                }
                switch (c11) {
                    case 0:
                        spannableStringBuilder.append('<');
                        return;
                    case 1:
                        spannableStringBuilder.append('>');
                        return;
                    case 2:
                        spannableStringBuilder.append(' ');
                        return;
                    case 3:
                        String[] strArr3 = A01;
                        if (strArr3[4].length() == strArr3[5].length()) {
                            throw new RuntimeException();
                        }
                        A01[1] = "PWkqGnWkxZ1sWbRjRe0mw063p817mvNo";
                        spannableStringBuilder.append('&');
                        return;
                    default:
                        MV.A07(A0C(167, 15, 103), A0C(Sdk.SDKError.Reason.AD_HTML_FAILED_TO_LOAD_VALUE, 31, 32) + str + A0C(16, 2, 100));
                        return;
                }
            case 3464:
                if (str.equals(A0C(378, 2, 71))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 96708:
                if (A01[1].charAt(15) != 'j') {
                    throw new RuntimeException();
                }
                A01[3] = "6WzuZpwu0TX1H2KVN9ho2pT5H3xGspev";
                if (str.equals(A0C(Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE, 3, 63))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 3374865:
                if (str.equals(A0C(393, 4, Sdk.SDKError.Reason.TPAT_ERROR_VALUE))) {
                    c11 = 2;
                }
                switch (c11) {
                }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Incorrect condition in loop: B:39:0x00cc */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0011  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A0K(String str, C1568cV c1568cV, List<C1567cU> list, SpannableStringBuilder spannableStringBuilder, List<C1560cN> list2) {
        int start;
        int i5 = c1568cV.A00;
        int i11 = spannableStringBuilder.length();
        String str2 = c1568cV.A01;
        int start2 = str2.hashCode();
        switch (start2) {
            case 0:
                if (str2.equals(A0C(0, 0, 3))) {
                    start = 7;
                    break;
                } else {
                    start = -1;
                    break;
                }
            case ads_mobile_sdk.pd.Q0 /* 98 */:
                if (str2.equals(A0C(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 1, 84))) {
                    start = 0;
                    break;
                }
                break;
            case ads_mobile_sdk.pd.R0 /* 99 */:
                if (str2.equals(A0C(293, 1, Sdk.SDKError.Reason.TPAT_ERROR_VALUE))) {
                    start = 4;
                    break;
                }
                break;
            case 105:
                if (str2.equals(A0C(Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE, 1, 44))) {
                    start = 1;
                    break;
                }
                break;
            case ASSET_FAILED_STATUS_CODE_VALUE:
                if (str2.equals(A0C(430, 1, 15))) {
                    start = 3;
                    break;
                }
                break;
            case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                if (str2.equals(A0C(431, 1, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE))) {
                    start = 6;
                    break;
                }
                break;
            case 3314158:
                if (str2.equals(A0C(341, 4, 104))) {
                    start = 5;
                    break;
                }
                break;
            case 3511770:
                if (str2.equals(A0C(TTAdConstant.DOWNLOAD_URL_AND_PACKAGE_NAME, 4, 65))) {
                    start = 2;
                    break;
                }
                break;
        }
        switch (start) {
            case 0:
                spannableStringBuilder.setSpan(new StyleSpan(1), i5, i11, 33);
                break;
            case 1:
                spannableStringBuilder.setSpan(new StyleSpan(2), i5, i11, 33);
                break;
            case 2:
                A0H(spannableStringBuilder, str, c1568cV, list, list2);
                break;
            case 3:
                spannableStringBuilder.setSpan(new UnderlineSpan(), i5, i11, 33);
                break;
            case 4:
                A0I(spannableStringBuilder, c1568cV.A03, i5, i11);
                break;
            case 5:
            case 6:
            case 7:
                break;
            default:
                return;
        }
        List<C1569cW> listA0E = A0E(list2, str, c1568cV);
        for (int end = 0; end < start; end++) {
            A0G(spannableStringBuilder, listA0E.get(end).A01, i5, i11);
        }
    }

    public static void A0L(String str, C1571cY c1571cY) {
        String name = A0C(167, 15, 103);
        Matcher matcher = A05.matcher(str);
        while (matcher.find()) {
            String str2 = (String) AbstractC1062Ln.A01(matcher.group(1));
            String str3 = (String) AbstractC1062Ln.A01(matcher.group(2));
            try {
                if (A0C(353, 4, 88).equals(str2)) {
                    A0M(str3, c1571cY);
                } else if (A0C(Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, 5, 13).equals(str2)) {
                    c1571cY.A06 = A03(str3);
                } else if (A0C(397, 8, 63).equals(str2)) {
                    A0N(str3, c1571cY);
                } else if (A0C(421, 4, 3).equals(str2)) {
                    c1571cY.A02 = AbstractC1573ca.A00(str3);
                } else if (A0C(432, 8, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE).equals(str2)) {
                    c1571cY.A07 = A04(str3);
                } else {
                    MV.A07(name, A0C(147, 20, 7) + str2 + A0C(15, 1, 114) + str3);
                }
            } catch (NumberFormatException unused) {
                MV.A07(name, A0C(91, 26, 109) + matcher.group());
            }
        }
    }

    public static void A0M(String str, C1571cY c1571cY) throws NumberFormatException {
        int iIndexOf = str.indexOf(44);
        if (iIndexOf != -1) {
            int commaIndex = iIndexOf + 1;
            c1571cY.A03 = A01(str.substring(commaIndex));
            str = str.substring(0, iIndexOf);
        }
        if (A01[7].length() != 27) {
            throw new RuntimeException();
        }
        A01[3] = "uQN84nlA75y04Oqx4R9Gb8Wkkyggth9o";
        if (str.endsWith(A0C(2, 1, 91))) {
            c1571cY.A00 = AbstractC1573ca.A00(str);
            c1571cY.A04 = 0;
        } else {
            int commaIndex2 = Integer.parseInt(str);
            c1571cY.A00 = commaIndex2;
            c1571cY.A04 = 1;
        }
    }

    public static void A0N(String str, C1571cY c1571cY) {
        int iIndexOf = str.indexOf(44);
        if (iIndexOf != -1) {
            int commaIndex = iIndexOf + 1;
            int iA02 = A02(str.substring(commaIndex));
            if (A01[1].charAt(15) != 'j') {
                throw new RuntimeException();
            }
            A01[1] = "kcnRMJamAmHiFzajDDSuDUVQ6UORDZwH";
            c1571cY.A05 = iA02;
            str = str.substring(0, iIndexOf);
        }
        c1571cY.A01 = AbstractC1573ca.A00(str);
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x00b8 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0O(String str) {
        char c11;
        switch (str.hashCode()) {
            case ads_mobile_sdk.pd.Q0 /* 98 */:
                if (A01[1].charAt(15) != 'j') {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[6] = "gYEzXRCSaP0btoiuoQChE5deOS";
                strArr[2] = "ZzpTgQFLhTliv71J3BKznVcuUA";
                if (str.equals(A0C(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 1, 84))) {
                    c11 = 0;
                }
                switch (c11) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                        return true;
                    default:
                        return false;
                }
            case ads_mobile_sdk.pd.R0 /* 99 */:
                if (str.equals(A0C(293, 1, Sdk.SDKError.Reason.TPAT_ERROR_VALUE))) {
                    c11 = 1;
                }
                switch (c11) {
                }
            case 105:
                if (str.equals(A0C(Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE, 1, 44))) {
                    c11 = 2;
                }
                switch (c11) {
                }
            case ASSET_FAILED_STATUS_CODE_VALUE:
                if (str.equals(A0C(430, 1, 15))) {
                    c11 = 6;
                }
                switch (c11) {
                }
            case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                if (str.equals(A0C(431, 1, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE))) {
                    c11 = 7;
                }
                switch (c11) {
                }
            case 3650:
                if (str.equals(A0C(TTAdConstant.VIDEO_COVER_URL_CODE, 2, 56))) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case 3314158:
                if (str.equals(A0C(341, 4, 104))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 3511770:
                if (str.equals(A0C(TTAdConstant.DOWNLOAD_URL_AND_PACKAGE_NAME, 4, 65))) {
                    c11 = 4;
                }
                switch (c11) {
                }
        }
        c11 = 65535;
        switch (c11) {
        }
    }
}
