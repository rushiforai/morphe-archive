package com.facebook.ads.redexgen.X;

import android.util.Base64;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.androidx.media3.extractor.metadata.flac.PictureFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.vorbis.VorbisComment;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public abstract class ZW {
    public static byte[] A00;
    public static String[] A01 = {"CSNRKhbmsgdfQ7aSJvnwDgN2Z87LRzVR", "BGNWBKlJ4HuPsa2ZnSdmD0oh8EkwiDh8", "FsRU8HkAwVe7RCT94HEIDLk9huzVf", "JIDKT0Kle88LNybwjYJRV6JmiLTQ5sE4", "sKHcwWBr5rfr2dbZoykAG6aQt2aDb", "M", "i3aCrCY4btc3l2ekWM3kOdcVo1EcH", "WHExPvKTx7PFNdezHTj3QzMQhOYw1aTj"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 16 out of bounds for length 16
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static ZV A06(C1084Mk c1084Mk) throws L9 {
        A0C(1, c1084Mk, false);
        int iA0F = c1084Mk.A0F();
        int iA0I = c1084Mk.A0I();
        int iA0F2 = c1084Mk.A0F();
        int iA0E = c1084Mk.A0E();
        if (iA0E <= 0) {
            iA0E = -1;
        }
        int iA0E2 = c1084Mk.A0E();
        if (iA0E2 <= 0) {
            iA0E2 = -1;
            if (A01[5].length() == 16) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[1] = "ePPv72s43IVhlXZ7r99oDj0FnR0cec3p";
            strArr[0] = "TAVSpPlR4HHANZfnut3JDDWfCxBKXdg5";
        }
        int iA0E3 = c1084Mk.A0E();
        if (iA0E3 <= 0) {
            iA0E3 = -1;
        }
        int iA0I2 = c1084Mk.A0I();
        return new ZV(iA0F, iA0I, iA0F2, iA0E, iA0E2, iA0E3, (int) Math.pow(2.0d, iA0I2 & 15), (int) Math.pow(2.0d, (iA0I2 & 240) >> 4), (c1084Mk.A0I() & 1) > 0, Arrays.copyOf(c1084Mk.A0l(), c1084Mk.A0A()));
    }

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 66);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A00 = new byte[]{11, 113, 86, 94, 91, 82, 83, 23, 67, 88, 23, 71, 86, 69, 68, 82, 23, 97, 88, 69, 85, 94, 68, 23, 84, 88, 90, 90, 82, 89, 67, 13, 23, 85, 114, 122, AbstractJsonLexerKt.TC_INVALID, 118, 119, 51, 103, 124, 51, 99, 114, 97, 96, 118, 51, 101, 124, 97, 113, 122, 96, 51, 99, 122, 112, 103, 102, 97, 118, 8, 0, 17, 4, 1, 4, 17, 4, 26, 7, 9, 10, 6, 14, 26, 21, 12, 6, 17, 16, 23, 0, 34, 27, 6, 22, 29, 7, 33, 0, 29, 24, 103, 122, 114, 103, 97, 118, 103, 102, 34, 97, 106, 99, 112, 99, 97, 118, 103, 112, 113, 34, 37, 116, 109, 112, 96, 107, 113, 37, 33, 60, 52, 33, 39, 48, 33, 32, 100, 39, 43, 32, 33, 100, 38, 43, 43, 47, 100, 48, 43, 100, 55, 48, 37, 54, 48, 100, 51, 45, 48, 44, 100, 31, 116, 60, 113, 114, 104, 100, 116, 60, 112, 119, 104, 100, 116, 60, 112, 118, 25, 100, 37, 48, 100, 62, 35, 43, 62, 56, 47, 62, 63, 123, 51, 62, 58, 63, 62, 41, 123, 47, 34, 43, 62, 123, 86, 92, 95, 95, 66, 16, 68, 73, 64, 85, 16, 87, 66, 85, 81, 68, 85, 66, 16, 68, 88, 81, 94, 16, 1, 16, 94, 95, 68, 16, 84, 85, 83, 95, 84, 81, 82, 92, 85, 10, 16, 117, 97, 114, 126, 122, 125, 116, 51, 113, 122, 103, 51, 114, 117, 103, 118, 97, 51, 126, 124, 119, 118, 96, 51, 125, 124, 103, 51, 96, 118, 103, 51, 114, 96, 51, 118, 107, 99, 118, 112, 103, 118, 119, 49, 37, 54, 58, 62, 57, 48, 119, 53, 62, 35, 119, 50, 47, 39, 50, 52, 35, 50, 51, 119, 35, 56, 119, 53, 50, 119, 36, 50, 35, 93, 94, 94, 90, 68, 65, 17, 69, 72, 65, 84, 17, 86, 67, 84, 80, 69, 84, 67, 17, 69, 89, 80, 95, 17, 3, 17, 95, 94, 69, 17, 85, 84, 82, 94, 85, 80, 83, 93, 84, 11, 17, 82, 94, 79, 79, 86, 81, 88, 31, 75, 70, 79, 90, 31, 80, 75, 87, 90, 77, 31, 75, 87, 94, 81, 31, 15, 31, 81, 80, 75, 31, 76, 74, 79, 79, 80, 77, 75, 90, 91, 5, 31, 106, 118, 123, 121, AbstractJsonLexerKt.TC_INVALID, 114, 117, 118, 126, AbstractJsonLexerKt.TC_INVALID, 104, 58, 117, 124, 58, 110, 115, 119, AbstractJsonLexerKt.TC_INVALID, 58, 126, 117, 119, 123, 115, 116, 58, 110, 104, 123, 116, 105, 124, 117, 104, 119, 105, 58, 116, 117, 110, 58, 96, AbstractJsonLexerKt.TC_INVALID, 104, 117, AbstractJsonLexerKt.TC_INVALID, 126, 58, 117, 111, 110, 2, 21, 3, 25, 20, 5, 21, 36, 9, 0, 21, 80, 23, 2, 21, 17, 4, 21, 2, 80, 4, 24, 17, 30, 80, 66, 80, 25, 3, 80, 30, 31, 4, 80, 20, 21, 19, 31, 20, 17, 18, 28, 21, 6, 29, 82, 0, 23, 1, 23, 0, 4, 23, 22, 82, 16, 27, 6, 1, 82, 31, 7, 1, 6, 82, 16, 23, 82, 8, 23, 0, 29, 82, 19, 20, 6, 23, 0, 82, 31, 19, 2, 2, 27, 28, 21, 82, 17, 29, 7, 2, 30, 27, 28, 21, 82, 1, 6, 23, 2, 1, 65, 90, 90, 21, 70, 93, 90, 71, 65, 21, 93, 80, 84, 81, 80, 71, 15, 21};
    }

    static {
        A08();
    }

    public static int A00(int i5) {
        int val = 0;
        while (i5 > 0) {
            val++;
            i5 >>>= 1;
        }
        return val;
    }

    public static long A01(long j11, long j12) {
        return (long) Math.floor(Math.pow(j11, 1.0d / j12));
    }

    public static Metadata A02(List<String> list) {
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < list.size(); i5++) {
            String str = list.get(i5);
            String[] strArrA1P = N1.A1P(str, A07(0, 1, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
            int length = strArrA1P.length;
            String strA07 = A07(85, 10, 54);
            if (length != 2) {
                MV.A07(strA07, A07(1, 32, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE) + str);
            } else if (strArrA1P[0].equals(A07(63, 22, 7))) {
                try {
                    arrayList.add(PictureFrame.A00(new C1084Mk(Base64.decode(strArrA1P[1], 0))));
                } catch (RuntimeException e3) {
                    int i11 = A01[4].length();
                    if (i11 != 29) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A01;
                    strArr[7] = "iTort3w6F8uQNOr7xrlLxkVs8SYtT5Z1";
                    strArr[3] = "SSTu6mrb48DcNiSCKnJ8tB3UoGhdW8fv";
                    MV.A0A(strA07, A07(33, 30, 81), e3);
                }
            } else {
                arrayList.add(new VorbisComment(strArrA1P[0], strArrA1P[1]));
            }
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        return new Metadata(arrayList);
    }

    /* JADX WARN: Incorrect condition in loop: B:18:0x0050 */
    /* JADX WARN: Incorrect condition in loop: B:8:0x0026 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ZS A03(ZR zr2) throws L9 {
        long jA01;
        if (zr2.A02(24) == 5653314) {
            int iA02 = zr2.A02(16);
            int lookupType = zr2.A02(24);
            long[] jArr = new long[lookupType];
            boolean zA04 = zr2.A04();
            if (!zA04) {
                boolean isSparse = zr2.A04();
                for (int i5 = 0; i5 < entries; i5++) {
                    if (isSparse) {
                        if (zr2.A04()) {
                            int entries = zr2.A02(5);
                            jArr[i5] = entries + 1;
                        } else {
                            jArr[i5] = 0;
                        }
                    } else {
                        int entries2 = zr2.A02(5);
                        jArr[i5] = entries2 + 1;
                    }
                }
            } else {
                int j11 = zr2.A02(5) + 1;
                int num = 0;
                while (num < entries) {
                    int entries3 = lookupType - num;
                    int i11 = zr2.A02(A00(entries3));
                    for (int i12 = 0; i12 < i11; i12++) {
                        int length = jArr.length;
                        int dimensions = A01[5].length();
                        if (dimensions == 16) {
                            throw new RuntimeException();
                        }
                        A01[5] = "yNl2PawFN0E4cLaf5Q4KGEYaz";
                        if (num < length) {
                            jArr[num] = j11;
                            num++;
                        }
                    }
                    j11++;
                }
            }
            int iA022 = zr2.A02(4);
            if (iA022 <= 2) {
                if (iA022 == 1 || iA022 == 2) {
                    zr2.A03(32);
                    zr2.A03(32);
                    int iA023 = zr2.A02(4) + 1;
                    zr2.A03(1);
                    if (iA022 == 1) {
                        if (iA02 != 0) {
                            jA01 = A01(lookupType, iA02);
                        } else {
                            jA01 = 0;
                        }
                    } else {
                        jA01 = lookupType * iA02;
                    }
                    int entries4 = (int) (iA023 * jA01);
                    zr2.A03(entries4);
                }
                return new ZS(iA02, lookupType, jArr, iA022, zA04);
            }
            throw L9.A01(A07(Sdk.SDKError.Reason.EVALUATE_JAVASCRIPT_FAILED_VALUE, 42, 115) + iA022, null);
        }
        throw L9.A01(A07(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 55, 6) + zr2.A01(), null);
    }

    public static ZT A04(C1084Mk c1084Mk) throws L9 {
        return A05(c1084Mk, true, true);
    }

    /* JADX WARN: Incorrect condition in loop: B:6:0x0025 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ZT A05(C1084Mk c1084Mk, boolean z11, boolean z12) throws L9 {
        if (z11) {
            A0C(3, c1084Mk, false);
        }
        int length = (int) c1084Mk.A0O();
        String strA0W = c1084Mk.A0W(length);
        int length2 = strA0W.length();
        int i5 = 7 + 4 + length2;
        long jA0O = c1084Mk.A0O();
        int length3 = (int) jA0O;
        String[] comments = new String[length3];
        int i11 = i5 + 4;
        int i12 = 0;
        while (commentListLen < jA0O) {
            long commentListLen = c1084Mk.A0O();
            int length4 = (int) commentListLen;
            comments[i12] = c1084Mk.A0W(length4);
            int length5 = comments[i12].length();
            i11 = i11 + 4 + length5;
            i12++;
        }
        if (z12) {
            int length6 = c1084Mk.A0I();
            if ((length6 & 1) == 0) {
                String vendor = A07(283, 30, 21);
                throw L9.A01(vendor, null);
            }
        }
        return new ZT(strA0W, comments, i11 + 1);
    }

    public static void A09(int i5, ZR zr2) throws L9 {
        int j11;
        int iA02 = zr2.A02(6) + 1;
        for (int i11 = 0; i11 < iA02; i11++) {
            int iA022 = zr2.A02(16);
            if (iA022 != 0) {
                MV.A05(A07(85, 10, 54), A07(355, 41, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE) + iA022);
            } else {
                if (zr2.A04()) {
                    j11 = zr2.A02(4) + 1;
                } else {
                    j11 = 1;
                }
                if (zr2.A04()) {
                    int iA023 = zr2.A02(8) + 1;
                    for (int i12 = 0; i12 < iA023; i12++) {
                        int mappingsCount = i5 - 1;
                        zr2.A03(A00(mappingsCount));
                        int mappingsCount2 = i5 - 1;
                        zr2.A03(A00(mappingsCount2));
                    }
                }
                int mappingsCount3 = zr2.A02(2);
                if (mappingsCount3 == 0) {
                    if (j11 > 1) {
                        for (int mappingsCount4 = 0; mappingsCount4 < i5; mappingsCount4++) {
                            zr2.A03(4);
                        }
                    }
                    for (int i13 = 0; i13 < j11; i13++) {
                        zr2.A03(8);
                        zr2.A03(8);
                        zr2.A03(8);
                        String[] strArr = A01;
                        String str = strArr[1];
                        String str2 = strArr[0];
                        int iCharAt = str.charAt(20);
                        int mappingsCount5 = str2.charAt(20);
                        if (iCharAt != mappingsCount5) {
                            throw new RuntimeException();
                        }
                        String[] strArr2 = A01;
                        strArr2[1] = "p1VKg473YIoEl67qOqhRDsbexTPOBoSx";
                        strArr2[0] = "wLMZnqvdTHQilTz4OPQyD0YtUnpClS8H";
                    }
                } else {
                    throw L9.A01(A07(491, 58, 48), null);
                }
            }
        }
    }

    public static void A0A(ZR zr2) throws L9 {
        int iA02 = zr2.A02(6) + 1;
        for (int floorNumberOfBooks = 0; floorNumberOfBooks < iA02; floorNumberOfBooks++) {
            int iA022 = zr2.A02(16);
            switch (iA022) {
                case 0:
                    zr2.A03(8);
                    zr2.A03(16);
                    zr2.A03(16);
                    zr2.A03(6);
                    zr2.A03(8);
                    int floorCount = zr2.A02(4);
                    int floorCount2 = floorCount + 1;
                    for (int i5 = 0; i5 < floorCount2; i5++) {
                        zr2.A03(8);
                    }
                    break;
                case 1:
                    String[] strArr = A01;
                    String str = strArr[7];
                    String str2 = strArr[3];
                    int floorCount3 = str.charAt(12);
                    if (floorCount3 != str2.charAt(12)) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A01;
                    strArr2[7] = "R9QSrAUJj5wzNqYOn0guqAltbWTaHU34";
                    strArr2[3] = "mkcGS6UH8ZuiN3MgqrVe1LrFKb74rQlB";
                    int floorCount4 = zr2.A02(5);
                    int i11 = -1;
                    int[] iArr = new int[floorCount4];
                    for (int i12 = 0; i12 < floorCount4; i12++) {
                        iArr[i12] = zr2.A02(4);
                        if (iArr[i12] > i11) {
                            i11 = iArr[i12];
                        }
                    }
                    int[] classDimensions = new int[i11 + 1];
                    for (int j11 = 0; j11 < classDimensions.length; j11++) {
                        classDimensions[j11] = zr2.A02(3) + 1;
                        int iA023 = zr2.A02(2);
                        if (iA023 > 0) {
                            zr2.A03(8);
                        }
                        for (int i13 = 0; i13 < (1 << iA023); i13++) {
                            zr2.A03(8);
                        }
                    }
                    zr2.A03(2);
                    int iA024 = zr2.A02(4);
                    int maximumClass = 0;
                    int i14 = 0;
                    for (int count = 0; count < floorCount4; count++) {
                        maximumClass += classDimensions[iArr[count]];
                        while (i14 < maximumClass) {
                            zr2.A03(iA024);
                            i14++;
                        }
                    }
                    break;
                default:
                    throw L9.A01(A07(199, 41, 114) + iA022, null);
            }
        }
    }

    public static void A0B(ZR zr2) throws L9 {
        int iA02 = zr2.A02(6) + 1;
        for (int i5 = 0; i5 < iA02; i5++) {
            int residueCount = zr2.A02(16);
            if (residueCount <= 2) {
                zr2.A03(24);
                zr2.A03(24);
                zr2.A03(24);
                int iA022 = zr2.A02(6) + 1;
                int residueCount2 = A01[5].length();
                if (residueCount2 == 16) {
                    throw new RuntimeException();
                }
                A01[4] = "4LakvCkGGTsKaO9zNFmvNb4OHtg8M";
                zr2.A03(8);
                int[] iArr = new int[iA022];
                for (int i11 = 0; i11 < iA022; i11++) {
                    int classifications = 0;
                    int residueType = zr2.A02(3);
                    if (zr2.A04()) {
                        classifications = zr2.A02(5);
                    }
                    int i12 = classifications * 8;
                    iArr[i11] = i12 + residueType;
                }
                for (int classifications2 = 0; classifications2 < iA022; classifications2++) {
                    for (int residueType2 = 0; residueType2 < 8; residueType2++) {
                        int i13 = iArr[classifications2];
                        if ((i13 & (1 << residueType2)) != 0) {
                            zr2.A03(8);
                        }
                    }
                }
            } else {
                throw L9.A01(A07(448, 43, 50), null);
            }
        }
    }

    public static boolean A0C(int i5, C1084Mk c1084Mk, boolean z11) throws L9 {
        if (c1084Mk.A07() < 7) {
            if (z11) {
                return false;
            }
            throw L9.A01(A07(549, 18, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE) + c1084Mk.A07(), null);
        }
        if (c1084Mk.A0I() != i5) {
            if (z11) {
                return false;
            }
            throw L9.A01(A07(178, 21, 25) + Integer.toHexString(i5), null);
        }
        if (c1084Mk.A0I() == 118 && c1084Mk.A0I() == 111 && c1084Mk.A0I() == 114 && c1084Mk.A0I() == 98 && c1084Mk.A0I() == 105) {
            int iA0I = c1084Mk.A0I();
            String[] strArr = A01;
            if (strArr[2].length() != strArr[6].length()) {
                throw new RuntimeException();
            }
            A01[4] = "Td5hkq7Sy845zGsmk1htgwwInW642";
            if (iA0I == 115) {
                if (A01[4].length() != 29) {
                    throw new RuntimeException();
                }
                A01[5] = "qjbyChnn8";
                return true;
            }
        }
        if (z11) {
            return false;
        }
        throw L9.A01(A07(95, 28, 64), null);
    }

    public static ZU[] A0D(C1084Mk c1084Mk, int i5) throws L9 {
        A0C(5, c1084Mk, false);
        int iA0I = c1084Mk.A0I() + 1;
        ZR zr2 = new ZR(c1084Mk.A0l());
        int numberOfBooks = c1084Mk.A09();
        zr2.A03(numberOfBooks * 8);
        for (int numberOfBooks2 = 0; numberOfBooks2 < iA0I; numberOfBooks2++) {
            A03(zr2);
        }
        int numberOfBooks3 = zr2.A02(6);
        int timeCount = numberOfBooks3 + 1;
        for (int i11 = 0; i11 < timeCount; i11++) {
            int numberOfBooks4 = zr2.A02(16);
            if (numberOfBooks4 != 0) {
                throw L9.A01(A07(396, 52, 88), null);
            }
        }
        A0A(zr2);
        A0B(zr2);
        A09(i5, zr2);
        ZU[] zuArrA0E = A0E(zr2);
        if (zr2.A04()) {
            return zuArrA0E;
        }
        throw L9.A01(A07(240, 43, 81), null);
    }

    public static ZU[] A0E(ZR zr2) {
        int iA02 = zr2.A02(6) + 1;
        ZU[] zuArr = new ZU[iA02];
        for (int windowType = 0; windowType < iA02; windowType++) {
            boolean zA04 = zr2.A04();
            int iA022 = zr2.A02(16);
            int i5 = zr2.A02(16);
            zuArr[windowType] = new ZU(zA04, iA022, i5, zr2.A02(8));
        }
        return zuArr;
    }
}
