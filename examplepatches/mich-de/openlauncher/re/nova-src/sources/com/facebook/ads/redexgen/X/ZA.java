package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class ZA {
    public static byte[] A00;
    public static String[] A01 = {"REXdgQyfN8K2", "jZv5gDNyIP4NmQkuTkGxaa3Uz7VAicPa", "qumYO81heERej7", "RzOWJ2I2a28CgfW0aJf9LKAspnVDDF3N", "anaX8lyWWDLfxvWcx", "atBIg4LOFdzuCjJQI", "3TwRo3EPYyOgwxlZoixvJf", "LtHqRvcrNEs63EuEYuOQH"};
    public static final int[] A02;
    public static final int[] A03;
    public static final int[] A04;
    public static final int[] A05;
    public static final int[] A06;
    public static final int[] A07;
    public static final String[] A08;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 69);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{-21, -1, -18, -13, -7, -71, -9, -6, -17, -15, -35, -15, -32, -27, -21, -85, -23, -20, -31, -29, -87, -56, -83, -76, -56, -73, -68, -62, -126, -64, -61, -72, -70, -128, -97, -123};
    }

    static {
        A05();
        A08 = new String[]{A04(10, 13, 55), A04(23, 13, 14), A04(0, 10, 69)};
        A07 = new int[]{44100, 48000, 32000};
        A02 = new int[]{32000, 64000, 96000, 128000, 160000, 192000, 224000, 256000, 288000, 320000, 352000, 384000, 416000, 448000};
        A06 = new int[]{32000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 144000, 160000, 176000, 192000, 224000, 256000};
        A03 = new int[]{32000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 160000, 192000, 224000, 256000, 320000, 384000};
        A04 = new int[]{32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 160000, 192000, 224000, 256000, 320000};
        A05 = new int[]{8000, 16000, 24000, 32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 144000, 160000};
    }

    public static int A00(int i5) {
        int i11;
        int layer;
        int bitrate;
        int i12;
        int samplingRate;
        int version;
        if (!A06(i5) || (i11 = (i5 >>> 19) & 3) == 1 || (layer = (i5 >>> 17) & 3) == 0 || (bitrate = (i5 >>> 12) & 15) == 0 || bitrate == 15 || (i12 = (i5 >>> 10) & 3) == 3) {
            return -1;
        }
        int i13 = A07[i12];
        if (i11 == 2) {
            i13 /= 2;
        } else if (i11 == 0) {
            i13 /= 4;
        }
        int i14 = (i5 >>> 9) & 1;
        if (layer == 3) {
            if (i11 == 3) {
                int version2 = bitrate - 1;
                version = A02[version2];
            } else {
                int version3 = bitrate - 1;
                version = A06[version3];
            }
            return (((version * 12) / i13) + i14) * 4;
        }
        if (i11 == 3) {
            if (layer == 2) {
                int version4 = bitrate - 1;
                samplingRate = A03[version4];
            } else {
                int[] iArr = A04;
                int padding = bitrate - 1;
                int samplingRate2 = A01[1].charAt(3);
                if (samplingRate2 == 80) {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[4] = "26EO3q6izvhU6pTqY";
                strArr[5] = "BtgZYgs6NCmG30OOA";
                samplingRate = iArr[padding];
            }
        } else {
            int version5 = bitrate - 1;
            samplingRate = A05[version5];
        }
        if (i11 == 3) {
            int version6 = samplingRate * 144;
            return (version6 / i13) + i14;
        }
        int version7 = layer == 1 ? 72 : 144;
        return ((version7 * samplingRate) / i13) + i14;
    }

    public static int A01(int i5) {
        int i11;
        int layer;
        if (!A06(i5) || (i11 = (i5 >>> 19) & 3) == 1 || (layer = (i5 >>> 17) & 3) == 0) {
            return -1;
        }
        int i12 = (i5 >>> 12) & 15;
        int version = i5 >>> 10;
        int version2 = version & 3;
        if (i12 == 0 || i12 == 15 || version2 == 3) {
            return -1;
        }
        int layer2 = A02(i11, layer);
        String[] strArr = A01;
        String str = strArr[0];
        String str2 = strArr[7];
        int length = str.length();
        int version3 = str2.length();
        if (length == version3) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[0] = "Zesk7NIJQTHx";
        strArr2[7] = "LIvxfY0UDFK1BhCv6i1Jn";
        return layer2;
    }

    public static int A02(int i5, int i11) {
        switch (i11) {
            case 1:
                return i5 == 3 ? 1152 : 576;
            case 2:
                return 1152;
            case 3:
                return 384;
            default:
                throw new IllegalArgumentException();
        }
    }

    public static boolean A06(int i5) {
        return (i5 & (-2097152)) == -2097152;
    }

    public static /* synthetic */ String[] A0E() {
        String[] strArr = A08;
        if (A01[1].charAt(3) == 'P') {
            throw new RuntimeException();
        }
        A01[3] = "bO1TDqrS4ZwK4Pf07wZFi65T1IcYdtbw";
        return strArr;
    }
}
