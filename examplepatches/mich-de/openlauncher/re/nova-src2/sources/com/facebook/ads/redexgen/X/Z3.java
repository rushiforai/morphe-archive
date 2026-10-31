package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.androidx.media3.extractor.metadata.flac.PictureFrame;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@MetaExoPlayerCustomization
/* loaded from: assets/audience_network/classes.dex */
public abstract class Z3 {
    public static byte[] A00;
    public static String[] A01 = {"Ry3gMVv", "6xGVwR0oRwghdqwUuSJoM47l", "D1pq21csLFB6Zxw6b42SHHjLWqZULyC3", "CKhQuXQ7bHs2TpHHeYMVD7MNsf5fJ2Xc", "tQR", "IHkDg2mA5Zt9bZKJqvxsmCTyu5o5zDPj", "kf7riUET3ZKhKtoxlN7hgd2qiUxnIzwy", "is9Y"};

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 92);
            String[] strArr = A01;
            if (strArr[3].charAt(0) == strArr[2].charAt(0)) {
                throw new RuntimeException();
            }
            A01[0] = "b2WW8XJ";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A00 = new byte[]{14, 41, 33, 36, 45, 44, 104, 60, 39, 104, 58, 45, 41, 44, 104, 14, 4, 9, 11, 104, 59, 60, 58, 45, 41, 37, 104, 37, 41, 58, 35, 45, 58, 102, 102, 73, 82, 83, 84, 0, 70, 82, 65, 77, 69, 0, 68, 79, 69, 83, 0, 78, 79, 84, 0, 83, 84, 65, 82, 84, 0, 87, 73, 84, 72, 0, 83, 89, 78, 67, 0, 67, 79, 68, 69, 14};
        if (A01[7].length() != 4) {
            throw new RuntimeException();
        }
        A01[4] = "K25";
    }

    static {
        A08();
    }

    public static int A00(Q9 q92) throws IOException {
        q92.AK3();
        C1084Mk c1084Mk = new C1084Mk(2);
        q92.AI6(c1084Mk.A0l(), 0, 2);
        int syncCode = c1084Mk.A0M();
        int frameStartMarker = syncCode >> 2;
        if (frameStartMarker == 16382) {
            q92.AK3();
            return syncCode;
        }
        q92.AK3();
        throw L9.A01(A06(34, 42, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), null);
    }

    public static Metadata A01(Q9 q92, boolean z11) throws IOException {
        InterfaceC1414a0 id3FramePredicate;
        if (z11) {
            id3FramePredicate = null;
        } else {
            id3FramePredicate = C8V.A03;
        }
        Metadata metadataA00 = new Z8().A00(q92, id3FramePredicate);
        if (metadataA00 == null || metadataA00.A02() == 0) {
            return null;
        }
        return metadataA00;
    }

    public static Metadata A02(Q9 q92, boolean z11) throws IOException {
        q92.AK3();
        long jA9L = q92.A9L();
        Metadata metadataA01 = A01(q92, z11);
        q92.ALL((int) (q92.A9L() - jA9L));
        return metadataA01;
    }

    public static Z4 A03(C1084Mk c1084Mk) {
        c1084Mk.A0g(1);
        int iA0K = c1084Mk.A0K();
        int length = c1084Mk.A09();
        long j11 = length + iA0K;
        int i5 = iA0K / 18;
        long[] jArrCopyOf = new long[i5];
        long[] pointOffsets = new long[i5];
        int i11 = 0;
        while (true) {
            if (i11 >= i5) {
                break;
            }
            long jA0P = c1084Mk.A0P();
            if (A01[1].length() != 24) {
                throw new RuntimeException();
            }
            A01[7] = "kE7x";
            if (jA0P == -1) {
                jArrCopyOf = Arrays.copyOf(jArrCopyOf, i11);
                pointOffsets = Arrays.copyOf(pointOffsets, i11);
                break;
            }
            jArrCopyOf[i11] = jA0P;
            pointOffsets[i11] = c1084Mk.A0P();
            c1084Mk.A0g(2);
            i11++;
        }
        int length2 = c1084Mk.A09();
        c1084Mk.A0g((int) (j11 - length2));
        return new Z4(jArrCopyOf, pointOffsets);
    }

    public static Z4 A04(Q9 q92, int i5) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(i5);
        q92.readFully(c1084Mk.A0l(), 0, i5);
        return A03(c1084Mk);
    }

    public static Z5 A05(Q9 q92) throws IOException {
        byte[] bArr = new byte[38];
        q92.readFully(bArr, 0, 38);
        return new Z5(bArr, 4);
    }

    public static List<String> A07(Q9 q92, int i5) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(i5);
        q92.readFully(c1084Mk.A0l(), 0, i5);
        c1084Mk.A0g(4);
        return Arrays.asList(ZW.A05(c1084Mk, false, false).A02);
    }

    public static void A09(Q9 q92) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(4);
        q92.readFully(c1084Mk.A0l(), 0, 4);
        if (c1084Mk.A0Q() == 1716281667) {
        } else {
            throw L9.A01(A06(0, 34, 20), null);
        }
    }

    public static boolean A0A(Q9 q92) throws IOException {
        C1084Mk c1084Mk = new C1084Mk(4);
        q92.AI6(c1084Mk.A0l(), 0, 4);
        return c1084Mk.A0Q() == 1716281667;
    }

    public static boolean A0B(Q9 q92, Z2 z22) throws IOException {
        q92.AK3();
        C1083Mj c1083Mj = new C1083Mj(new byte[4]);
        q92.AI6(c1083Mj.A00, 0, 4);
        boolean zA0H = c1083Mj.A0H();
        int iA04 = c1083Mj.A04(7);
        int iA042 = c1083Mj.A04(24) + 4;
        if (iA04 == 0) {
            z22.A00 = A05(q92);
        } else {
            Z5 z52 = z22.A00;
            if (z52 != null) {
                if (iA04 != 3) {
                    if (iA04 == 4) {
                        z22.A00 = z52.A0B(A07(q92, iA042));
                    } else if (iA04 == 6) {
                        C1084Mk c1084Mk = new C1084Mk(iA042);
                        q92.readFully(c1084Mk.A0l(), 0, iA042);
                        c1084Mk.A0g(4);
                        PictureFrame pictureFrame = PictureFrame.A00(c1084Mk);
                        z22.A00 = z52.A0A(XR.A03(pictureFrame));
                    } else {
                        q92.ALL(iA042);
                    }
                } else {
                    z22.A00 = z52.A09(A04(q92, iA042));
                }
            } else {
                throw new IllegalArgumentException();
            }
        }
        return zA0H;
    }
}
