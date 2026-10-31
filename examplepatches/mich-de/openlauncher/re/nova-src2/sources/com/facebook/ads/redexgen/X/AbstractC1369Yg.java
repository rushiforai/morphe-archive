package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Yg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1369Yg {
    public static byte[] A00;
    public static String[] A01 = {"imRiVJMXc4SZWZ3QF4KZhVfgmTG74Bx6", "TKTPIiZZWa9SThJfc", "A7KzpJx3Wk4oG2yt7ajGdVAH98sppej4", "IOrzIYYjcAtAJh", "0UHCQx5ZqnE0yq", "IZiHjia3uwt4n4b3PzA3ciBQItqIkJHo", "fER0trA7btID3ir", "lpP13lDDXmkolxPGNEllOpMJaT"};
    public static final int[] A02;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1368Yf A04(C1083Mj c1083Mj) {
        int iA04 = c1083Mj.A04(16);
        int iA042 = c1083Mj.A04(16);
        int i5 = 0 + 2 + 2;
        if (iA042 == 65535) {
            iA042 = c1083Mj.A04(24);
            i5 += 3;
        }
        int i11 = iA042 + i5;
        String[] strArr = A01;
        if (strArr[4].length() == strArr[3].length()) {
            A01[0] = "Gg6kPH8l";
            if (iA04 == 44097) {
                i11 += 2;
            }
            int iA043 = c1083Mj.A04(2);
            if (iA043 == 3) {
                iA043 += A00(c1083Mj, 2);
            }
            int iA044 = c1083Mj.A04(10);
            if (c1083Mj.A0H()) {
                int iA045 = c1083Mj.A04(3);
                String[] strArr2 = A01;
                if (strArr2[2].charAt(7) == strArr2[5].charAt(7)) {
                    String[] strArr3 = A01;
                    strArr3[4] = "ayuLqZobphgEmr";
                    strArr3[3] = "NfuHHN0k5dTWhX";
                    if (iA045 > 0) {
                        c1083Mj.A09(2);
                    }
                }
            }
            int i12 = c1083Mj.A0H() ? 48000 : 44100;
            int iA046 = c1083Mj.A04(4);
            int i13 = 0;
            if (i12 != 44100 || iA046 != 13) {
                if (i12 == 48000 && iA046 < A02.length) {
                    i13 = A02[iA046];
                    switch (iA044 % 5) {
                        case 1:
                        case 3:
                            if (iA046 == 3 || iA046 == 8) {
                                i13++;
                                break;
                            }
                        case 2:
                            if (iA046 == 8 || iA046 == 11) {
                                i13++;
                                if (A01[6].length() == 11) {
                                    throw new RuntimeException();
                                }
                                A01[7] = "8s5sCt1xBK7Wlyo4Q9R6ORZ54V";
                                break;
                            }
                        case 4:
                            if (iA046 == 3 || iA046 == 8 || iA046 == 11) {
                                i13++;
                                break;
                            }
                    }
                }
            } else {
                i13 = A02[iA046];
            }
            return new C1368Yf(iA043, 2, i12, i11, i13);
        }
        throw new RuntimeException();
    }

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 24);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A00 = new byte[]{-95, -75, -92, -87, -81, 111, -95, -93, 116};
    }

    static {
        A06();
        A02 = new int[]{2002, 2000, 1920, 1601, 1600, 1001, 1000, 960, 800, 800, 480, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 2048};
    }

    public static int A00(C1083Mj c1083Mj, int i5) {
        int i11 = 0;
        while (true) {
            int value = c1083Mj.A04(i5);
            int i12 = i11 + value;
            if (!c1083Mj.A0H()) {
                return i12;
            }
            i11 = (i12 + 1) << i5;
        }
    }

    public static int A01(ByteBuffer byteBuffer) {
        byte[] bArr = new byte[16];
        int iPosition = byteBuffer.position();
        byteBuffer.get(bArr);
        byteBuffer.position(iPosition);
        return A04(new C1083Mj(bArr)).A03;
    }

    public static int A02(byte[] bArr, int i5) {
        if (bArr.length < 7) {
            return -1;
        }
        int headerSize = bArr[2];
        int i11 = (headerSize & 255) << 8;
        int headerSize2 = bArr[3];
        int i12 = i11 | (headerSize2 & 255);
        int frameSize = 2 + 2;
        if (i12 == 65535) {
            int headerSize3 = bArr[4];
            int i13 = (headerSize3 & 255) << 16;
            int headerSize4 = bArr[5];
            int i14 = i13 | ((headerSize4 & 255) << 8);
            int headerSize5 = bArr[6];
            i12 = i14 | (headerSize5 & 255);
            frameSize += 3;
        }
        if (i5 == 44097) {
            frameSize += 2;
        }
        int i15 = i12 + frameSize;
        if (A01[1].length() == 3) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[4] = "iVzOvX0cBgopOX";
        strArr[3] = "PteoiuDwHidTEn";
        return i15;
    }

    public static VC A03(C1084Mk c1084Mk, String str, String str2, DrmInitData drmInitData) {
        c1084Mk.A0g(1);
        return new C1029Ke().A0y(str).A11(A05(0, 9, 40)).A0b(2).A0m(((c1084Mk.A0I() & 32) >> 5) == 1 ? 48000 : 44100).A0u(drmInitData).A10(str2).A14();
    }

    public static void A07(int i5, C1084Mk c1084Mk) {
        c1084Mk.A0d(7);
        byte[] bArrA0l = c1084Mk.A0l();
        bArrA0l[0] = -84;
        bArrA0l[1] = 64;
        bArrA0l[2] = -1;
        bArrA0l[3] = -1;
        bArrA0l[4] = (byte) ((i5 >> 16) & 255);
        bArrA0l[5] = (byte) ((i5 >> 8) & 255);
        bArrA0l[6] = (byte) (i5 & 255);
    }
}
