package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public abstract class KZ {
    public static byte[] A00;
    public static String[] A01 = {"s6eTro15lWrN1uwL9pj87lgTuT3iC4YK", "XX9eU2AJVRzM", "gr", b.f42142b, "IUBUZJHVJQeexMrIgEQcCiuR", "uiFudZs8Y5L4yhfTVQYhHqlK6DH37w4j", "bekYEYJJqeC1t0voGZZnbm21vK", "FDTR9M8InciSn5tgRX8Gvy5gWEysByuu"};

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 105);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{76, 3, 3, 1, 68, 11, 9, 89, 69, 10, 8, 95, 88, 23, 18, 2, 5, 90, 21, 25, 6, 71, 8, 31, 0, 71, 10, 4, 15, 0, 75, 77, 29, 47, 103, 109, 96, 98, 100, 44, 38, 60, 116, 48, 42, 63, 61, 111, 43, 49, 38, 59, 120, 39, 101, 108, 47, 118, 101, 38, 34, 47, 101, 38, 34, 47, 34, 66, 1, 7, 84, 23, 10, 73, 105, 42, 55, 115, 112, 51, 46, 59, 57, 62, 125, 96, 119, 84, 21, 29, 120, 57, 38, 35, 37, 20, 74, 73, 112, 45, 51, 56, 56, 98, 101, 47, 119, 117, 117, 51, 106, 124, 107, 27, 66, 84, 67, 80, 103, 62, 44, 43, 36, 51, 106, 120, AbstractJsonLexerKt.TC_INVALID, 107, 105, 105, 122, 86, 87, 77, 92, 87, 77, 20, 109, 64, 73, 92, 65, 80, 80, 76, 73, 67, 65, 84, 73, 79, 78, 15, 77, 80, 20, 121, 104, 104, 116, 113, 123, 121, 108, 113, 119, 118, 55, 111, 125, 122, 117, 24, 12, 29, 16, 22, 86, 74, 30, 9, 9, 79, 91, 74, 71, 65, 1, 79, 77, 29, 2, 22, 7, 10, 12, 76, 2, 0, 87, 37, 49, 32, 45, 43, 107, 37, 41, 54, 1, 21, 4, 9, 15, 79, 1, 13, 18, 77, 23, 2, 117, 97, 112, 125, 123, 59, 113, 117, 119, 39, 82, 70, 87, 90, 92, 28, 86, 82, 80, 0, 30, 89, 92, 80, 94, 74, 91, 86, 80, 16, 89, 83, 94, 92, 53, 33, 48, 61, 59, 123, 57, 61, 48, 61, 73, 93, 76, 65, 71, 7, 69, 88, 28, 63, 43, 58, 55, 49, 113, 51, 46, 59, 57, 78, 90, 75, 70, 64, 0, 64, 72, 72, 82, 70, 87, 90, 92, 28, 68, 82, 69, 45, 57, 40, 37, 35, 99, 59, 41, 46, 33, 99, 119, 102, 107, 109, 45, 122, 47, 111, 99, 118, 112, 109, 113, 105, 99, 98, 102, 106, 108, 110, 36, 97, 123, 110, 108, 52, 37, 56, 52, 111, 54, 52, 52, 18, 13, 0, 1, 11, 75, 9, 20, 86, 20, 3, 28, 17, 16, 26, 90, 24, 5, 71, 1, 95, 64, 77, 76, 70, 6, 68, 89, 29, 24, 7, 10, 11, 1, 65, 25, 11, 12, 3, 16, 15, 2, 3, 9, 73, 30, 75, 0, 10, 16, 103, 120, 117, 116, 126, 62, 105, 60, 124, 112, 101, 99, 126, 98, 122, 112, 23, 8, 5, 4, 14, 78, 25, 76, 12, 18, 23, 8, 5, 4, 14};
    }

    static {
        A04();
    }

    /* JADX WARN: Code restructure failed: missing block: B:129:0x0309, code lost:
    
        if (r3.endsWith(r0) != false) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x030b, code lost:
    
        r0 = com.facebook.ads.redexgen.X.KZ.A01[1];
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x0318, code lost:
    
        if (r0.length() == 12) goto L136;
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x031a, code lost:
    
        return 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x032a, code lost:
    
        if (r3.endsWith(r0) != false) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x032d, code lost:
    
        com.facebook.ads.redexgen.X.KZ.A01[0] = "E7RMZLn66ke6VSQIEg1xZdRPIAAfyJIg";
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x0334, code lost:
    
        return 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x0335, code lost:
    
        return -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A00(Uri uri) {
        String lastPathSegment = uri.getLastPathSegment();
        if (lastPathSegment == null) {
            return -1;
        }
        String filename = A03(4, 4, 3);
        if (lastPathSegment.endsWith(filename)) {
            return 0;
        }
        String filename2 = A03(29, 4, 71);
        if (lastPathSegment.endsWith(filename2)) {
            return 0;
        }
        String filename3 = A03(8, 4, 2);
        if (lastPathSegment.endsWith(filename3)) {
            return 1;
        }
        String filename4 = A03(12, 5, 31);
        if (lastPathSegment.endsWith(filename4)) {
            return 2;
        }
        String filename5 = A03(0, 4, 11);
        if (lastPathSegment.endsWith(filename5)) {
            return 2;
        }
        String strA03 = A03(17, 4, 29);
        String filename6 = A01[3];
        if (filename6.length() != 0) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[7] = "xI5M9bpTsbTWSJ0rPCkq0lr7ysVqUfEG";
        strArr[6] = "CXZe1aFOYq1w5Z4SuR1WBMhmxR";
        if (lastPathSegment.endsWith(strA03)) {
            return 3;
        }
        String filename7 = A03(33, 5, 104);
        if (lastPathSegment.endsWith(filename7)) {
            return 4;
        }
        String filename8 = A03(38, 4, 35);
        if (lastPathSegment.endsWith(filename8)) {
            return 5;
        }
        String filename9 = A03(58, 4, 34);
        if (!lastPathSegment.endsWith(filename9)) {
            String filename10 = A03(62, 5, 34);
            if (!lastPathSegment.endsWith(filename10)) {
                String filename11 = A03(98, 4, 55);
                if (lastPathSegment.endsWith(filename11)) {
                    return 15;
                }
                int length = lastPathSegment.length();
                String strA032 = A03(67, 3, 5);
                if (lastPathSegment.startsWith(strA032, length - (strA032.length() + 1))) {
                    return 6;
                }
                String filename12 = A01[3];
                if (filename12.length() != 0) {
                    A01[3] = b.f42142b;
                    String filename13 = A03(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 5, 14);
                    if (lastPathSegment.endsWith(filename13)) {
                        return 6;
                    }
                } else {
                    A01[0] = "IpBtrOXgORKrtS1Q9noud7f6FPn65BvT";
                    String filename14 = A03(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 5, 32);
                    if (lastPathSegment.endsWith(filename14)) {
                        return 6;
                    }
                }
                String filename15 = A03(70, 4, 19);
                if (lastPathSegment.endsWith(filename15)) {
                    return 7;
                }
                String strA033 = A03(74, 4, 46);
                if (!lastPathSegment.endsWith(strA033)) {
                    int length2 = lastPathSegment.length();
                    String strA034 = A03(55, 3, 43);
                    if (!lastPathSegment.startsWith(strA034, length2 - (strA034.length() + 1)) && !lastPathSegment.startsWith(strA033, lastPathSegment.length() - (strA033.length() + 1))) {
                        int length3 = lastPathSegment.length();
                        String strA035 = A03(25, 4, 0);
                        if (lastPathSegment.startsWith(strA035, length3 - (strA035.length() + 1))) {
                            return 8;
                        }
                        int length4 = lastPathSegment.length();
                        String strA036 = A03(87, 3, 19);
                        if (!lastPathSegment.startsWith(strA036, length4 - (strA036.length() + 1))) {
                            String filename16 = A03(90, 5, 63);
                            if (lastPathSegment.endsWith(filename16)) {
                                return 9;
                            }
                            if (A01[5].charAt(26) != 'H') {
                                throw new RuntimeException();
                            }
                            A01[1] = "PzUdmZZGb15Y";
                            String filename17 = A03(95, 3, 83);
                            if (!lastPathSegment.endsWith(filename17)) {
                                String filename18 = A03(78, 5, 55);
                                if (!lastPathSegment.endsWith(filename18)) {
                                    String filename19 = A03(83, 4, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
                                    if (!lastPathSegment.endsWith(filename19)) {
                                        String filename20 = A03(51, 4, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
                                        boolean zEndsWith = lastPathSegment.endsWith(filename20);
                                        String filename21 = A01[2];
                                        if (filename21.length() != 8) {
                                            A01[5] = "Pn5CkeEF9ijsKljVOcEdwwjxENHLDids";
                                            if (zEndsWith) {
                                                return 10;
                                            }
                                        } else {
                                            A01[4] = "GbsEyRR";
                                            if (zEndsWith) {
                                                return 10;
                                            }
                                        }
                                        String strA037 = A03(102, 3, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                                        if (lastPathSegment.endsWith(strA037) || lastPathSegment.startsWith(strA037, lastPathSegment.length() - (strA037.length() + 1))) {
                                            return 11;
                                        }
                                        String filename22 = A03(109, 4, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
                                        if (lastPathSegment.endsWith(filename22)) {
                                            return 12;
                                        }
                                        String filename23 = A03(113, 5, 92);
                                        if (lastPathSegment.endsWith(filename23)) {
                                            return 12;
                                        }
                                        String filename24 = A01[3];
                                        if (filename24.length() != 0) {
                                            throw new RuntimeException();
                                        }
                                        A01[5] = "jy7bwX1UjSqn9k51GQSiFKNJBVH4HXO0";
                                        String filename25 = A03(105, 4, 104);
                                        if (lastPathSegment.endsWith(filename25)) {
                                            return 13;
                                        }
                                        String filename26 = A03(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 7, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
                                        if (lastPathSegment.endsWith(filename26)) {
                                            return 13;
                                        }
                                        String filename27 = A03(47, 4, 40);
                                        if (!lastPathSegment.endsWith(filename27)) {
                                            String filename28 = A03(42, 5, 51);
                                            if (!lastPathSegment.endsWith(filename28)) {
                                                if (A01[0].charAt(4) != 'U') {
                                                    A01[3] = b.f42142b;
                                                    String filename29 = A03(21, 4, 0);
                                                } else {
                                                    A01[1] = "JZ4c4hnzbE8m";
                                                    String filename30 = A03(21, 4, 0);
                                                }
                                            }
                                        }
                                        String filename31 = A01[4];
                                        if (filename31.length() != 32) {
                                            A01[5] = "AZMuIKJEqriYvKSIMUTua21yPmHzHQyu";
                                            return 14;
                                        }
                                        A01[5] = "UWSAozgPeSeqzfGGNaDrRbjsGUH9UPV3";
                                        return 14;
                                    }
                                    return 10;
                                }
                                return 10;
                            }
                            return 10;
                        }
                        return 9;
                    }
                    return 8;
                }
                return 8;
            }
            return 15;
        }
        return 15;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:100:0x0264 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0265 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0266 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:103:0x0267 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0268 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0269 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:106:0x026a A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:107:0x026b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:108:0x026c A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:109:0x026d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:110:0x026e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x025f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0260 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0261 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0262 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0263 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:9:0x002d A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A01(String str) {
        char c11;
        if (str == null) {
            return -1;
        }
        String strA08 = L8.A08(str);
        switch (strA08.hashCode()) {
            case -2123537834:
                c11 = strA08.equals(A03(232, 14, 90)) ? (char) 2 : (char) 65535;
                switch (c11) {
                    case 0:
                    case 1:
                    case 2:
                        return 0;
                    case 3:
                        return 1;
                    case 4:
                    case 5:
                    case 6:
                        return 3;
                    case 7:
                        return 4;
                    case '\b':
                        return 5;
                    case '\t':
                        return 15;
                    case '\n':
                    case 11:
                    case '\f':
                    case '\r':
                    case 14:
                        return 6;
                    case 15:
                        return 7;
                    case 16:
                    case 17:
                    case 18:
                        return 8;
                    case 19:
                        return 9;
                    case 20:
                        return 10;
                    case 21:
                        return 11;
                    case 22:
                        return 12;
                    case 23:
                        return 13;
                    case 24:
                        return 14;
                    case 25:
                        return 16;
                    default:
                        return -1;
                }
            case -1662384011:
                if (strA08.equals(A03(347, 10, 13))) {
                    c11 = 20;
                }
                switch (c11) {
                }
            case -1662384007:
                if (strA08.equals(A03(357, 10, 28))) {
                    c11 = 21;
                }
                switch (c11) {
                }
            case -1662095187:
                if (strA08.equals(A03(376, 10, 7))) {
                    c11 = '\f';
                }
                switch (c11) {
                }
            case -1606874997:
                if (strA08.equals(A03(Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 12, 9))) {
                    c11 = 6;
                }
                switch (c11) {
                }
            case -1487394660:
                if (strA08.equals(A03(329, 10, 98))) {
                    c11 = 24;
                }
                switch (c11) {
                }
            case -1248337486:
                if (strA08.equals(A03(142, 15, 73))) {
                    c11 = 18;
                }
                switch (c11) {
                }
            case -1079884372:
                if (strA08.equals(A03(TTAdConstant.VIDEO_INFO_CODE, 15, 8))) {
                    c11 = 25;
                }
                switch (c11) {
                }
            case -1004728940:
                if (strA08.equals(A03(339, 8, 41))) {
                    c11 = 23;
                }
                switch (c11) {
                }
            case -387023398:
                if (strA08.equals(A03(Sdk.SDKError.Reason.EVALUATE_JAVASCRIPT_FAILED_VALUE, 16, 107))) {
                    c11 = 11;
                }
                switch (c11) {
                }
            case -43467528:
                if (strA08.equals(A03(157, 16, 113))) {
                    c11 = 14;
                }
                switch (c11) {
                }
            case 13915911:
                if (strA08.equals(A03(386, 11, 15))) {
                    c11 = '\b';
                }
                switch (c11) {
                }
            case 187078296:
                if (strA08.equals(A03(183, 9, 71))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 187078297:
                if (strA08.equals(A03(192, 9, 10))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 187078669:
                if (strA08.equals(A03(201, 9, 45))) {
                    c11 = 4;
                }
                switch (c11) {
                }
            case 187090232:
                if (strA08.equals(A03(266, 9, 65))) {
                    c11 = 17;
                }
                switch (c11) {
                }
            case 187091926:
                if (strA08.equals(A03(285, 9, 70))) {
                    c11 = 19;
                }
                switch (c11) {
                }
            case 187099443:
                if (A01[1].length() == 12) {
                    A01[4] = "zNl9ZFpVGGRdWsfZpbNDAWtJWS";
                    if (strA08.equals(A03(294, 9, 90))) {
                        c11 = 22;
                    }
                    switch (c11) {
                    }
                }
                throw new RuntimeException();
            case 1331848029:
                if (strA08.equals(A03(367, 9, 64))) {
                    c11 = 16;
                }
                switch (c11) {
                }
            case 1503095341:
                if (strA08.equals(A03(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 10, 16))) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case 1504578661:
                if (strA08.equals(A03(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 10, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE))) {
                    c11 = 1;
                }
                switch (c11) {
                }
            case 1504619009:
                if (strA08.equals(A03(246, 10, 86))) {
                    c11 = 7;
                }
                switch (c11) {
                }
            case 1504824762:
                if (strA08.equals(A03(256, 10, 61))) {
                    c11 = '\t';
                }
                switch (c11) {
                }
            case 1504831518:
                if (strA08.equals(A03(275, 10, 55))) {
                    c11 = 15;
                }
                switch (c11) {
                }
            case 1505118770:
                String mimeType = A01[5];
                if (mimeType.charAt(26) == 'H') {
                    String[] strArr = A01;
                    strArr[7] = "18Z7OWu1Tdjk8pk5DTLNBtgQX4y5SFuj";
                    strArr[6] = "Qik5fixk7vrf2ukv3Oc14NkLxv";
                    if (strA08.equals(A03(303, 10, 37))) {
                        c11 = '\r';
                    }
                    switch (c11) {
                    }
                }
                throw new RuntimeException();
            case 2039520277:
                if (strA08.equals(A03(397, 16, 120))) {
                    c11 = '\n';
                }
                switch (c11) {
                }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A02(Map<String, List<String>> map) {
        String str;
        List<String> list = map.get(A03(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 12, 80));
        if (list != null) {
            boolean zIsEmpty = list.isEmpty();
            if (A01[4].length() == 32) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[7] = "aBewb2LwdntVE2AO0KZR5d9pKl1zOJ9e";
            strArr[6] = "SS0Pz8KqxdU2SurOTojBbcidCl";
            str = zIsEmpty ? null : list.get(0);
        }
        return A01(str);
    }
}
