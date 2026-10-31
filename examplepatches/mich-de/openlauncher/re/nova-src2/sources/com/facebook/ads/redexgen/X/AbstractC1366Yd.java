package com.facebook.ads.redexgen.X;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Yd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1366Yd {
    public static byte[] A00;
    public static String[] A01 = {"gWfa92piv5tZZ0UbViZnkD", "8BWlWUZHwy5zGo", "KOwBd1kGbsETwJOQr", "AjHDM0eUBZHm3mjlWcYFg", "OBBgCtWIEZkDrGCsZywbf0a3to7dIhbP", "7ThbdWcppwWq2UlElfMVB4JMD6", "kRYaGlULPZIUrEfdkh6Tyf7E4GahIHHj", "phVTJZlUn3P7Zs8mUd1"};
    public static final int[] A02;
    public static final int[] A03;
    public static final int[] A04;
    public static final int[] A05;
    public static final int[] A06;
    public static final int[] A07;

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A00 = new byte[]{41, 61, 44, 33, 39, 103, 41, 43, 123, 22, 2, 19, 30, 24, 88, 18, 22, 20, 68, 3, 23, 6, 11, 13, 77, 7, 3, 1, 81, 79, 8, 13, 1};
    }

    static {
        A0B();
        A03 = new int[]{1, 2, 3, 6};
        A05 = new int[]{48000, 44100, 32000};
        A06 = new int[]{24000, 22050, 16000};
        A04 = new int[]{2, 1, 2, 3, 3, 4, 4, 5};
        A02 = new int[]{32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 384, 448, EventBridgeChannel.QUEUE_CAPACITY, 576, 640};
        A07 = new int[]{69, 87, 104, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 139, 174, Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 243, 278, 348, TTAdConstant.DOWNLOAD_URL_AND_PACKAGE_NAME, 487, 557, 696, 835, 975, 1114, 1253, 1393};
    }

    public static int A00(int i5, int i11) {
        int i12 = i11 / 2;
        if (i5 < 0) {
            return -1;
        }
        int halfFrmsizecod = A05.length;
        if (i5 >= halfFrmsizecod || i11 < 0) {
            return -1;
        }
        int halfFrmsizecod2 = A07.length;
        if (i12 >= halfFrmsizecod2) {
            return -1;
        }
        int i13 = A05[i5];
        if (A01[7].length() != 19) {
            throw new RuntimeException();
        }
        A01[7] = "5L7RX5JKrgrtk9KH87r";
        if (i13 == 44100) {
            int halfFrmsizecod3 = i11 % 2;
            return (A07[i12] + halfFrmsizecod3) * 2;
        }
        int sampleRate = A02[i12];
        if (i13 == 32000) {
            int halfFrmsizecod4 = sampleRate * 6;
            return halfFrmsizecod4;
        }
        int halfFrmsizecod5 = sampleRate * 4;
        return halfFrmsizecod5;
    }

    public static int A01(int i5, int i11, int i12) {
        return (i5 * i11) / (i12 * 32);
    }

    public static int A02(ByteBuffer byteBuffer) {
        int iPosition = byteBuffer.position();
        int startIndex = byteBuffer.limit();
        int i5 = startIndex - 10;
        for (int i11 = iPosition; i11 <= i5; i11++) {
            int startIndex2 = i11 + 4;
            int endIndex = N1.A0F(byteBuffer, startIndex2) & (-2);
            if (endIndex == -126718022) {
                return i11 - iPosition;
            }
        }
        int endIndex2 = A01[7].length();
        if (endIndex2 != 19) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[3] = "eOMYxb0wLSmLQ0G7YxyDe";
        strArr[0] = "TTeIHa3Ep1TtA6CuQAEFem";
        return -1;
    }

    public static int A03(ByteBuffer byteBuffer) {
        boolean isEac3 = ((byteBuffer.get(byteBuffer.position() + 5) & 248) >> 3) > 10;
        if (isEac3) {
            byte b11 = byteBuffer.get(byteBuffer.position() + 4);
            if (A01[5].length() != 26) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[3] = "DXpfQrtLciruzIVFlvY53";
            strArr[0] = "RlE8CkfxogD2ABvML1zfIj";
            return A03[((b11 & 192) >> 6) != 3 ? (byteBuffer.get(byteBuffer.position() + 4) & 48) >> 4 : 3] * 256;
        }
        return 1536;
    }

    public static int A04(ByteBuffer byteBuffer, int i5) {
        boolean isMlp = (byteBuffer.get((byteBuffer.position() + i5) + 7) & 255) == 187;
        return 40 << ((byteBuffer.get((byteBuffer.position() + i5) + (isMlp ? 9 : 8)) >> 4) & 7);
    }

    public static int A05(byte[] bArr) {
        if (bArr.length < 6) {
            return -1;
        }
        boolean isEac3 = ((bArr[5] & 248) >> 3) > 10;
        if (isEac3) {
            int i5 = (bArr[2] & 7) << 8;
            int frmsiz = bArr[3];
            if (A01[7].length() != 19) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[6] = "BDIPGES5Iy70rckzqUVITbYsi7nZbnMv";
            strArr[4] = "ZUuqCTmivk9PrDw5xwTjy4JM4X7ycwvf";
            return (((frmsiz & 255) | i5) + 1) * 2;
        }
        int fscod = (bArr[4] & 192) >> 6;
        return A00(fscod, bArr[4] & 63);
    }

    public static int A06(byte[] bArr) {
        if (bArr[4] != -8 || bArr[5] != 114 || bArr[6] != 111 || (bArr[7] & 254) != 186) {
            return 0;
        }
        int i5 = bArr[7] & 255;
        String[] strArr = A01;
        if (strArr[3].length() != strArr[0].length()) {
            A01[1] = "5vldxXbgycDySC";
            boolean z11 = i5 == 187;
            if (A01[5].length() == 26) {
                A01[5] = "0QS0ZKZc8ux9skKjaYGZGoWgg7";
                byte b11 = bArr[z11 ? '\t' : '\b'];
                if (A01[2].length() == 16) {
                    throw new RuntimeException();
                }
                A01[1] = "e9o9TbY2rszMey";
                return 40 << ((b11 >> 4) & 7);
            }
        }
        throw new RuntimeException();
    }

    public static VC A07(C1084Mk c1084Mk, String str, String str2, DrmInitData drmInitData) {
        C1083Mj c1083Mj = new C1083Mj();
        c1083Mj.A0C(c1084Mk);
        int fscod = c1083Mj.A04(2);
        int constantBitrate = A05[fscod];
        c1083Mj.A09(8);
        int i5 = A04[c1083Mj.A04(3)];
        if (c1083Mj.A04(1) != 0) {
            i5++;
        }
        int fscod2 = c1083Mj.A04(5);
        int halfFrmsizecod = A02[fscod2] * 1000;
        c1083Mj.A06();
        c1084Mk.A0f(c1083Mj.A02());
        return new C1029Ke().A0y(str).A11(A0A(0, 9, 52)).A0b(i5).A0m(constantBitrate).A0u(drmInitData).A10(str2).A0a(halfFrmsizecod).A0j(halfFrmsizecod).A14();
    }

    public static VC A08(C1084Mk c1084Mk, String str, String str2, DrmInitData drmInitData) {
        C1083Mj c1083Mj = new C1083Mj();
        c1083Mj.A0C(c1084Mk);
        int fscod = c1083Mj.A04(13) * 1000;
        c1083Mj.A09(3);
        int peakBitrate = c1083Mj.A04(2);
        int sampleRate = A05[peakBitrate];
        c1083Mj.A09(10);
        int channelCount = A04[c1083Mj.A04(3)];
        if (c1083Mj.A04(1) != 0) {
            channelCount++;
        }
        c1083Mj.A09(3);
        int peakBitrate2 = A01[2].length();
        if (peakBitrate2 == 16) {
            throw new RuntimeException();
        }
        A01[2] = "kzS1gbjIKacu2hyxgl59K";
        int iA04 = c1083Mj.A04(4);
        c1083Mj.A09(1);
        if (iA04 > 0) {
            c1083Mj.A0A(6);
            if (c1083Mj.A04(1) != 0) {
                channelCount += 2;
            }
            c1083Mj.A09(1);
        }
        String strA0A = A0A(9, 10, 11);
        int peakBitrate3 = c1083Mj.A01();
        if (peakBitrate3 > 7) {
            c1083Mj.A09(7);
            if (c1083Mj.A04(1) != 0) {
                strA0A = A0A(19, 14, 30);
            }
        }
        c1083Mj.A06();
        c1084Mk.A0f(c1083Mj.A02());
        return new C1029Ke().A0y(str).A11(strA0A).A0b(channelCount).A0m(sampleRate).A0u(drmInitData).A10(str2).A0j(fscod).A14();
    }

    /* JADX WARN: Removed duplicated region for block: B:113:0x0238  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x028d  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x02fd  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0193  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static C1365Yc A09(C1083Mj c1083Mj) {
        String strA0A;
        int iA01;
        int iA00;
        int i5;
        int i11;
        int i12;
        int i13;
        int iA04;
        int i14;
        int i15;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int iA03 = c1083Mj.A03();
        c1083Mj.A09(40);
        boolean z11 = c1083Mj.A04(5) > 10;
        c1083Mj.A08(iA03);
        int i22 = -1;
        if (z11) {
            c1083Mj.A09(16);
            switch (c1083Mj.A04(2)) {
                case 0:
                    i22 = 0;
                    break;
                case 1:
                    i22 = 1;
                    break;
                case 2:
                    i22 = 2;
                    break;
                default:
                    i22 = -1;
                    break;
            }
            c1083Mj.A09(3);
            iA00 = (c1083Mj.A04(11) + 1) * 2;
            int iA042 = c1083Mj.A04(2);
            if (iA042 == 3) {
                iA04 = 3;
                i11 = A06[c1083Mj.A04(2)];
                i14 = 6;
            } else {
                iA04 = c1083Mj.A04(2);
                i14 = A03[iA04];
                i11 = A05[iA042];
            }
            i12 = i14 * 256;
            iA01 = A01(iA00, i11, i14);
            int iA043 = c1083Mj.A04(3);
            boolean zA0H = c1083Mj.A0H();
            i13 = A04[iA043] + (zA0H ? 1 : 0);
            c1083Mj.A09(10);
            if (c1083Mj.A0H()) {
                c1083Mj.A09(8);
            }
            if (iA043 == 0) {
                c1083Mj.A09(5);
                if (c1083Mj.A0H()) {
                    c1083Mj.A09(8);
                }
            }
            if (i22 == 1 && c1083Mj.A0H()) {
                c1083Mj.A09(16);
            }
            if (c1083Mj.A0H()) {
                if (iA043 > 2) {
                    c1083Mj.A09(2);
                }
                if ((iA043 & 1) != 0 && iA043 > 2) {
                    i18 = 6;
                    if (A01[2].length() != 16) {
                        String[] strArr = A01;
                        strArr[3] = "hQrdftsyInnC0FGW7zAFQ";
                        strArr[0] = "vhmlqb0IOOCRRUvCvexDx7";
                        c1083Mj.A09(6);
                    }
                    throw new RuntimeException();
                }
                i18 = 6;
                if ((iA043 & 4) != 0) {
                    c1083Mj.A09(i18);
                }
                if (zA0H && c1083Mj.A0H()) {
                    c1083Mj.A09(5);
                }
                if (i22 == 0) {
                    boolean zA0H2 = c1083Mj.A0H();
                    String[] strArr2 = A01;
                    if (strArr2[6].charAt(12) == strArr2[4].charAt(12)) {
                        String[] strArr3 = A01;
                        strArr3[3] = "1gCrStzIkzuvI4aF0le7J";
                        strArr3[0] = "Cgb10VsBqJmebNMa7oD03s";
                        if (zA0H2) {
                        }
                    } else if (zA0H2) {
                        i19 = 6;
                        c1083Mj.A09(6);
                    } else {
                        i19 = 6;
                    }
                    if (iA043 == 0 && c1083Mj.A0H()) {
                        c1083Mj.A09(i19);
                    }
                    boolean zA0H3 = c1083Mj.A0H();
                    if (A01[7].length() == 19) {
                        A01[7] = "01QpZ2YUOVRnDDZxQo4";
                        if (zA0H3) {
                            c1083Mj.A09(i19);
                        }
                        int iA044 = c1083Mj.A04(2);
                        if (iA044 == 1) {
                            c1083Mj.A09(5);
                        } else if (iA044 == 2) {
                            c1083Mj.A09(12);
                        } else if (iA044 == 3) {
                            int iA045 = c1083Mj.A04(5);
                            if (c1083Mj.A0H()) {
                                c1083Mj.A09(5);
                                if (c1083Mj.A0H()) {
                                    i21 = 4;
                                    c1083Mj.A09(4);
                                } else {
                                    i21 = 4;
                                }
                                boolean zA0H4 = c1083Mj.A0H();
                                String[] strArr4 = A01;
                                if (strArr4[6].charAt(12) == strArr4[4].charAt(12)) {
                                    String[] strArr5 = A01;
                                    strArr5[6] = "eYTZ9FAJC6g3r5QlXUdHIVgwGuo33fxX";
                                    strArr5[4] = "4WtQFZ4AOvjhrFiBGrnRSJrjKovPQlYh";
                                    if (zA0H4) {
                                        c1083Mj.A09(i21);
                                    }
                                    if (c1083Mj.A0H()) {
                                        c1083Mj.A09(i21);
                                    }
                                    if (c1083Mj.A0H()) {
                                        c1083Mj.A09(i21);
                                    }
                                    boolean zA0H5 = c1083Mj.A0H();
                                    if (A01[5].length() != 26) {
                                        throw new RuntimeException();
                                    }
                                    A01[7] = "cwN6x9xzqXnJ7GnDfdo";
                                    if (zA0H5) {
                                        c1083Mj.A09(i21);
                                    }
                                    if (c1083Mj.A0H()) {
                                        c1083Mj.A09(i21);
                                    }
                                    if (c1083Mj.A0H()) {
                                        c1083Mj.A09(i21);
                                    }
                                    if (c1083Mj.A0H()) {
                                        if (c1083Mj.A0H()) {
                                            c1083Mj.A09(i21);
                                        }
                                        if (c1083Mj.A0H()) {
                                            c1083Mj.A09(i21);
                                        }
                                    }
                                }
                            }
                            if (c1083Mj.A0H()) {
                                c1083Mj.A09(5);
                                if (c1083Mj.A0H()) {
                                    c1083Mj.A09(7);
                                    if (c1083Mj.A0H()) {
                                        c1083Mj.A09(8);
                                    }
                                }
                            }
                            c1083Mj.A09((iA045 + 2) * 8);
                            c1083Mj.A06();
                        }
                        if (iA043 < 2) {
                            if (c1083Mj.A0H()) {
                                c1083Mj.A09(14);
                            }
                            if (iA043 == 0 && c1083Mj.A0H()) {
                                c1083Mj.A09(14);
                            }
                        }
                        boolean zA0H6 = c1083Mj.A0H();
                        String[] strArr6 = A01;
                        if (strArr6[3].length() != strArr6[0].length()) {
                            A01[2] = "MvqqTd6CmuSu7hX9DU0QYIvgEbloyqWM";
                            if (zA0H6) {
                                if (iA04 == 0) {
                                    c1083Mj.A09(5);
                                } else {
                                    for (int i23 = 0; i23 < i14; i23++) {
                                        if (c1083Mj.A0H()) {
                                            c1083Mj.A09(5);
                                        }
                                    }
                                }
                            }
                        } else if (zA0H6) {
                        }
                        return new C1365Yc(strA0A, i22, i13, i11, iA00, i12, iA01);
                    }
                    throw new RuntimeException();
                }
            }
            if (c1083Mj.A0H()) {
                c1083Mj.A09(5);
                if (iA043 == 2) {
                    c1083Mj.A09(4);
                }
                if (iA043 >= 6) {
                    c1083Mj.A09(2);
                }
                if (c1083Mj.A0H()) {
                    i17 = 8;
                    c1083Mj.A09(8);
                } else {
                    i17 = 8;
                }
                if (iA043 == 0 && c1083Mj.A0H()) {
                    c1083Mj.A09(i17);
                }
                i15 = 3;
                if (iA042 < 3) {
                    c1083Mj.A07();
                }
            } else {
                i15 = 3;
            }
            if (i22 == 0 && iA04 != i15) {
                c1083Mj.A07();
            }
            if (A01[1].length() != 14) {
                A01[1] = "Z9618LWPgCMtBu";
                if (i22 == 2) {
                    if (iA04 == i15 || c1083Mj.A0H()) {
                        i16 = 6;
                        c1083Mj.A09(6);
                    } else {
                        i16 = 6;
                    }
                } else {
                    i16 = 6;
                }
            } else {
                A01[2] = "PiCuKe2A5ED2hDq";
                if (i22 == 2) {
                }
            }
            strA0A = A0A(9, 10, 11);
            if (c1083Mj.A0H() && c1083Mj.A04(i16) == 1 && c1083Mj.A04(8) == 1) {
                if (A01[2].length() != 16) {
                    A01[7] = "SwXJl1C3a17owwygpEy";
                    strA0A = A0A(19, 14, 30);
                } else {
                    strA0A = A0A(19, 14, 30);
                }
            }
            return new C1365Yc(strA0A, i22, i13, i11, iA00, i12, iA01);
        }
        strA0A = A0A(0, 9, 52);
        c1083Mj.A09(32);
        int iA046 = c1083Mj.A04(2);
        if (A01[1].length() != 14) {
            String[] strArr7 = A01;
            strArr7[6] = "TJf1TqBSk5yCr5Bsr6bjmSUuZ0GrTmB0";
            strArr7[4] = "CpaKJiVdHIrXrwpBXDl9ZQbkkWKOHOxl";
            if (iA046 == 3) {
                strA0A = null;
            }
            int iA047 = c1083Mj.A04(6);
            iA01 = A02[iA047 / 2] * 1000;
            iA00 = A00(iA046, iA047);
            if (A01[5].length() == 26) {
                A01[2] = b.f42142b;
                c1083Mj.A09(8);
                int iA048 = c1083Mj.A04(3);
                if ((iA048 & 1) != 0 && iA048 != 1) {
                    i5 = 2;
                    c1083Mj.A09(2);
                } else {
                    i5 = 2;
                }
                int i24 = iA048 & 4;
                if (A01[7].length() == 19) {
                    A01[2] = "kU8P9";
                    if (i24 != 0) {
                        c1083Mj.A09(i5);
                    }
                    if (iA048 == i5) {
                        c1083Mj.A09(i5);
                    }
                    i11 = iA046 < A05.length ? A05[iA046] : -1;
                    i12 = 1536;
                    i13 = A04[iA048] + (c1083Mj.A0H() ? 1 : 0);
                    return new C1365Yc(strA0A, i22, i13, i11, iA00, i12, iA01);
                }
            }
            throw new RuntimeException();
        }
        String[] strArr8 = A01;
        strArr8[3] = "KewUe4EeMrj1h5Hh1BX7K";
        strArr8[0] = "5UtVxNksJXP3adt6hUPeix";
        if (iA046 == 3) {
        }
        int iA0472 = c1083Mj.A04(6);
        iA01 = A02[iA0472 / 2] * 1000;
        iA00 = A00(iA046, iA0472);
        if (A01[5].length() == 26) {
        }
        throw new RuntimeException();
    }
}
