package com.facebook.ads.redexgen.X;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Nb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1101Nb implements InterfaceC1606d7 {
    public static byte[] A0C;
    public static String[] A0D = {"xgqBqbU1XML8MXuRXE4S7UmkN", "kb50toKDVAzxYsngbeDc9BGJqZef", "PGCQuAERcngW9jWlLyuZZy", "T3TROYLJmY5zk4R", "KehPbga1IBYQXhYvCr7BlOXMomub", "y47SMef1vKWEbtVOrFSLXbM9LHV6ysDN", "9RD3pOa8CandyoHHIXY9O0kMIUxxMIgb", "xRKTiYi6sdeRaVW0V14xq888HcEdA0Ww"};
    public static final int[] A0E;
    public static final int[] A0F;
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public final int A04;
    public final int A05;
    public final VC A06;
    public final C1084Mk A07;
    public final InterfaceC1384Yw A08;
    public final ZP A09;
    public final C1608d9 A0A;
    public final byte[] A0B;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0C = new byte[]{56, 35, 100, 108, 119, 57, 35, 85, 104, 96, 117, 115, 100, 117, 116, 48, 118, 98, 113, 125, 117, 99, 48, 96, 117, 98, 48, 114, 124, AbstractJsonLexerKt.TC_INVALID, 115, 123, 42, 48, 58, 46, 63, 50, 52, 116, 41, 58, 44};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private void A06(byte[] bArr, int i5, int i11, byte[] bArr2) {
        int i12 = this.A0A.A02;
        int i13 = this.A0A.A05;
        int i14 = (i11 * 4) + (i5 * i12);
        int i15 = (i13 * 4) + i14;
        int i16 = (i12 / i13) - 4;
        int iA07 = ((bArr[i14 + 1] & 255) << 8) | (bArr[i14] & 255);
        int iMin = Math.min(bArr[i14 + 2] & 255, 88);
        int i17 = A0F[iMin];
        int i18 = ((this.A04 * i5 * i13) + i11) * 2;
        bArr2[i18] = (byte) (iA07 & 255);
        bArr2[i18 + 1] = (byte) (iA07 >> 8);
        for (int i19 = 0; i19 < i16 * 2; i19++) {
            int i21 = bArr[((i19 / 8) * i13 * 4) + i15 + ((i19 / 2) % 4)] & 255;
            int i22 = i19 % 2 == 0 ? i21 & 15 : i21 >> 4;
            int i23 = ((((i22 & 7) * 2) + 1) * i17) >> 3;
            if ((i22 & 8) != 0) {
                i23 = -i23;
            }
            iA07 = N1.A07(iA07 + i23, -32768, 32767);
            i18 += i13 * 2;
            bArr2[i18] = (byte) (iA07 & 255);
            bArr2[i18 + 1] = (byte) (iA07 >> 8);
            iMin = N1.A07(iMin + A0E[i22], 0, A0F.length - 1);
            i17 = A0F[iMin];
        }
    }

    static {
        A04();
        A0E = new int[]{-1, -1, -1, -1, 2, 4, 6, 8, -1, -1, -1, -1, 2, 4, 6, 8};
        A0F = new int[]{7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 19, 21, 23, 25, 28, 31, 34, 37, 41, 45, 50, 55, 60, 66, 73, 80, 88, 97, 107, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 143, 157, TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 190, Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 230, 253, 279, Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, 337, 371, TTAdConstant.DOWNLOAD_URL_CODE, 449, 494, 544, 598, 658, 724, 796, 876, 963, 1060, 1166, 1282, 1411, 1552, 1707, 1878, 2066, 2272, 2499, 2749, 3024, 3327, 3660, 4026, 4428, 4871, 5358, 5894, 6484, 7132, 7845, 8630, 9493, 10442, 11487, 12635, 13899, 15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794, 32767};
    }

    public C1101Nb(InterfaceC1384Yw interfaceC1384Yw, ZP zp2, C1608d9 c1608d9) throws L9 {
        this.A08 = interfaceC1384Yw;
        this.A09 = zp2;
        this.A0A = c1608d9;
        this.A05 = Math.max(1, c1608d9.A04 / 10);
        C1084Mk scratch = new C1084Mk(c1608d9.A06);
        scratch.A0G();
        this.A04 = scratch.A0G();
        int i5 = c1608d9.A05;
        int i11 = (((c1608d9.A02 - (i5 * 4)) * 8) / (c1608d9.A01 * i5)) + 1;
        if (this.A04 == i11) {
            int numChannels = N1.A05(this.A05, this.A04);
            this.A0B = new byte[c1608d9.A02 * numChannels];
            int maxBlocksToDecode = A02(this.A04, i5);
            this.A07 = new C1084Mk(maxBlocksToDecode * numChannels);
            int maxBlocksToDecode2 = c1608d9.A04;
            int constantBitrate = ((maxBlocksToDecode2 * c1608d9.A02) * 8) / this.A04;
            this.A06 = new C1029Ke().A11(A03(34, 9, 62)).A0a(constantBitrate).A0j(constantBitrate).A0h(A02(this.A05, i5)).A0b(c1608d9.A05).A0m(c1608d9.A04).A0i(2).A14();
            return;
        }
        throw L9.A01(A03(7, 27, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE) + i11 + A03(0, 7, 102) + this.A04, null);
    }

    private int A00(int i5) {
        return i5 / (this.A0A.A05 * 2);
    }

    private int A01(int i5) {
        return A02(i5, this.A0A.A05);
    }

    public static int A02(int i5, int i11) {
        return i5 * 2 * i11;
    }

    private void A05(int i5) {
        long jA0U = this.A03 + N1.A0U(this.A02, 1000000L, this.A0A.A04);
        int iA01 = A01(i5);
        this.A09.AKC(jA0U, 1, iA01, this.A01 - iA01, null);
        long timeUs = i5;
        this.A02 += timeUs;
        this.A01 -= iA01;
    }

    /* JADX WARN: Incorrect condition in loop: B:6:0x0008 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A07(byte[] bArr, int i5, C1084Mk c1084Mk) {
        for (int i11 = 0; i11 < i5; i11++) {
            for (int i12 = 0; i12 < blockIndex; i12++) {
                A06(bArr, i11, i12, c1084Mk.A0l());
                int channelIndex = A0D[2].length();
                if (channelIndex == 5) {
                    throw new RuntimeException();
                }
                String[] strArr = A0D;
                strArr[1] = "u6iJIXJ735wojqn9STyQG7ng6git";
                strArr[4] = "U0vZmzHfLPML8OPqR4VTMum7AlsS";
            }
        }
        int blockIndex = this.A04;
        int iA01 = A01(blockIndex * i5);
        c1084Mk.A0f(0);
        c1084Mk.A0e(iA01);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1606d7
    public final void AAm(int i5, long j11) {
        this.A08.AKP(new NR(this.A0A, this.A04, i5, j11));
        this.A09.A7E(this.A06);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1606d7
    public final void AK2(long j11) {
        this.A00 = 0;
        this.A03 = j11;
        this.A01 = 0;
        this.A02 = 0L;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1606d7
    public final boolean AKB(Q9 q92, long j11) throws IOException {
        int iA00 = this.A05 - A00(this.A01);
        int targetFramesRemaining = this.A04;
        int blocksToDecode = N1.A05(iA00, targetFramesRemaining);
        int i5 = this.A0A.A02 * blocksToDecode;
        boolean z11 = j11 == 0;
        while (!z11) {
            int targetFramesRemaining2 = this.A00;
            if (targetFramesRemaining2 >= i5) {
                break;
            }
            int targetFramesRemaining3 = this.A00;
            int targetReadBytes = (int) Math.min(i5 - targetFramesRemaining3, j11);
            byte[] bArr = this.A0B;
            int targetFramesRemaining4 = this.A00;
            int blocksToDecode2 = q92.read(bArr, targetFramesRemaining4, targetReadBytes);
            if (blocksToDecode2 == -1) {
                z11 = true;
            } else {
                int targetFramesRemaining5 = this.A00;
                this.A00 = targetFramesRemaining5 + blocksToDecode2;
            }
        }
        int targetReadBytes2 = this.A00;
        int targetFramesRemaining6 = this.A0A.A02;
        int targetReadBytes3 = targetReadBytes2 / targetFramesRemaining6;
        if (targetReadBytes3 > 0) {
            A07(this.A0B, targetReadBytes3, this.A07);
            int blocksToDecode3 = this.A00;
            int targetFramesRemaining7 = this.A0A.A02;
            this.A00 = blocksToDecode3 - (targetFramesRemaining7 * targetReadBytes3);
            int targetReadBytes4 = this.A07.A0A();
            this.A09.AK9(this.A07, targetReadBytes4);
            int targetFramesRemaining8 = this.A01;
            this.A01 = targetFramesRemaining8 + targetReadBytes4;
            int targetFramesRemaining9 = this.A01;
            int blocksToDecode4 = A00(targetFramesRemaining9);
            int targetFramesRemaining10 = this.A05;
            if (blocksToDecode4 >= targetFramesRemaining10) {
                int targetFramesRemaining11 = this.A05;
                A05(targetFramesRemaining11);
            }
        }
        if (z11) {
            int targetFramesRemaining12 = this.A01;
            int targetFramesRemaining13 = A00(targetFramesRemaining12);
            if (targetFramesRemaining13 > 0) {
                A05(targetFramesRemaining13);
            }
        }
        return z11;
    }
}
