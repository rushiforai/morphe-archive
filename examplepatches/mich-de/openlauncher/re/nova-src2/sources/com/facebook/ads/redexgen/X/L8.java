package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public abstract class L8 {
    public static byte[] A00;
    public static String[] A01 = {"mtj5AQZYnC8ZYCgNjgiGa", "9O58BTwK8QpcbA3X6JRwP5oJLMZW7S", "iPIls1WSFCVGfJIo7lr2cSH8ysr", "REttTrJRchZ3AtecVlPOO", "ltUsr5pNisVr9fJwLlHjI2fYwYY", "SNC", "c8upypToN0Fp2Q0KPNP0YDydruE1Whq3", "dJqAUyGQwlClrsBpC8sa4cubBo774T"};
    public static final ArrayList<L6> A02;
    public static final Pattern A03;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static L7 A04(String str) {
        Matcher matcher = A03.matcher(str);
        if (!matcher.matches()) {
            return null;
        }
        String str2 = (String) AbstractC1062Ln.A01(matcher.group(1));
        String strGroup = matcher.group(2);
        try {
            return new L7(Integer.parseInt(str2, 16), strGroup != null ? Integer.parseInt(strGroup) : 0);
        } catch (NumberFormatException unused) {
            return null;
        }
    }

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 23);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A00 = new byte[]{84, 103, 122, 62, 107, 86, 36, 34, 81, 107, 39, 112, 75, 39, 80, 58, 39, 51, 87, 113, 56, 119, 35, 34, 53, 48, 86, 36, 34, 81, 58, 39, 51, 87, 113, 59, 38, 56, 119, 35, 35, 53, 46, 102, 100, 42, 52, 120, 122, 52, 45, 40, 57, 57, 37, 32, 42, 40, 61, 32, 38, 39, 102, 42, 44, 40, 100, AbstractJsonLexerKt.TC_INVALID, 121, 113, 68, 85, 85, 73, 76, 70, 68, 81, 76, 74, 75, 10, 70, 64, 68, 8, 18, 21, 29, 28, 13, 13, 17, 20, 30, 28, 9, 20, 18, 19, 82, 25, 11, 31, 14, 8, 31, 14, 1, 16, 16, 12, 9, 3, 1, 20, 9, 15, 14, 79, 9, 4, 83, 43, 58, 58, 38, 35, 41, 43, 62, 35, 37, 36, 101, 58, 45, 57, 77, 92, 92, 64, 69, 79, 77, 88, 69, 67, 66, 3, 88, 88, 65, 64, 7, 84, 65, 64, 1, 16, 16, 12, 9, 3, 1, 20, 9, 15, 14, 79, 22, 15, 2, 19, 21, 2, 30, 15, 15, 19, 22, 28, 30, 11, 22, 16, 17, 80, 7, 82, 28, 30, 18, 26, 13, 30, 82, 18, 16, 11, 22, 16, 17, 103, 118, 118, 106, 111, 101, 103, 114, 111, 105, 104, 41, 126, 43, 99, 107, 117, 97, 87, 70, 70, 90, 95, 85, 87, 66, 95, 89, 88, 25, 78, 27, 95, 91, 87, 81, 83, 27, 67, 68, 95, 41, 56, 56, 36, 33, 43, 41, 60, 33, 39, 38, 103, 48, 101, 37, 56, 124, 101, 43, 45, 41, 101, 126, 120, 112, 47, 62, 62, 34, 39, 45, 47, 58, 39, 33, 32, 97, 54, 99, 35, 62, 122, 99, 56, 58, 58, 109, 124, 124, 96, 101, 111, 109, 120, 101, 99, 98, 35, 116, 33, 125, 121, 101, 111, 103, 120, 101, 97, 105, 33, 120, 116, 63, 107, 36, 53, 53, 41, 44, 38, 36, 49, 44, 42, 43, 106, 61, 104, 55, 36, 50, 38, 38, 71, 86, 86, 74, 79, 69, 71, 82, 79, 73, 72, 9, 94, 11, 85, 69, 82, 67, 21, 19, 57, 40, 40, 52, 49, 59, 57, 44, 49, 55, 54, 119, 32, 117, 43, 45, 58, 42, 49, 40, AbstractJsonLexerKt.TC_INVALID, 107, 122, 119, 113, 2, 22, 7, 10, 12, 76, 2, 0, 80, 20, 0, 17, 28, 26, 90, 20, 22, 65, 5, 17, 0, 13, 11, 75, 1, 5, 7, 87, 72, 92, 77, 64, 70, 6, 76, 72, 74, 26, 4, 67, 70, 74, 6, 18, 3, 14, 8, 72, 1, 11, 6, 4, 27, 15, 30, 19, 21, 85, 29, 77, 75, 75, 87, 27, 22, 27, 13, 125, 105, 120, 117, 115, 51, 123, 43, 45, 45, 49, 113, 112, 125, 107, 31, 11, 26, 23, 17, 81, 19, 22, 31, 79, 71, 83, 66, 79, 73, 9, 75, 78, 75, 23, 45, 57, 40, 37, 35, 99, 33, 60, AbstractJsonLexerKt.TC_INVALID, 6, 18, 3, 14, 8, 72, 10, 23, 83, 6, 74, 11, 6, 19, 10, 54, 34, 51, 62, 56, 120, 58, 39, 50, 48, 25, 13, 28, 17, 23, 87, 21, 8, 29, 31, 85, 52, 73, 101, 113, 96, 109, 107, 43, 105, 116, 97, 99, 41, 72, 54, 35, 55, 38, 43, 45, 109, 45, 50, 55, 49, 81, 69, 84, 89, 95, 31, 66, 81, 71, 14, 26, 11, 6, 0, 64, 27, 29, 26, 10, 66, 7, 11, 91, 79, 94, 83, 85, 21, 76, 84, 94, 20, 94, 78, 73, 20, 0, 17, 28, 26, 90, 3, 27, 17, 91, 17, 1, 6, 91, 29, 17, 82, 70, 87, 90, 92, 28, 69, 93, 87, 29, 87, 71, 64, 29, 91, 87, 8, 67, 65, 92, 85, 90, 95, 86, 14, 95, 81, 65, 40, 60, 45, 32, 38, 102, 63, 39, 45, 103, 45, 61, 58, 103, 60, 33, 45, 114, 57, 59, 38, 47, 32, 37, 44, 116, 57, 123, 80, 68, 85, 88, 94, 30, 71, 94, 67, 83, 88, 66, 115, 103, 118, 123, 125, 61, 101, 115, 100, 34, 54, 39, 42, 44, 108, 59, 110, 37, 47, 34, 32, 49, 37, 52, 57, 63, AbstractJsonLexerKt.TC_INVALID, 40, 125, 39, 49, 38, 15, 24, 94, 95, 49, 38, 51, 97, 49, 38, 51, 99, 37, 35, 39, 112, 118, 126, 83, 85, 81, 7, 0, 8, 24, 20, 31, 30, 24, 43, 9, 30, 29, 18, 3, 101, 96, 98, 50, 76, 73, 75, 28, 14, 15, 9, 89, 81, 65, 70, 86, 70, 86, 81, 71, 10, 26, 29, 6, 17, 1, 6, 25, 106, 122, 125, 118, 17, 3, 20, 68, 28, 14, 25, 14, 2, 16, 14, 87, 107, 121, 103, 106, 27, 29, 85, 77, 104, 110, 32, 62, 96, 108, 100, 51, 53, 61, 1, 11, 6, 4, 53, 56, 43, 108, 117, 107, 126, 44, 48, 52, 56, 62, 60, 10, 14, 2, 4, 6, 76, 9, 19, 6, 4, 54, 51, 58, 106, 109, 104, 109, 49, 19, 23, 19, 27, 42, 7, 14, 27, 117, 104, 44, 121, 117, 104, 44, 121, 54, 112, 111, 106, 108, 89, 94, 90, 90, 112, 97, 124, 112, 80, 65, 92, 80, 11, 82, 80, 80, 109, 114, AbstractJsonLexerKt.TC_INVALID, 126, 116, 112, 111, 98, 99, 105, 41, 103, 112, 54, 55, 118, 105, 100, 101, 111, 47, 97, 118, 99, 93, 66, 79, 78, 68, 4, 79, 68, 71, 73, 82, 6, 93, 66, 88, 66, 68, 69, 25, 6, 11, 10, 0, 64, 7, 10, 25, 12, 75, 84, 89, 88, 82, 18, 80, 77, 9, 75, 16, 88, 78, 112, 111, 98, 99, 105, 41, 107, 118, 99, 97, 87, 72, 69, 68, 78, 14, 76, 81, 68, 70, 19, 8, 23, 26, 27, 17, 81, 9, 8, 29, 79, 46, 49, 60, 61, 55, 119, 32, 117, 46, 54, 60, 118, 55, 54, 106, 118, 46, 40, 96, 45, 50, 63, 62, 52, 116, 35, 118, 45, 53, 63, 
        117, 52, 53, 105, 117, 45, 43, 98, 119, 110, 115, 99, 104, 114, 102, 96, 32, 40, 37, 35, 99, 106, 108, 106, 34, 70, 64, 9, 89, 88, 90, 90};
    }

    static {
        A0B();
        A02 = new ArrayList<>();
        A03 = Pattern.compile(A06(0, 43, 29));
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00ad A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00b0 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b3 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00b5 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b8 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00bb A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00bc A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000e A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A00(String str) {
        char c11;
        switch (str.hashCode()) {
            case -2123537834:
                if (str.equals(A06(TTAdConstant.IMAGE_LIST_SIZE_CODE, 14, 62))) {
                    c11 = 2;
                }
                switch (c11) {
                    case 0:
                        return 5;
                    case 1:
                        return 6;
                    case 2:
                        return 18;
                    case 3:
                        return 17;
                    case 4:
                        return 7;
                    case 5:
                        return 8;
                    case 6:
                        return 14;
                    default:
                        return 0;
                }
            case -1095064472:
                if (str.equals(A06(576, 13, 45))) {
                    c11 = 4;
                }
                switch (c11) {
                }
            case 187078296:
                if (str.equals(A06(382, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 187078297:
                if (str.equals(A06(391, 9, 98))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 1504578661:
                if (str.equals(A06(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 10, 115))) {
                    c11 = 1;
                }
                switch (c11) {
                }
            case 1505942594:
                String strA06 = A06(589, 16, 98);
                String[] strArr = A01;
                if (strArr[4].length() == strArr[7].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A01;
                strArr2[3] = "Sf1cPlfJE5c2Q1J3x93mu";
                strArr2[0] = "2jpk7ugrLSfGS8LACHw9p";
                if (str.equals(strA06)) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case 1556697186:
                if (str.equals(A06(563, 13, 120))) {
                    c11 = 6;
                }
                switch (c11) {
                }
        }
        c11 = 65535;
        switch (c11) {
        }
    }

    public static int A01(String str) {
        if (TextUtils.isEmpty(str)) {
            return -1;
        }
        if (A0C(str)) {
            return 1;
        }
        if (A0F(str)) {
            return 2;
        }
        if (A0E(str)) {
            return 3;
        }
        if (A0D(str)) {
            return 4;
        }
        if (A06(108, 15, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE).equals(str) || A06(Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 18, 17).equals(str) || A06(337, 20, 49).equals(str)) {
            return 5;
        }
        if (A06(176, 27, 104).equals(str)) {
            return 6;
        }
        return A02(str);
    }

    public static int A02(String str) {
        int customMimeTypeCount = A02.size();
        if (0 < customMimeTypeCount) {
            A02.get(0);
            throw new NullPointerException(A06(837, 8, 105));
        }
        return -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00d1 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00d4 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00d5 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00d6 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00d9 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00dc A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00dd A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0011 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A03(String str, String str2) {
        char c11;
        L7 objectType;
        switch (str.hashCode()) {
            case -2123537834:
                if (str.equals(A06(TTAdConstant.IMAGE_LIST_SIZE_CODE, 14, 62))) {
                    c11 = 4;
                }
                switch (c11) {
                    case 0:
                        String[] strArr = A01;
                        if (strArr[4].length() != strArr[7].length()) {
                            String[] strArr2 = A01;
                            strArr2[4] = "eY3eBmxup9dOoHVo6QFsFhi4Q5X";
                            strArr2[7] = "hwZO4wrHydQX87I5KpB0i0PunCMWc7";
                            return 9;
                        }
                        return 9;
                    case 1:
                        if (str2 == null || (objectType = A04(str2)) == null) {
                            return 0;
                        }
                        return objectType.A00();
                    case 2:
                        return 5;
                    case 3:
                        return 6;
                    case 4:
                        return 18;
                    case 5:
                        return 17;
                    case 6:
                        return 7;
                    case 7:
                        return 8;
                    case '\b':
                        return 14;
                    default:
                        return 0;
                }
            case -1095064472:
                String[] strArr3 = A01;
                if (strArr3[1].length() == strArr3[2].length()) {
                    throw new RuntimeException();
                }
                A01[5] = "XfeyPSYT22wI";
                if (str.equals(A06(576, 13, 45))) {
                    c11 = 6;
                }
                switch (c11) {
                }
            case -53558318:
                if (str.equals(A06(493, 15, 112))) {
                    c11 = 1;
                }
                switch (c11) {
                }
            case 187078296:
                if (str.equals(A06(382, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE))) {
                    c11 = 2;
                }
                switch (c11) {
                }
            case 187078297:
                if (str.equals(A06(391, 9, 98))) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case 1504578661:
                if (str.equals(A06(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 10, 115))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 1504831518:
                if (str.equals(A06(508, 10, 64))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 1505942594:
                if (str.equals(A06(589, 16, 98))) {
                    c11 = 7;
                }
                switch (c11) {
                }
            case 1556697186:
                if (str.equals(A06(563, 13, 120))) {
                    c11 = '\b';
                }
                switch (c11) {
                }
        }
        c11 = 65535;
        switch (c11) {
        }
    }

    public static String A05(int i5) {
        switch (i5) {
            case 32:
                return A06(926, 13, 42);
            case 33:
                return A06(889, 9, 23);
            case 35:
                return A06(916, 10, 120);
            case 64:
            case 102:
            case 103:
            case 104:
                return A06(493, 15, 112);
            case ads_mobile_sdk.pd.A0 /* 96 */:
            case ads_mobile_sdk.pd.H0 /* 97 */:
            case ads_mobile_sdk.pd.Q0 /* 98 */:
            case ads_mobile_sdk.pd.R0 /* 99 */:
            case 100:
            case 101:
                String[] strArr = A01;
                if (strArr[4].length() != strArr[7].length()) {
                    String[] strArr2 = A01;
                    strArr2[3] = "LCbKix87SzKcoSBSZWqCz";
                    strArr2[0] = "3ttbU07808CCVPTdtk2R4";
                    return A06(949, 11, 54);
                }
                String[] strArr3 = A01;
                strArr3[3] = "M3sQ8KyfmqZQHEmxjPGDN";
                strArr3[0] = "0hEddkjVzZCjW4rfvbBtt";
                return A06(949, 11, 12);
            case 105:
            case 107:
                String[] strArr4 = A01;
                if (strArr4[3].length() != strArr4[0].length()) {
                    throw new RuntimeException();
                }
                String[] strArr5 = A01;
                strArr5[3] = "B0QBz88rqLzYWNygzkLMX";
                strArr5[0] = "9VWXOakvbi7XiKmY7mlUt";
                return A06(508, 10, 64);
            case 106:
                return A06(939, 10, 17);
            case 108:
                return A06(819, 10, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
            case 163:
                return A06(960, 10, 105);
            case 165:
                return A06(382, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
            case 166:
                return A06(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 10, 115);
            case 169:
            case 172:
                return A06(576, 13, 45);
            case 170:
            case 171:
                return A06(589, 16, 98);
            case TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173 /* 173 */:
                return A06(544, 10, 85);
            case 174:
                return A06(391, 9, 98);
            case 177:
                String[] strArr6 = A01;
                if (strArr6[3].length() != strArr6[0].length()) {
                    throw new RuntimeException();
                }
                A01[5] = "5Qc";
                return A06(989, 19, 76);
            default:
                return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x02c9, code lost:
    
        if (r3.startsWith(A06(47, 4, 14)) != false) goto L104;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x02d8, code lost:
    
        if (r3.startsWith(A06(744, 4, 63)) == false) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x02e4, code lost:
    
        return A06(391, 9, 98);
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x02f2, code lost:
    
        if (r3.startsWith(A06(752, 4, 34)) == false) goto L110;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x02fe, code lost:
    
        return A06(576, 13, 45);
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x030c, code lost:
    
        if (r3.startsWith(A06(756, 4, 53)) == false) goto L114;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x0318, code lost:
    
        return A06(605, 28, 36);
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x0326, code lost:
    
        if (r3.startsWith(A06(760, 4, com.vungle.ads.internal.protos.Sdk.SDKError.Reason.TPAT_ERROR_VALUE)) != false) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x0328, code lost:
    
        r4 = A06(764, 4, 98);
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x033c, code lost:
    
        if (com.facebook.ads.redexgen.X.L8.A01[5].length() == 24) goto L166;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x033e, code lost:
    
        com.facebook.ads.redexgen.X.L8.A01[5] = "ZzQ5FlcoVEujuGTwVJIJwXLiZ7T";
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x0349, code lost:
    
        if (r3.startsWith(r4) == false) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x034b, code lost:
    
        r2 = com.facebook.ads.redexgen.X.L8.A01;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x0361, code lost:
    
        if (r2[4].length() == r2[7].length()) goto L124;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x0363, code lost:
    
        com.facebook.ads.redexgen.X.L8.A01[5] = "BKYZ1k7dxzd7aGCBjwQbt";
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x036e, code lost:
    
        return A06(589, 16, 98);
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x0374, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x0382, code lost:
    
        if (r3.startsWith(A06(768, 4, 25)) == false) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:129:0x038e, code lost:
    
        return A06(633, 28, 94);
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x039c, code lost:
    
        if (r3.startsWith(A06(854, 4, 8)) == false) goto L134;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x03a8, code lost:
    
        return A06(544, 10, 85);
     */
    /* JADX WARN: Code restructure failed: missing block: B:135:0x03b6, code lost:
    
        if (r3.startsWith(A06(1008, 6, 22)) == false) goto L138;
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x03c2, code lost:
    
        return A06(661, 12, 38);
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x03d0, code lost:
    
        if (r3.startsWith(A06(802, 4, 112)) == false) goto L142;
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x03dc, code lost:
    
        return A06(424, 10, 112);
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x03ea, code lost:
    
        if (r3.startsWith(A06(858, 4, 61)) == false) goto L146;
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x03f6, code lost:
    
        return A06(com.vungle.ads.internal.protos.Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 20, 59);
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x0404, code lost:
    
        if (r3.startsWith(A06(1028, 4, 57)) == false) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:149:0x0414, code lost:
    
        if (com.facebook.ads.redexgen.X.L8.A01[6].charAt(2) == 'u') goto L152;
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x0416, code lost:
    
        com.facebook.ads.redexgen.X.L8.A01[5] = "mPB1XR6AUS767usBTRbHStbC5kPY";
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x0424, code lost:
    
        return A06(866, 3, 19);
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x0425, code lost:
    
        r2 = com.facebook.ads.redexgen.X.L8.A01;
        r2[4] = "5mZwtWm4YShUr67lcQDSFt4704s";
        r2[7] = "VeyvGObawMeK3aS0g0WKjsEE6tCgX8";
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x0439, code lost:
    
        return A06(866, 8, 51);
     */
    /* JADX WARN: Code restructure failed: missing block: B:155:0x0447, code lost:
    
        if (r3.contains(A06(723, 6, 39)) == false) goto L158;
     */
    /* JADX WARN: Code restructure failed: missing block: B:157:0x0453, code lost:
    
        return A06(70, 19, 50);
     */
    /* JADX WARN: Code restructure failed: missing block: B:159:0x0461, code lost:
    
        if (r3.contains(A06(796, 6, 18)) != false) goto L162;
     */
    /* JADX WARN: Code restructure failed: missing block: B:161:0x0470, code lost:
    
        if (r3.contains(A06(717, 6, 81)) == false) goto L164;
     */
    /* JADX WARN: Code restructure failed: missing block: B:163:0x047c, code lost:
    
        return A06(51, 19, 94);
     */
    /* JADX WARN: Code restructure failed: missing block: B:165:0x0481, code lost:
    
        return A09(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:168:?, code lost:
    
        return r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:169:?, code lost:
    
        return A06(493, 15, 112);
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0171, code lost:
    
        if (r4 != false) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0173, code lost:
    
        r4 = null;
        r0 = A06(849, 5, 15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0181, code lost:
    
        if (r3.startsWith(r0) == false) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0183, code lost:
    
        r0 = A04(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0187, code lost:
    
        if (r0 == null) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0189, code lost:
    
        r4 = A05(r0.A01);
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x018f, code lost:
    
        if (r4 != null) goto L168;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0191, code lost:
    
        r2 = com.facebook.ads.redexgen.X.L8.A01;
        r1 = r2[4];
        r0 = r2[7];
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x01a3, code lost:
    
        if (r1.length() == r0.length()) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x01a5, code lost:
    
        r2 = com.facebook.ads.redexgen.X.L8.A01;
        r2[3] = "l7tGEfnzmmllIHSGPPfQu";
        r2[0] = "WIV4TqNKdAQoUFWvKNwIa";
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x01b9, code lost:
    
        return A06(493, 15, 112);
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x01c3, code lost:
    
        if (r4 != false) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x01c6, code lost:
    
        r4 = A06(829, 4, 76);
        r2 = com.facebook.ads.redexgen.X.L8.A01;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x01df, code lost:
    
        if (r2[1].length() == r2[2].length()) goto L166;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x01e1, code lost:
    
        r2 = com.facebook.ads.redexgen.X.L8.A01;
        r2[3] = "Og3Gw9hequS8vGBl4S8yb";
        r2[0] = "xskopta6QO33EgTkdSwZM";
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x01f1, code lost:
    
        if (r3.startsWith(r4) == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0204, code lost:
    
        if (com.facebook.ads.redexgen.X.L8.A01[5].length() == 24) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0206, code lost:
    
        com.facebook.ads.redexgen.X.L8.A01[6] = "pVuuV34hmQL6nK5O10oIs4bY93WikDB2";
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0211, code lost:
    
        return A06(464, 10, 105);
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0216, code lost:
    
        return A06(464, 10, 105);
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x0224, code lost:
    
        if (r3.startsWith(A06(833, 4, 23)) == false) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0226, code lost:
    
        r2 = com.facebook.ads.redexgen.X.L8.A01;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0238, code lost:
    
        if (r2[1].length() == r2[2].length()) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x023a, code lost:
    
        com.facebook.ads.redexgen.X.L8.A01[5] = "W06z2xHNvcJuo8mpHHEEpqY21YYtV2";
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x0249, code lost:
    
        return A06(474, 10, 49);
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x024f, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x025d, code lost:
    
        if (r3.startsWith(A06(43, 4, 16)) != false) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x026c, code lost:
    
        if (r3.startsWith(A06(740, 4, 22)) == false) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0278, code lost:
    
        return A06(382, 9, com.vungle.ads.internal.protos.Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x0286, code lost:
    
        if (r3.startsWith(A06(792, 4, 26)) != false) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0295, code lost:
    
        if (r3.startsWith(A06(748, 4, com.vungle.ads.internal.protos.Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE)) == false) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x02a1, code lost:
    
        return A06(com.vungle.ads.internal.protos.Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 10, 115);
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x02af, code lost:
    
        if (r3.startsWith(A06(788, 4, 105)) == false) goto L100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x02bb, code lost:
    
        return A06(com.bytedance.sdk.openadsdk.TTAdConstant.IMAGE_LIST_SIZE_CODE, 14, 62);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String A07(String str) {
        if (str == null) {
            return null;
        }
        String strA01 = XC.A01(str.trim());
        if (strA01.startsWith(A06(709, 4, 71)) || strA01.startsWith(A06(713, 4, 71))) {
            return A06(889, 9, 23);
        }
        if (strA01.startsWith(A06(806, 4, 74)) || strA01.startsWith(A06(810, 4, 10))) {
            return A06(916, 10, 120);
        }
        if (strA01.startsWith(A06(776, 4, 111)) || strA01.startsWith(A06(772, 4, 98)) || strA01.startsWith(A06(784, 4, 24)) || strA01.startsWith(A06(780, 4, 113))) {
            String strA06 = A06(898, 18, 60);
            String[] strArr = A01;
            if (strArr[4].length() != strArr[7].length()) {
                A01[6] = "rduAa0bZmue7xqDnaI7CBLL9U2es2RHi";
                return strA06;
            }
        } else {
            if (strA01.startsWith(A06(705, 4, Sdk.SDKError.Reason.TPAT_ERROR_VALUE))) {
                String[] strArr2 = A01;
                if (strArr2[4].length() != strArr2[7].length()) {
                    A01[6] = "iJuSvnq5Q8fFbPpbjgmzF0ggsmKDlumj";
                    return A06(879, 10, 17);
                }
                return A06(879, 10, 17);
            }
            if (strA01.startsWith(A06(1025, 3, 39)) || strA01.startsWith(A06(1018, 4, 68))) {
                return A06(989, 19, 76);
            }
            if (strA01.startsWith(A06(1022, 3, 13)) || strA01.startsWith(A06(1014, 4, 7))) {
                return A06(970, 19, 79);
            }
            boolean zStartsWith = strA01.startsWith(A06(845, 4, 15));
            if (A01[5].length() != 24) {
                String[] strArr3 = A01;
                strArr3[3] = "jgJyL6ueamly0URrrAo0y";
                strArr3[0] = "VAqeIpotsqVQ3TK7XV68g";
            }
        }
        throw new RuntimeException();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0007  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String A08(String str) {
        char c11;
        switch (str.hashCode()) {
            case -1007807498:
                if (!str.equals(A06(682, 12, 84))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case -586683234:
                if (str.equals(A06(694, 11, 71))) {
                    c11 = 2;
                    break;
                }
                break;
            case 187090231:
                if (str.equals(A06(484, 9, 91))) {
                    c11 = 1;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                return A06(424, 10, 112);
            case 1:
                String strA06 = A06(508, 10, 64);
                String[] strArr = A01;
                if (strArr[3].length() != strArr[0].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A01;
                strArr2[4] = "gk4oipsXED0NFT32IYp6gjMWT0s";
                strArr2[7] = "2XGwQ2qtdRBiFQDuMOl422X5BWjZVf";
                return strA06;
            case 2:
                return A06(673, 9, 5);
            default:
                return str;
        }
    }

    public static String A09(String str) {
        int customMimeTypeCount = A02.size();
        if (0 < customMimeTypeCount) {
            A02.get(0);
            throw new NullPointerException(A06(729, 11, 108));
        }
        return null;
    }

    public static String A0A(String str) {
        int indexOfSlash;
        if (str == null || (indexOfSlash = str.indexOf(47)) == -1) {
            return null;
        }
        return str.substring(0, indexOfSlash);
    }

    public static boolean A0C(String str) {
        return A06(377, 5, 9).equals(A0A(str));
    }

    public static boolean A0D(String str) {
        return A06(814, 5, 78).equals(A0A(str)) || A06(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 23, 33).equals(str);
    }

    public static boolean A0E(String str) {
        return A06(862, 4, 19).equals(A0A(str)) || A06(51, 19, 94).equals(str) || A06(70, 19, 50).equals(str) || A06(244, 25, 95).equals(str) || A06(357, 20, 79).equals(str) || A06(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 20, 59).equals(str) || A06(290, 28, 27).equals(str) || A06(269, 21, 89).equals(str) || A06(Sdk.SDKError.Reason.AD_CLOSED_MISSING_HEARTBEAT_VALUE, 19, 82).equals(str) || A06(158, 18, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE).equals(str) || A06(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 15, 93).equals(str) || A06(89, 19, 106).equals(str);
    }

    public static boolean A0F(String str) {
        return A06(874, 5, 12).equals(A0A(str));
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x011e, code lost:
    
        if (r3 == null) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x0120, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0128, code lost:
    
        if (r3 == null) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x012b, code lost:
    
        r1 = r3.A00();
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x012f, code lost:
    
        if (r1 == 0) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0133, code lost:
    
        if (r1 == 16) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0135, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:?, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:?, code lost:
    
        return false;
     */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0137 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x000c  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0010 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0G(String str, String str2) {
        char c11;
        if (str == null) {
            return false;
        }
        switch (str.hashCode()) {
            case -2123537834:
                c11 = str.equals(A06(TTAdConstant.IMAGE_LIST_SIZE_CODE, 14, 62)) ? '\t' : (char) 65535;
                switch (c11) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case '\b':
                    case '\t':
                        return true;
                    case '\n':
                        if (str2 == null) {
                            return false;
                        }
                        L7 l7A04 = A04(str2);
                        String[] strArr = A01;
                        if (strArr[1].length() != strArr[2].length()) {
                            String[] strArr2 = A01;
                            strArr2[3] = "l88CwbmjDr1ABfYrfLQTO";
                            strArr2[0] = "A5IuhjaHamDHKZWuKtxPl";
                            break;
                        } else {
                            A01[5] = b.f42142b;
                            break;
                        }
                    default:
                        return false;
                }
            case -432837260:
                if (str.equals(A06(518, 13, 111))) {
                    c11 = 1;
                }
                switch (c11) {
                }
            case -432837259:
                if (str.equals(A06(531, 13, 19))) {
                    c11 = 2;
                }
                switch (c11) {
                }
            case -53558318:
                if (str.equals(A06(493, 15, 112))) {
                    c11 = '\n';
                }
                switch (c11) {
                }
            case 187078296:
                if (str.equals(A06(382, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE))) {
                    c11 = 7;
                }
                switch (c11) {
                }
            case 187094639:
                if (str.equals(A06(554, 9, 39))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 1504578661:
                if (str.equals(A06(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 10, 115))) {
                    c11 = '\b';
                }
                switch (c11) {
                }
            case 1504619009:
                if (str.equals(A06(424, 10, 112))) {
                    c11 = 6;
                }
                switch (c11) {
                }
            case 1504831518:
                String[] strArr3 = A01;
                if (strArr3[1].length() == strArr3[2].length()) {
                    throw new RuntimeException();
                }
                A01[5] = "K2nJl";
                if (str.equals(A06(508, 10, 64))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 1903231877:
                if (str.equals(A06(434, 15, 109))) {
                    c11 = 4;
                }
                switch (c11) {
                }
            case 1903589369:
                if (str.equals(A06(449, 15, 11))) {
                    c11 = 5;
                }
                switch (c11) {
                }
        }
    }
}
