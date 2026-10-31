package com.facebook.ads.redexgen.X;

import android.util.Pair;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collections;

/* loaded from: assets/audience_network/classes.dex */
public final class OB implements InterfaceC1580ch {
    public static byte[] A0G;
    public static String[] A0H = {"YGG1hGUD7fkjRKuCpzKT5xoEHOcfG6wu", "TQXKnorHL0Wp0UUUX4bd7R4ZTnX6wyIS", "TV3l43IPvaenHgMQpr4x7SRb", "tKBW5Kai9NbQDMaCywCTlxP8j2GOO0Oi", "rfH16", "B20XQICxyCiRsSVQ2P5LIf408", "awDRzHrVV97XPhxtIX5rVM6LFD6uycRQ", "NgNfOWdkwBWAvoaxwVn"};
    public static final double[] A0I;
    public long A00;
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public ZP A05;
    public String A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;
    public boolean A0A;
    public final C1084Mk A0B;
    public final C1581ci A0C;
    public final C1589cq A0D;
    public final C1604d5 A0E;
    public final boolean[] A0F;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static Pair<VC, Long> A00(C1581ci c1581ci, String str) {
        byte[] bArrCopyOf = Arrays.copyOf(c1581ci.A02, c1581ci.A00);
        int i5 = bArrCopyOf[4] & 255;
        int i11 = bArrCopyOf[5] & 255;
        int i12 = (i5 << 4) | (i11 >> 4);
        int i13 = ((i11 & 15) << 8) | (bArrCopyOf[6] & 255);
        float f11 = 1.0f;
        switch ((bArrCopyOf[7] & 240) >> 4) {
            case 2:
                f11 = (i13 * 4) / (i12 * 3);
                break;
            case 3:
                float f12 = i13 * 16;
                float f13 = i12 * 9;
                if (A0H[6].charAt(30) == 'R') {
                    String[] strArr = A0H;
                    strArr[2] = "Up4zawitIqBYsavBWR3ldgVN";
                    strArr[5] = "iQb1UOZoqczfSY3g355bEPJrS";
                    f11 = f12 / f13;
                    break;
                } else {
                    throw new RuntimeException();
                }
            case 4:
                f11 = (i13 * Sdk.SDKError.Reason.TPAT_ERROR_VALUE) / (i12 * 100);
                break;
        }
        VC vcA14 = new C1029Ke().A0y(str).A11(A01(0, 11, 108)).A0r(i12).A0f(i13).A0Y(f11).A12(Collections.singletonList(bArrCopyOf)).A14();
        long j11 = 0;
        int i14 = (bArrCopyOf[7] & 15) - 1;
        if (i14 >= 0 && i14 < A0I.length) {
            double d5 = A0I[i14];
            int i15 = c1581ci.A01;
            int i16 = (bArrCopyOf[i15 + 9] & 96) >> 5;
            if (i16 != (bArrCopyOf[i15 + 9] & 31)) {
                d5 *= (i16 + 1.0d) / (r4 + 1);
            }
            j11 = (long) (1000000.0d / d5);
        }
        return Pair.create(vcA14, Long.valueOf(j11));
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 58);
            String[] strArr = A0H;
            if (strArr[2].length() == strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0H;
            strArr2[2] = "xTMpCgeabkGc6FSJv0GmRwxa";
            strArr2[5] = "wqPkn2tehNo6DcL26O9gaQyFc";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0G = new byte[]{32, 63, 50, 51, 57, 121, 59, 38, 51, 49, 100};
    }

    static {
        A02();
        A0I = new double[]{23.976023976023978d, 24.0d, 25.0d, 29.97002997002997d, 30.0d, 50.0d, 59.94005994005994d, 60.0d};
    }

    public OB() {
        this(null);
    }

