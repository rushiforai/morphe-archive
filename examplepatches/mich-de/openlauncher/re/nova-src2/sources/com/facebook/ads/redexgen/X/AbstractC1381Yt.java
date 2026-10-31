package com.facebook.ads.redexgen.X;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Yt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1381Yt {
    public static byte[] A00;
    public static String[] A01 = {"XD1VVcqNSBFJbwW6eHZsmBMHnupZn01K", "N1oSAR1IK", "3lVSFIQXYXjEQOPdqX0UeKbtKj53aBPQ", "aHeQsfUZHyw0JkmIGhjZxkVg5EpF", "gRNVicHale59LaAXZrmmSJnj5ElYjvrb", "a7fW6ld7vJRE7ntXdjWzxUPW8W6dKgcq", "BA3H9nXCXT8w4D4Bib1SSz39xArljIew", "zOC5JwQQuoKAyO9HRsx"};
    public static final int[] A02;
    public static final int[] A03;
    public static final int[] A04;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] - i12) - 26;
            if (A01[4].charAt(15) != 'X') {
                throw new RuntimeException();
            }
            A01[4] = "AJoXbhRQuybif1WXqT0ioUQAqPv2Quyv";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A00 = new byte[]{-70, -50, -67, -62, -56, -120, -49, -57, -67, -121, -67, -51, -52};
    }

    static {
        A06();
        A02 = new int[]{1, 2, 2, 2, 2, 3, 3, 4, 4, 5, 6, 6, 6, 7, 8, 8};
        A03 = new int[]{-1, 8000, 16000, 32000, -1, -1, 11025, 22050, 44100, -1, -1, 12000, 24000, 48000, -1, -1};
        A04 = new int[]{64, 112, 128, 192, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 256, 384, 448, EventBridgeChannel.QUEUE_CAPACITY, 640, 768, 896, 1024, 1152, 1280, 1536, 1920, 2048, 2304, 2560, 2688, 2816, 2823, 2944, 3072, 3840, androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT, 6144, 7680};
    }

    public static int A00(ByteBuffer byteBuffer) {
        int nblks;
        int iPosition = byteBuffer.position();
        int position = byteBuffer.get(iPosition);
        switch (position) {
            case -2:
                int position2 = iPosition + 5;
                int i5 = (byteBuffer.get(position2) & 1) << 6;
                int position3 = iPosition + 4;
                nblks = i5 | ((byteBuffer.get(position3) & 252) >> 2);
                break;
            case -1:
                int position4 = iPosition + 4;
                int i11 = (byteBuffer.get(position4) & 7) << 4;
                int position5 = iPosition + 7;
                nblks = i11 | ((byteBuffer.get(position5) & 60) >> 2);
                break;
            case 31:
                int position6 = iPosition + 5;
                int i12 = (byteBuffer.get(position6) & 7) << 4;
                int position7 = iPosition + 6;
                nblks = i12 | ((byteBuffer.get(position7) & 60) >> 2);
                break;
            default:
                int position8 = iPosition + 4;
                int i13 = (byteBuffer.get(position8) & 1) << 6;
                int position9 = iPosition + 5;
                nblks = i13 | ((byteBuffer.get(position9) & 252) >> 2);
                break;
        }
        int i14 = nblks + 1;
        String[] strArr = A01;
        String str = strArr[0];
        String str2 = strArr[6];
        int nblks2 = str.charAt(13);
        int position10 = str2.charAt(13);
        if (nblks2 == position10) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[0] = "0PGqiVran1cRjQqCheO3Ah5n2J7tLg40";
        strArr2[6] = "TkdEi1fiF4is4vTW1kKg89pxvAF4cNNG";
        int position11 = i14 * 32;
        return position11;
    }

    public static int A01(byte[] bArr) {
        int i5;
        boolean z11 = false;
        switch (bArr[0]) {
            case -2:
                i5 = (((bArr[4] & 3) << 12) | ((bArr[7] & 255) << 4) | ((bArr[6] & 240) >> 4)) + 1;
                break;
            case -1:
                i5 = (((bArr[7] & 3) << 12) | ((bArr[6] & 255) << 4) | ((bArr[9] & 60) >> 2)) + 1;
                z11 = true;
                break;
            case 31:
                i5 = (((bArr[6] & 3) << 12) | ((bArr[7] & 255) << 4) | ((bArr[8] & 60) >> 2)) + 1;
                z11 = true;
                break;
            default:
                i5 = (((bArr[5] & 3) << 12) | ((bArr[6] & 255) << 4) | ((bArr[7] & 240) >> 4)) + 1;
                break;
        }
        return z11 ? (i5 * 16) / 14 : i5;
    }

    public static int A02(byte[] bArr) {
        int i5;
        switch (bArr[0]) {
            case -2:
                int nblks = bArr[5];
                i5 = ((nblks & 1) << 6) | ((bArr[4] & 252) >> 2);
                break;
            case -1:
                i5 = ((bArr[4] & 7) << 4) | ((bArr[7] & 60) >> 2);
                break;
            case 31:
                i5 = ((bArr[5] & 7) << 4) | ((bArr[6] & 60) >> 2);
                break;
            default:
                i5 = ((bArr[4] & 1) << 6) | ((bArr[5] & 252) >> 2);
                break;
        }
        int nblks2 = i5 + 1;
        return nblks2 * 32;
    }

    public static VC A03(byte[] bArr, String str, String str2, DrmInitData drmInitData) {
        int i5;
        C1083Mj c1083MjA04 = A04(bArr);
        c1083MjA04.A09(60);
        int amode = c1083MjA04.A04(6);
        int bitrate = A02[amode];
        int amode2 = c1083MjA04.A04(4);
        int rate = A03[amode2];
        int amode3 = c1083MjA04.A04(5);
        if (amode3 >= A04.length) {
            i5 = -1;
        } else {
            i5 = (A04[amode3] * 1000) / 2;
        }
        c1083MjA04.A09(10);
        int amode4 = c1083MjA04.A04(2);
        int amode5 = amode4 > 0 ? 1 : 0;
        return new C1029Ke().A0y(str).A11(A05(0, 13, 63)).A0a(i5).A0b(bitrate + amode5).A0m(rate).A0u(drmInitData).A10(str2).A14();
    }

    public static C1083Mj A04(byte[] bArr) {
        if (bArr[0] == 127) {
            return new C1083Mj(bArr);
        }
        byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
        if (A08(bArrCopyOf)) {
            for (int i5 = 0; i5 < bArrCopyOf.length - 1; i5 += 2) {
                byte b11 = bArrCopyOf[i5];
                bArrCopyOf[i5] = bArrCopyOf[i5 + 1];
                bArrCopyOf[i5 + 1] = b11;
            }
        }
        C1083Mj c1083Mj = new C1083Mj(bArrCopyOf);
        if (bArrCopyOf[0] == 31) {
            C1083Mj c1083Mj2 = new C1083Mj(bArrCopyOf);
            while (c1083Mj2.A01() >= 16) {
                c1083Mj2.A09(2);
                c1083Mj.A0B(c1083Mj2.A04(14), 14);
            }
        }
        c1083Mj.A0D(bArrCopyOf);
        return c1083Mj;
    }

    public static boolean A07(int i5) {
        return i5 == 2147385345 || i5 == -25230976 || i5 == 536864768 || i5 == -14745368;
    }

    public static boolean A08(byte[] bArr) {
        return bArr[0] == -2 || bArr[0] == -1;
    }
}
