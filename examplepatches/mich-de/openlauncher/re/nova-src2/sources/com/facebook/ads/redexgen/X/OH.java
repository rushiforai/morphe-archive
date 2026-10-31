package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.io.EOFException;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class OH implements InterfaceC1383Yv {
    public static byte[] A0C;
    public static String[] A0D = {"F9tU3fP4bS75Ai6N0xcHreCr1t", "e0mcG9nK", "uPW5Tfa1SV", "2zghnPZ5MvpUZv9vym", "bDS3GVUL9EkDIh7pewT1jUPQV6vbxBj8", "SJTtxKjmk6RM84gHd2FPzBanjkvoN1bO", "uq2IBIssOIBH5LGogXLo5bvXyy9LVYIy", "s0E918xjklYSc5ojfCo8j66VkU"};
    public static final InterfaceC1387Yz A0E;
    public int A00;
    public long A01;
    public long A02;
    public InterfaceC1384Yw A03;
    public boolean A04;
    public boolean A05;
    public boolean A06;
    public final int A07;
    public final C1083Mj A08;
    public final C1084Mk A09;
    public final C1084Mk A0A;
    public final OG A0B;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 60);
            if (A0D[4].charAt(0) != 'b') {
                throw new RuntimeException();
            }
            A0D[1] = "uIPObzg7";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0C = new byte[]{-115, -95, -84, -90, -81, -78, -83, -91, -92, 96, -127, -124, -108, -109, 96, -77, -76, -78, -91, -95, -83};
    }

    static {
        A04();
        A0E = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.OI
            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final InterfaceC1383Yv[] A5w() {
                return OH.A07();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
                return AbstractC1386Yy.A01(this, uri, map);
            }
        };
    }

    public OH() {
        this(0);
    }

    public OH(int i5) {
        this.A07 = (i5 & 2) != 0 ? i5 | 1 : i5;
        this.A0B = new OG(true);
        this.A09 = new C1084Mk(2048);
        this.A00 = -1;
        this.A01 = -1L;
        this.A0A = new C1084Mk(10);
        this.A08 = new C1083Mj(this.A0A.A0l());
    }

    public static int A00(int i5, long j11) {
        return (int) (((i5 * 8) * 1000000) / j11);
    }

    private int A01(Q9 q92) throws IOException {
        int i5 = 0;
        while (true) {
            q92.AI6(this.A0A.A0l(), 0, 10);
            this.A0A.A0f(0);
            if (this.A0A.A0K() != 4801587) {
                break;
            }
            this.A0A.A0g(3);
            int length = this.A0A.A0H();
            int firstFramePosition = length + 10;
            i5 += firstFramePosition;
            q92.A4X(length);
        }
        q92.AK3();
        q92.A4X(i5);
        if (this.A01 == -1) {
            this.A01 = i5;
        }
        return i5;
    }

    private QI A02(long j11, boolean z11) {
        return new QI(j11, this.A01, A00(this.A00, this.A0B.A0J()), this.A00, z11);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0045  */
    @RequiresNonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A05(long j11, boolean z11) {
        if (this.A05) {
            return;
        }
        boolean z12 = (this.A07 & 1) != 0 && this.A00 > 0;
        if (z12 && this.A0B.A0J() == -9223372036854775807L && !z11) {
            return;
        }
        if (z12) {
            long jA0J = this.A0B.A0J();
            if (A0D[4].charAt(0) != 'b') {
                throw new RuntimeException();
            }
            A0D[2] = "OEHF76Qkx8";
            if (jA0J == -9223372036854775807L) {
                this.A03.AKP(new Q4(-9223372036854775807L));
            } else {
                this.A03.AKP(A02(j11, (this.A07 & 2) != 0));
            }
        }
        this.A05 = true;
    }

    private void A06(Q9 q92) throws IOException {
        if (this.A04) {
            return;
        }
        this.A00 = -1;
        q92.AK3();
        if (q92.A9Q() == 0) {
            A01(q92);
        }
        int currentFrameSize = 0;
        if (A0D[6].charAt(1) != 'q') {
            throw new RuntimeException();
        }
        A0D[5] = "N5VSOvNSp6UcrBwxQjBkSgFK0Xta8zYN";
        long j11 = 0;
        while (true) {
            try {
                if (!q92.AI7(this.A0A.A0l(), 0, 2, true)) {
                    break;
                }
                this.A0A.A0f(0);
                if (OG.A0F(this.A0A.A0M())) {
                    if (!q92.AI7(this.A0A.A0l(), 0, 4, true)) {
                        break;
                    }
                    this.A08.A08(14);
                    int iA04 = this.A08.A04(13);
                    if (iA04 <= 6) {
                        this.A04 = true;
                        throw L9.A01(A03(0, 21, 4), null);
                    }
                    j11 += iA04;
                    currentFrameSize++;
                    if (currentFrameSize == 1000 || !q92.A4Y(iA04 - 6, true)) {
                        break;
                    }
                } else {
                    currentFrameSize = 0;
                    break;
                }
            } catch (EOFException unused) {
            }
        }
        q92.AK3();
        if (currentFrameSize > 0) {
            this.A00 = (int) (j11 / currentFrameSize);
        } else {
            this.A00 = -1;
        }
        this.A04 = true;
    }

    public static /* synthetic */ InterfaceC1383Yv[] A07() {
        return new InterfaceC1383Yv[]{new OH()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A03 = interfaceC1384Yw;
        this.A0B.A6B(interfaceC1384Yw, new C1601d2(0, 1));
        interfaceC1384Yw.A6x();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        AbstractC1062Ln.A02(this.A03);
        long inputLength = q92.A90();
        if (((this.A07 & 2) == 0 && ((this.A07 & 1) == 0 || inputLength == -1)) ? false : true) {
            A06(q92);
        }
        int i5 = q92.read(this.A09.A0l(), 0, 2048);
        boolean canUseConstantBitrateSeeking = i5 == -1;
        A05(inputLength, canUseConstantBitrateSeeking);
        if (canUseConstantBitrateSeeking) {
            return -1;
        }
        this.A09.A0f(0);
        this.A09.A0e(i5);
        boolean z11 = this.A06;
        if (A0D[1].length() != 8) {
            throw new RuntimeException();
        }
        A0D[6] = "AqaLiJXQzgm3pUXyquw54MLj08tQrNbC";
        if (!z11) {
            this.A0B.AI3(this.A02, 4);
            this.A06 = true;
        }
        this.A0B.A5j(this.A09);
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        this.A06 = false;
        this.A0B.AKN();
        this.A02 = j12;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        int iA01 = A01(q92);
        int frameSize = iA01;
        int syncBytes = 0;
        int validFramesCount = 0;
        do {
            q92.AI6(this.A0A.A0l(), 0, 2);
            this.A0A.A0f(0);
            int startPosition = this.A0A.A0M();
            if (!OG.A0F(startPosition)) {
                validFramesCount = 0;
                syncBytes = 0;
                frameSize++;
                q92.AK3();
                q92.A4X(frameSize);
            } else {
                validFramesCount++;
                if (validFramesCount >= 4 && syncBytes > 188) {
                    return true;
                }
                q92.AI6(this.A0A.A0l(), 0, 4);
                this.A08.A08(14);
                int headerPosition = this.A08.A04(13);
                if (headerPosition <= 6) {
                    validFramesCount = 0;
                    syncBytes = 0;
                    frameSize++;
                    q92.AK3();
                    q92.A4X(frameSize);
                } else {
                    int startPosition2 = headerPosition - 6;
                    q92.A4X(startPosition2);
                    syncBytes += headerPosition;
                }
            }
        } while (frameSize - iA01 < 8192);
        return false;
    }
}