    public OB(C1604d5 c1604d5) {
        this.A0E = c1604d5;
        this.A0F = new boolean[4];
        this.A0C = new C1581ci(128);
        if (c1604d5 != null) {
            this.A0D = new C1589cq(178, 128);
            this.A0B = new C1084Mk();
        } else {
            this.A0D = null;
            this.A0B = null;
        }
        this.A01 = -9223372036854775807L;
        this.A03 = -9223372036854775807L;
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0162  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x017f  */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A5j(C1084Mk c1084Mk) {
        ZP zp2;
        int i5;
        long j11;
        ZP zp3 = (ZP) AbstractC1062Ln.A02(this.A05);
        int iA09 = c1084Mk.A09();
        int iA0A = c1084Mk.A0A();
        byte[] bArrA0l = c1084Mk.A0l();
        this.A04 += c1084Mk.A07();
        zp3.AK9(c1084Mk, c1084Mk.A07());
        while (true) {
            int iA04 = ZE.A04(bArrA0l, iA09, iA0A, this.A0F);
            if (iA04 == iA0A) {
                if (!this.A07) {
                    this.A0C.A01(bArrA0l, iA09, iA0A);
                }
                if (this.A0D != null) {
                    this.A0D.A02(bArrA0l, iA09, iA0A);
                    return;
                }
                return;
            }
            int i11 = c1084Mk.A0l()[iA04 + 3] & 255;
            int i12 = iA04 - iA09;
            if (!this.A07) {
                if (i12 > 0) {
                    C1581ci c1581ci = this.A0C;
                    String[] strArr = A0H;
                    if (strArr[3].charAt(21) != strArr[0].charAt(21)) {
                        throw new RuntimeException();
                    }
                    A0H[6] = "ba9HXo214AFPWSEQ62Qpat87cjTgmWRT";
                    c1581ci.A01(bArrA0l, iA09, iA04);
                }
                if (this.A0C.A02(i11, i12 < 0 ? -i12 : 0)) {
                    Pair<VC, Long> pairA00 = A00(this.A0C, (String) AbstractC1062Ln.A01(this.A06));
                    zp3.A7E((VC) pairA00.first);
                    this.A00 = ((Long) pairA00.second).longValue();
                    this.A07 = true;
                }
            }
            if (this.A0D != null) {
                int i13 = 0;
                if (i12 > 0) {
                    this.A0D.A02(bArrA0l, iA09, iA04);
                } else {
                    i13 = -i12;
                }
                if (this.A0D.A04(i13)) {
                    int iA02 = ZE.A02(this.A0D.A01, this.A0D.A00);
                    if (this.A0B != null) {
                        this.A0B.A0j(this.A0D.A01, iA02);
                        if (this.A0E != null) {
                            this.A0E.A02(this.A03, this.A0B);
                        }
                    }
                }
                if (i11 == 178 && c1084Mk.A0l()[iA04 + 2] == 1) {
                    this.A0D.A01(i11);
                }
            }
            if (i11 == 0 || i11 == 179) {
                int i14 = iA0A - iA04;
                if (this.A08 && this.A07) {
                    long j12 = this.A03;
                    String[] strArr2 = A0H;
                    if (strArr2[3].charAt(21) == strArr2[0].charAt(21)) {
                        A0H[6] = "n5lr2mqF8STMuPaUEz4Mvo9h5hfwM4R0";
                        if (j12 != -9223372036854775807L) {
                        }
                    } else if (j12 != -9223372036854775807L) {
                        zp2 = zp3;
                        i5 = i14;
                        zp3.AKC(this.A03, this.A09 ? 1 : 0, ((int) (this.A04 - this.A02)) - i14, i14, null);
                    }
                    if (!this.A0A) {
                    }
                } else {
                    zp2 = zp3;
                    i5 = i14;
                    if (!this.A0A) {
                        boolean z11 = this.A08;
                        if (A0H[6].charAt(30) != 'R') {
                            throw new RuntimeException();
                        }
                        A0H[1] = "tiQ06i3kr2RyUA3PpJZvNwvRbwHBRONm";
                        if (z11) {
                            this.A02 = this.A04 - i5;
                            if (this.A01 != -9223372036854775807L) {
                                j11 = this.A01;
                            } else if (this.A03 != -9223372036854775807L) {
                                j11 = this.A03 + this.A00;
                            } else {
                                j11 = -9223372036854775807L;
                            }
                            this.A03 = j11;
                            this.A09 = false;
                            this.A01 = -9223372036854775807L;
                            this.A0A = true;
                        }
                        this.A08 = i11 == 0;
                    }
                }
            } else if (i11 == 184) {
                this.A09 = true;
                zp2 = zp3;
            } else {
                zp2 = zp3;
            }
            iA09 = iA04 + 3;
            zp3 = zp2;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        c1601d2.A05();
        this.A06 = c1601d2.A04();
        this.A05 = interfaceC1384Yw.ALm(c1601d2.A03(), 2);
        if (this.A0E != null) {
            this.A0E.A03(interfaceC1384Yw, c1601d2);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        this.A01 = j11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        ZE.A0H(this.A0F);
        this.A0C.A00();
        if (this.A0D != null) {
            this.A0D.A00();
        }
        this.A04 = 0L;
        this.A0A = false;
        this.A01 = -9223372036854775807L;
        this.A03 = -9223372036854775807L;
    }
}
