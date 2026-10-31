package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collections;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class O4 implements InterfaceC1580ch {
    public static byte[] A0L;
    public static String[] A0M = {"a", "YcQyunl4KBbKId6", "jA36uGOFg4tVukmtWPixB5qZJf1b5Kys", "xYTcuFNTJijuxgcQusD0W3D2ZkS2SQ5k", "omtoIgecnfu4", "mKTz", "Kyg537US6MGr", "HzB3"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public int A08;
    public long A09;
    public long A0A;
    public VC A0C;
    public ZP A0D;
    public String A0E;
    public String A0F;
    public boolean A0G;
    public boolean A0H;
    public final String A0K;
    public final C1084Mk A0J = new C1084Mk(1024);
    public final C1083Mj A0I = new C1083Mj(this.A0J.A0l());
    public long A0B = -9223372036854775807L;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0L, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 31);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A0L = new byte[]{-17, 3, -14, -9, -3, -67, -5, -2, -62, -17, -69, -6, -17, 2, -5};
    }

    static {
        A04();
    }

    public O4(String str) {
        this.A0K = str;
    }

    private int A00(C1083Mj c1083Mj) throws L9 {
        int iA01 = c1083Mj.A01();
        YY config = YZ.A02(c1083Mj, true);
        this.A0E = config.A02;
        int bitsLeft = config.A01;
        this.A05 = bitsLeft;
        int bitsLeft2 = config.A00;
        this.A02 = bitsLeft2;
        int bitsLeft3 = c1083Mj.A01();
        return iA01 - bitsLeft3;
    }

    private int A01(C1083Mj c1083Mj) throws L9 {
        int tmp;
        int i5 = 0;
        int muxSlotLengthBytes = this.A03;
        if (muxSlotLengthBytes == 0) {
            do {
                tmp = c1083Mj.A04(8);
                i5 += tmp;
            } while (tmp == 255);
            return i5;
        }
        throw L9.A01(null, null);
    }

    public static long A02(C1083Mj c1083Mj) {
        int bytesForValue = c1083Mj.A04(2);
        return c1083Mj.A04((bytesForValue + 1) * 8);
    }

    private void A05(int i5) {
        this.A0J.A0d(i5);
        this.A0I.A0D(this.A0J.A0l());
    }

    @RequiresNonNull
    private void A06(C1083Mj c1083Mj) throws L9 {
        boolean useSameStreamMux = c1083Mj.A0H();
        if (useSameStreamMux) {
            boolean useSameStreamMux2 = this.A0H;
            if (!useSameStreamMux2) {
                return;
            }
        } else {
            if (A0M[1].length() != 15) {
                throw new RuntimeException();
            }
            String[] strArr = A0M;
            strArr[4] = "pVouzY3q8h7u";
            strArr[6] = "ctXwG72vGr0B";
            this.A0H = true;
            A08(c1083Mj);
        }
        if (this.A00 == 0) {
            if (this.A04 == 0) {
                A09(c1083Mj, A01(c1083Mj));
                String[] strArr2 = A0M;
                String str = strArr2[7];
                String str2 = strArr2[5];
                int muxSlotLengthBytes = str.length();
                if (muxSlotLengthBytes != str2.length()) {
                    String[] strArr3 = A0M;
                    strArr3[7] = "ldf9";
                    strArr3[5] = "kvML";
                    boolean useSameStreamMux3 = this.A0G;
                    if (!useSameStreamMux3) {
                        return;
                    }
                } else {
                    String[] strArr4 = A0M;
                    strArr4[7] = "PefU";
                    strArr4[5] = "AgEb";
                    boolean useSameStreamMux4 = this.A0G;
                    if (!useSameStreamMux4) {
                        return;
                    }
                }
                c1083Mj.A09((int) this.A09);
                return;
            }
            throw L9.A01(null, null);
        }
        throw L9.A01(null, null);
    }

    private void A07(C1083Mj c1083Mj) {
        this.A03 = c1083Mj.A04(3);
        switch (this.A03) {
            case 0:
                c1083Mj.A09(8);
                return;
            case 1:
                c1083Mj.A09(9);
                return;
            case 2:
            default:
                throw new IllegalStateException();
            case 3:
            case 4:
            case 5:
                c1083Mj.A09(6);
                return;
            case 6:
            case 7:
                c1083Mj.A09(1);
                return;
        }
    }

    @RequiresNonNull
    private void A08(C1083Mj c1083Mj) throws L9 {
        int iA04;
        boolean zA0H;
        int iA042 = c1083Mj.A04(1);
        if (iA042 == 1) {
            iA04 = c1083Mj.A04(1);
        } else {
            iA04 = 0;
        }
        this.A00 = iA04;
        if (this.A00 == 0) {
            if (iA042 == 1) {
                A02(c1083Mj);
            }
            if (c1083Mj.A0H()) {
                this.A04 = c1083Mj.A04(6);
                int audioMuxVersion = c1083Mj.A04(4);
                int iA043 = c1083Mj.A04(3);
                if (audioMuxVersion == 0 && iA043 == 0) {
                    if (iA042 == 0) {
                        int iA03 = c1083Mj.A03();
                        int audioMuxVersion2 = A00(c1083Mj);
                        c1083Mj.A08(iA03);
                        byte[] bArr = new byte[(audioMuxVersion2 + 7) / 8];
                        c1083Mj.A0F(bArr, 0, audioMuxVersion2);
                        VC vcA14 = new C1029Ke().A0y(this.A0F).A11(A03(0, 15, 111)).A0w(this.A0E).A0b(this.A02).A0m(this.A05).A12(Collections.singletonList(bArr)).A10(this.A0K).A14();
                        if (!vcA14.equals(this.A0C)) {
                            this.A0C = vcA14;
                            this.A0A = 1024000000 / vcA14.A0G;
                            this.A0D.A7E(vcA14);
                        }
                    } else {
                        int audioMuxVersion3 = (int) A02(c1083Mj);
                        c1083Mj.A09(audioMuxVersion3 - A00(c1083Mj));
                    }
                    A07(c1083Mj);
                    this.A0G = c1083Mj.A0H();
                    this.A09 = 0L;
                    if (this.A0G) {
                        if (iA042 == 1) {
                            this.A09 = A02(c1083Mj);
                        } else {
                            do {
                                zA0H = c1083Mj.A0H();
                                this.A09 = (this.A09 << 8) + c1083Mj.A04(8);
                            } while (zA0H);
                        }
                    }
                    boolean crcCheckPresent = c1083Mj.A0H();
                    if (crcCheckPresent) {
                        c1083Mj.A09(8);
                        return;
                    }
                    return;
                }
                throw L9.A01(null, null);
            }
            throw L9.A01(null, null);
        }
        throw L9.A01(null, null);
    }

    @RequiresNonNull
    private void A09(C1083Mj c1083Mj, int i5) {
        int iA03 = c1083Mj.A03();
        int bitPosition = iA03 & 7;
        if (bitPosition == 0) {
            int bitPosition2 = iA03 >> 3;
            this.A0J.A0f(bitPosition2);
        } else {
            int bitPosition3 = i5 * 8;
            c1083Mj.A0F(this.A0J.A0l(), 0, bitPosition3);
            this.A0J.A0f(0);
        }
        this.A0D.AK9(this.A0J, i5);
        if (this.A0B != -9223372036854775807L) {
            this.A0D.AKC(this.A0B, 1, i5, 0, null);
            this.A0B += this.A0A;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A5j(C1084Mk c1084Mk) throws L9 {
        AbstractC1062Ln.A02(this.A0D);
        while (c1084Mk.A07() > 0) {
            switch (this.A08) {
                case 0:
                    int secondByte = c1084Mk.A0I();
                    if (secondByte != 86) {
                        break;
                    } else {
                        this.A08 = 1;
                        break;
                    }
                case 1:
                    int iA0I = c1084Mk.A0I();
                    if ((iA0I & Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE) == 224) {
                        this.A07 = iA0I;
                        this.A08 = 2;
                        break;
                    } else if (iA0I == 86) {
                        break;
                    } else {
                        this.A08 = 0;
                        break;
                    }
                case 2:
                    int bytesToRead = this.A07;
                    this.A06 = ((bytesToRead & (-225)) << 8) | c1084Mk.A0I();
                    if (this.A06 > this.A0J.A0l().length) {
                        A05(this.A06);
                    }
                    this.A01 = 0;
                    this.A08 = 3;
                    break;
                case 3:
                    int iMin = Math.min(c1084Mk.A07(), this.A06 - this.A01);
                    byte[] bArr = this.A0I.A00;
                    int bytesToRead2 = this.A01;
                    c1084Mk.A0k(bArr, bytesToRead2, iMin);
                    int bytesToRead3 = this.A01;
                    this.A01 = bytesToRead3 + iMin;
                    int i5 = this.A01;
                    int bytesToRead4 = this.A06;
                    if (i5 != bytesToRead4) {
                        break;
                    } else {
                        this.A0I.A08(0);
                        A06(this.A0I);
                        this.A08 = 0;
                        break;
                    }
                default:
                    throw new IllegalStateException();
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        c1601d2.A05();
        this.A0D = interfaceC1384Yw.ALm(c1601d2.A03(), 1);
        this.A0F = c1601d2.A04();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        if (j11 != -9223372036854775807L) {
            this.A0B = j11;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        this.A08 = 0;
        this.A0B = -9223372036854775807L;
        this.A0H = false;
    }
}
