package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class YZ {
    public static byte[] A00;
    public static String[] A01 = {"uuSVMLghs8q9OLJzME4LRyTxKtLJyKZc", "NoL5cUva3x4B6cDjXWxaV85VGb83sEPW", "nQuBJlVWNhkjf38OerZOfq", "APG6v1lFDIL", "mJvX2cdXegXmUgymjOjM2QAD3Wlu", "6gG5W2UkAkKN5YXWl1CUKyDCGHNwtXZi", "hUMEM081Chz4PfFQBxQjMIPVTlP2", "ZMJprWT5QW9amg"};
    public static final int[] A02;
    public static final int[] A03;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 80);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{11, 11, 13, -22, 50, 47, 43, 46, 47, 60, -22, 51, 56, 61, 63, 48, 48, 51, 45, 51, 47, 56, 62, -22, 46, 43, 62, 43, -85, -85, -83, -118, -46, -49, -53, -50, -49, -36, -118, -31, -36, -39, -40, -47, -118, -67, -53, -41, -38, -42, -45, -40, -47, -118, -80, -36, -49, -37, -33, -49, -40, -51, -29, -118, -77, -40, -50, -49, -30, -57, -25, -23, -37, -6, -17, -14, 32, 57, 48, 67, 59, 48, 46, 63, 48, 47, -21, 49, 61, 44, 56, 48, 23, 48, 57, 50, 63, 51, 17, 55, 44, 50, -21, 8, -21, -4, -53, -28, -23, -21, -26, -26, -27, -24, -22, -37, -38, -106, -41, -21, -38, -33, -27, -106, -27, -40, -32, -37, -39, -22, -106, -22, -17, -26, -37, -80, -106, -35, -10, -5, -3, -8, -8, -9, -6, -4, -19, -20, -88, -19, -8, -53, -9, -10, -18, -15, -17, -62, -88, 19, 22, -38, 7, -44, -38, -42, -44};
    }

    static {
        A05();
        A03 = new int[]{96000, 88200, 64000, 48000, 44100, 32000, 24000, 22050, 16000, 12000, 11025, 8000, 7350};
        A02 = new int[]{0, 1, 2, 3, 4, 5, 6, 8, -1, -1, -1, 7, 8, -1, 8, -1};
    }

    public static int A00(C1083Mj c1083Mj) {
        int iA04 = c1083Mj.A04(5);
        if (iA04 == 31) {
            int audioObjectType = c1083Mj.A04(6);
            return audioObjectType + 32;
        }
        return iA04;
    }

    public static int A01(C1083Mj c1083Mj) throws L9 {
        int iA04 = c1083Mj.A04(4);
        if (iA04 == 15) {
            if (c1083Mj.A01() >= 24) {
                int frequencyIndex = c1083Mj.A04(24);
                return frequencyIndex;
            }
            throw L9.A01(A04(0, 28, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), null);
        }
        if (iA04 < 13) {
            int[] iArr = A03;
            String[] strArr = A01;
            String str = strArr[7];
            String str2 = strArr[2];
            int samplingFrequency = str.length();
            int frequencyIndex2 = str2.length();
            if (samplingFrequency == frequencyIndex2) {
                throw new RuntimeException();
            }
            A01[6] = "omyqKKWnOV5flqvWibXBjRe2HASB";
            int frequencyIndex3 = iArr[iA04];
            return frequencyIndex3;
        }
        throw L9.A01(A04(28, 41, 26), null);
    }

    public static YY A02(C1083Mj c1083Mj, boolean z11) throws L9 {
        int iA00 = A00(c1083Mj);
        int iA01 = A01(c1083Mj);
        int iA04 = c1083Mj.A04(4);
        String str = A04(159, 8, 86) + iA00;
        if (iA00 == 5 || iA00 == 29) {
            iA01 = A01(c1083Mj);
            iA00 = A00(c1083Mj);
            if (iA00 == 22) {
                iA04 = c1083Mj.A04(4);
            }
        }
        if (z11) {
            switch (iA00) {
                case 1:
                case 2:
                case 3:
                case 4:
                case 6:
                case 7:
                case 17:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                    A06(c1083Mj, iA00, iA04);
                    int sampleRateHz = A01[1].charAt(25);
                    if (sampleRateHz == 98) {
                        A01[0] = "GxyC1SXuFebBMxwwM46g60fWrkLQdBoe";
                        switch (iA00) {
                            case 17:
                            case 19:
                            case 20:
                            case 21:
                            case 22:
                            case 23:
                                int iA042 = c1083Mj.A04(2);
                                if (iA042 == 2 || iA042 == 3) {
                                    throw L9.A00(A04(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 22, 56) + iA042);
                                }
                                break;
                        }
                    } else {
                        throw new RuntimeException();
                    }
                case 5:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                case 13:
                case 14:
                case 15:
                case 16:
                case 18:
                default:
                    throw L9.A00(A04(106, 31, 38) + iA00);
            }
        }
        int channelCount = A02[iA04];
        if (channelCount != -1) {
            return new YY(iA01, channelCount, str);
        }
        throw L9.A01(null, null);
    }

    public static YY A03(byte[] bArr) throws L9 {
        return A02(new C1083Mj(bArr), false);
    }

    public static void A06(C1083Mj c1083Mj, int i5, int i11) {
        boolean frameLengthFlag = c1083Mj.A0H();
        if (frameLengthFlag) {
            MV.A07(A04(69, 7, 54), A04(76, 30, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        }
        boolean frameLengthFlag2 = c1083Mj.A0H();
        if (frameLengthFlag2) {
            c1083Mj.A09(14);
        }
        boolean dependsOnCoreDecoder = c1083Mj.A0H();
        if (i11 != 0) {
            if (i5 == 6 || i5 == 20) {
                c1083Mj.A09(3);
            }
            if (dependsOnCoreDecoder) {
                if (i5 == 22) {
                    c1083Mj.A09(16);
                }
                if (A01[3].length() != 11) {
                    throw new RuntimeException();
                }
                A01[3] = "dyeqwrnkJvf";
                if (i5 == 17 || i5 == 19 || i5 == 20 || i5 == 23) {
                    c1083Mj.A09(3);
                }
                c1083Mj.A09(1);
                return;
            }
            return;
        }
        throw new UnsupportedOperationException();
    }

    public static byte[] A07(int i5, int i11, int i12) {
        return new byte[]{(byte) (((i5 << 3) & 248) | ((i11 >> 1) & 7)), (byte) (((i11 << 7) & 128) | ((i12 << 3) & 120))};
    }
}
