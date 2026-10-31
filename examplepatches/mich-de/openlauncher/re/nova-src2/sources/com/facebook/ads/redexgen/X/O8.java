package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.Arrays;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class O8 implements InterfaceC1580ch {
    public static byte[] A0F;
    public static String[] A0G = {"5E2Ruv", "As2lK0wpv7EAotnDV0zySIEdp7rDAuRR", "zJq1SqXcVRZcYNSBAed6ZEYj5mJqLWdW", "HU", "Au", "wBYdOmQ4YddSL8awfUza1VzNpagTxGES", "j0tpPR2yAFbckVJ9RgjjaoWQaPtBZ6oF", "tmCUrPRgE7mum4Ug"};
    public long A01;
    public ZP A02;
    public C1587co A03;
    public String A04;
    public boolean A05;
    public boolean A06;
    public final C1594cv A0B;
    public final boolean A0C;
    public final boolean A0D;
    public final boolean[] A0E = new boolean[3];
    public final C1589cq A0A = new C1589cq(7, 128);
    public final C1589cq A08 = new C1589cq(8, 128);
    public final C1589cq A09 = new C1589cq(6, 128);
    public long A00 = -9223372036854775807L;
    public final C1084Mk A07 = new C1084Mk();

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0F, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0G;
            if (strArr[1].charAt(18) != strArr[5].charAt(18)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0G;
            strArr2[4] = "uL";
            strArr2[3] = "GM";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 8);
            i13++;
        }
    }

    public static void A02() {
        A0F = new byte[]{-26, -39, -44, -43, -33, -97, -47, -26, -45};
    }

    static {
        A02();
    }

    public O8(C1594cv c1594cv, boolean z11, boolean z12) {
        this.A0B = c1594cv;
        this.A0C = z11;
        this.A0D = z12;
    }

    @EnsuresNonNull
    private void A01() {
        AbstractC1062Ln.A02(this.A02);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x017e  */
    /* JADX WARN: Removed duplicated region for block: B:32:? A[RETURN, SYNTHETIC] */
    @RequiresNonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A03(long j11, int i5, int i11, long j12) {
        boolean sampleIsKeyFrame;
        if (!this.A05 || this.A03.A06()) {
            this.A0A.A04(i11);
            this.A08.A04(i11);
            if (!this.A05) {
                if (this.A0A.A03()) {
                    C1589cq c1589cq = this.A08;
                    String[] strArr = A0G;
                    if (strArr[2].charAt(16) != strArr[6].charAt(16)) {
                        String[] strArr2 = A0G;
                        strArr2[4] = "6Y";
                        strArr2[3] = "7O";
                        if (c1589cq.A03()) {
                            ArrayList arrayList = new ArrayList();
                            arrayList.add(Arrays.copyOf(this.A0A.A01, this.A0A.A00));
                            arrayList.add(Arrays.copyOf(this.A08.A01, this.A08.A00));
                            ZD zdA09 = ZE.A09(this.A0A.A01, 3, this.A0A.A00);
                            ZC zcA07 = ZE.A07(this.A08.A01, 3, this.A08.A00);
                            this.A02.A7E(new C1029Ke().A0y(this.A04).A11(A00(0, 9, 104)).A0w(Lv.A01(zdA09.A08, zdA09.A01, zdA09.A04)).A0r(zdA09.A0A).A0f(zdA09.A03).A0Y(zdA09.A00).A12(arrayList).A14());
                            this.A05 = true;
                            this.A03.A04(zdA09);
                            this.A03.A03(zcA07);
                            this.A0A.A00();
                            this.A08.A00();
                        }
                    }
                }
            } else if (this.A0A.A03()) {
                this.A03.A04(ZE.A09(this.A0A.A01, 3, this.A0A.A00));
                this.A0A.A00();
            } else if (this.A08.A03()) {
                this.A03.A03(ZE.A07(this.A08.A01, 3, this.A08.A00));
                this.A08.A00();
            }
            if (this.A09.A04(i11)) {
                C1589cq c1589cq2 = this.A09;
                String[] strArr3 = A0G;
                if (strArr3[4].length() == strArr3[3].length()) {
                    String[] strArr4 = A0G;
                    strArr4[4] = "yn";
                    strArr4[3] = "8M";
                    this.A07.A0j(this.A09.A01, ZE.A02(c1589cq2.A01, this.A09.A00));
                    this.A07.A0f(4);
                    this.A0B.A02(j12, this.A07);
                }
            }
            sampleIsKeyFrame = this.A03.A07(j11, i5, this.A05, this.A06);
            if (!sampleIsKeyFrame) {
                this.A06 = false;
                return;
            }
            return;
        }
        if (this.A09.A04(i11)) {
        }
        sampleIsKeyFrame = this.A03.A07(j11, i5, this.A05, this.A06);
        if (!sampleIsKeyFrame) {
        }
        throw new RuntimeException();
    }

    @RequiresNonNull
    private void A04(long j11, int i5, long j12) {
        if (!this.A05 || this.A03.A06()) {
            this.A0A.A01(i5);
            this.A08.A01(i5);
        }
        this.A09.A01(i5);
        this.A03.A02(j11, i5, j12);
    }

    @RequiresNonNull
    private void A05(byte[] bArr, int i5, int i11) {
        if (!this.A05 || this.A03.A06()) {
            this.A0A.A02(bArr, i5, i11);
            this.A08.A02(bArr, i5, i11);
        }
        this.A09.A02(bArr, i5, i11);
        this.A03.A05(bArr, i5, i11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A5j(C1084Mk c1084Mk) {
        int i5;
        A01();
        int limit = c1084Mk.A09();
        int iA0A = c1084Mk.A0A();
        byte[] bArrA0l = c1084Mk.A0l();
        long j11 = this.A01;
        int offset = c1084Mk.A07();
        this.A01 = j11 + offset;
        ZP zp2 = this.A02;
        int offset2 = c1084Mk.A07();
        zp2.AK9(c1084Mk, offset2);
        while (true) {
            int iA04 = ZE.A04(bArrA0l, limit, iA0A, this.A0E);
            if (iA04 == iA0A) {
                A05(bArrA0l, limit, iA0A);
                return;
            }
            int nalUnitType = ZE.A01(bArrA0l, iA04);
            int i11 = iA04 - limit;
            if (i11 > 0) {
                A05(bArrA0l, limit, iA04);
            }
            int i12 = iA0A - iA04;
            long j12 = this.A01 - i12;
            if (i11 < 0) {
                i5 = -i11;
                String[] strArr = A0G;
                if (strArr[1].charAt(18) != strArr[5].charAt(18)) {
                    throw new RuntimeException();
                }
                A0G[7] = "QwZGDBNPEFP2lUdc";
            } else {
                i5 = 0;
            }
            A03(j12, i12, i5, this.A00);
            A04(j12, nalUnitType, this.A00);
            limit = iA04 + 3;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        c1601d2.A05();
        this.A04 = c1601d2.A04();
        this.A02 = interfaceC1384Yw.ALm(c1601d2.A03(), 2);
        this.A03 = new C1587co(this.A02, this.A0C, this.A0D);
        this.A0B.A03(interfaceC1384Yw, c1601d2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        if (j11 != -9223372036854775807L) {
            this.A00 = j11;
        }
        this.A06 |= (i5 & 2) != 0;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        this.A01 = 0L;
        this.A06 = false;
        this.A00 = -9223372036854775807L;
        ZE.A0H(this.A0E);
        this.A0A.A00();
        this.A08.A00();
        this.A09.A00();
        if (this.A03 != null) {
            this.A03.A01();
        }
    }
}
