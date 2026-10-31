package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.bu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1531bu {
    public static byte[] A0B;
    public static String[] A0C = {"bI1FkpMS8ttx5Qc2z7PNdYbYq1lskw3h", "emEZoHxrdf91xYO63rMPobMcQBLiEU8Z", "uwo9FflM3qvjW75MAdaO8QgjgIRMQo81", "hISMqAD33mCcON02hUOctCPVUh6WSNoh", "0Ehzq8AJjNf7V22kE1xcmNZ1dJe4b4WB", "zA", "6cqGC", "t7LNPWxkIbfOmswmdmFJSLFnQfGgICKG"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final int A07;
    public final int A08;
    public final int A09;
    public final int A0A;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 86);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0B = new byte[]{4, 54, 31, 2, 29, 17, 4, 74, 67, 78, 75, 69, 76, 79, 71, 76, 86, 86, 91, 88, 80, 31, 18, 15, 25, 24, 15, 14, 9, 4, 17, 24, 56, 49, 48, 42, 45, 55, 36, 59, 44, 49, 36, 41, 44, 38, 95, 80, 92, 84, 123, 97, 96, 120, 125, 122, 113, 119, 123, 120, 123, 97, 102, 92, 94, 69, 65, 77, 94, 85, 79, 67, 64, 67, 89, 94, 52, 51, 53, 46, 44, 34, 40, 50, 51, 26, 1, 11, 10, 29, 3, 6, 1, 10};
    }

    static {
        A02();
    }

    public C1531bu(int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17, int i18, int i19, int i21) {
        this.A06 = i5;
        this.A00 = i11;
        this.A08 = i12;
        this.A07 = i13;
        this.A03 = i14;
        this.A01 = i15;
        this.A04 = i16;
        this.A0A = i17;
        this.A09 = i18;
        this.A02 = i19;
        this.A05 = i21;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0165  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static C1531bu A00(String str) {
        int borderStyleIndex = -1;
        int i5 = -1;
        int i11 = -1;
        int i12 = -1;
        int i13 = -1;
        int i14 = -1;
        int i15 = -1;
        int i16 = -1;
        int i17 = -1;
        int i18 = -1;
        int nameIndex = A01(1, 7, 38).length();
        String[] strArrSplit = TextUtils.split(str.substring(nameIndex), A01(0, 1, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        int boldIndex = 0;
        while (true) {
            int nameIndex2 = strArrSplit.length;
            int fontSizeIndex = -1;
            if (boldIndex < nameIndex2) {
                String strA01 = XC.A01(strArrSplit[boldIndex].trim());
                int nameIndex3 = strA01.hashCode();
                switch (nameIndex3) {
                    case -1178781136:
                        if (strA01.equals(A01(40, 6, 19))) {
                            fontSizeIndex = 6;
                            break;
                        }
                        break;
                    case -1026963764:
                        String[] strArr = A0C;
                        String str2 = strArr[2];
                        String str3 = strArr[1];
                        int nameIndex4 = str2.charAt(30);
                        int alignmentIndex = str3.charAt(30);
                        if (nameIndex4 != alignmentIndex) {
                            String[] strArr2 = A0C;
                            strArr2[2] = "UGPaJMsfBG53J9268KtcwGECzwZjxg8w";
                            strArr2[1] = "1lPDy8zKIP9GomZz9qYepHnSBHgBAw8d";
                            if (strA01.equals(A01(85, 4, 4))) {
                                fontSizeIndex = 7;
                                break;
                            }
                        } else {
                            A0C[3] = "l3P4qW1zUFY2e3aicCUSeDb316n9ukkh";
                            if (strA01.equals(A01(85, 9, 57))) {
                            }
                        }
                        break;
                    case -192095652:
                        if (strA01.equals(A01(76, 9, 17))) {
                            fontSizeIndex = 8;
                            break;
                        }
                        break;
                    case -70925746:
                        if (strA01.equals(A01(63, 13, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE))) {
                            fontSizeIndex = 2;
                            break;
                        }
                        break;
                    case 3029637:
                        if (strA01.equals(A01(17, 4, 98))) {
                            fontSizeIndex = 5;
                            break;
                        }
                        break;
                    case 3373707:
                        if (strA01.equals(A01(46, 4, 103))) {
                            fontSizeIndex = 0;
                            break;
                        }
                        break;
                    case 366554320:
                        int italicIndex = A0C[3].charAt(31);
                        if (italicIndex == 104) {
                            A0C[3] = "EkGhkMjmSFkS4j3jZOxNQupkHX6n5Rwh";
                            if (strA01.equals(A01(32, 8, 8))) {
                            }
                        } else if (strA01.equals(A01(32, 8, 8))) {
                            fontSizeIndex = 4;
                            break;
                        }
                        break;
                    case 767321349:
                        if (strA01.equals(A01(21, 11, 43))) {
                            fontSizeIndex = 9;
                            break;
                        }
                        break;
                    case 1767875043:
                        if (strA01.equals(A01(8, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE))) {
                            fontSizeIndex = 1;
                            break;
                        }
                        break;
                    case 1988365454:
                        int alignmentIndex2 = A0C[3].charAt(31);
                        if (alignmentIndex2 == 104) {
                            String[] strArr3 = A0C;
                            strArr3[5] = "tC";
                            strArr3[6] = "1bcTU";
                            if (strA01.equals(A01(50, 13, 66))) {
                                fontSizeIndex = 3;
                                break;
                            }
                        } else {
                            throw new RuntimeException();
                        }
                        break;
                }
                switch (fontSizeIndex) {
                    case 0:
                        borderStyleIndex = boldIndex;
                        break;
                    case 1:
                        i5 = boldIndex;
                        break;
                    case 2:
                        i11 = boldIndex;
                        break;
                    case 3:
                        i12 = boldIndex;
                        break;
                    case 4:
                        i13 = boldIndex;
                        break;
                    case 5:
                        i14 = boldIndex;
                        break;
                    case 6:
                        i15 = boldIndex;
                        break;
                    case 7:
                        i16 = boldIndex;
                        break;
                    case 8:
                        i17 = boldIndex;
                        break;
                    case 9:
                        i18 = boldIndex;
                        break;
                }
                boldIndex++;
            } else {
                if (borderStyleIndex != -1) {
                    int nameIndex5 = strArrSplit.length;
                    return new C1531bu(borderStyleIndex, i5, i11, i12, i13, i14, i15, i16, i17, i18, nameIndex5);
                }
                return null;
            }
        }
    }
}
