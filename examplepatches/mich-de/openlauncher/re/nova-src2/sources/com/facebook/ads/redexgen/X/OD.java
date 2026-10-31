package com.facebook.ads.redexgen.X;

import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class OD implements InterfaceC1580ch {
    public static String[] A0B = {"6kjAgVnpfq9OwfS", "tasmQUASsgPurMsU1or7nJ", "6GeLOXJIbceL5ZC6FVYmp", "m6K3OU4CkrSomM0B41mtNXyy0ObLe21t", "2kapsxFVMMIN6SdFTLqe3ftWk69kPmv", "hCW0ULZmvmyfrf3EveVcW", "JtqmU4TacWqW6r6GoOmvPYxHMKMY1A2n", "z3zzNvN7f6qVAq7vWf"};
    public int A00;
    public int A01;
    public int A03;
    public long A04;
    public VC A06;
    public ZP A07;
    public String A08;
    public final String A0A;
    public final C1084Mk A09 = new C1084Mk(new byte[18]);
    public int A02 = 0;
    public long A05 = -9223372036854775807L;

    public OD(String str) {
        this.A0A = str;
    }

    @RequiresNonNull
    private void A00() {
        byte[] bArrA0l = this.A09.A0l();
        if (this.A06 == null) {
            this.A06 = AbstractC1381Yt.A03(bArrA0l, this.A08, this.A0A, null);
            this.A07.A7E(this.A06);
        }
        this.A01 = AbstractC1381Yt.A01(bArrA0l);
        this.A04 = (int) ((AbstractC1381Yt.A02(bArrA0l) * 1000000) / this.A06.A0G);
    }

    private boolean A01(C1084Mk c1084Mk) {
        while (c1084Mk.A07() > 0) {
            this.A03 <<= 8;
            if (A0B[3].charAt(0) != 'm') {
                throw new RuntimeException();
            }
            A0B[7] = "RH7umrlPSCb8SZB30m";
            this.A03 |= c1084Mk.A0I();
            if (AbstractC1381Yt.A07(this.A03)) {
                byte[] bArrA0l = this.A09.A0l();
                bArrA0l[0] = (byte) ((this.A03 >> 24) & 255);
                bArrA0l[1] = (byte) ((this.A03 >> 16) & 255);
                bArrA0l[2] = (byte) ((this.A03 >> 8) & 255);
                bArrA0l[3] = (byte) (this.A03 & 255);
                this.A00 = 4;
                this.A03 = 0;
                return true;
            }
        }
        return false;
    }

    private boolean A02(C1084Mk c1084Mk, byte[] bArr, int i5) {
        int iMin = Math.min(c1084Mk.A07(), i5 - this.A00);
        int bytesToRead = this.A00;
        c1084Mk.A0k(bArr, bytesToRead, iMin);
        int bytesToRead2 = this.A00;
        this.A00 = bytesToRead2 + iMin;
        int bytesToRead3 = this.A00;
        return bytesToRead3 == i5;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A5j(C1084Mk c1084Mk) {
        AbstractC1062Ln.A02(this.A07);
        while (c1084Mk.A07() > 0) {
            switch (this.A02) {
                case 0:
                    if (!A01(c1084Mk)) {
                        break;
                    } else {
                        this.A02 = 1;
                        break;
                    }
                case 1:
                    if (!A02(c1084Mk, this.A09.A0l(), 18)) {
                        break;
                    } else {
                        A00();
                        this.A09.A0f(0);
                        this.A07.AK9(this.A09, 18);
                        this.A02 = 2;
                        break;
                    }
                case 2:
                    int iA07 = c1084Mk.A07();
                    int i5 = this.A01;
                    int i11 = this.A00;
                    String[] strArr = A0B;
                    if (strArr[2].length() == strArr[5].length()) {
                        String[] strArr2 = A0B;
                        strArr2[2] = "wIQUE1P3Kn4QM0RJxuBVM";
                        strArr2[5] = "CRrXHut1QH9x2yLYiVAkq";
                        int iMin = Math.min(iA07, i5 - i11);
                        this.A07.AK9(c1084Mk, iMin);
                        int bytesToRead = this.A00;
                        this.A00 = bytesToRead + iMin;
                        int i12 = this.A00;
                        int bytesToRead2 = this.A01;
                        if (i12 == bytesToRead2) {
                            if (this.A05 != -9223372036854775807L) {
                                this.A07.AKC(this.A05, 1, this.A01, 0, null);
                                long j11 = this.A05;
                                long j12 = this.A04;
                                if (A0B[1].length() != 23) {
                                    String[] strArr3 = A0B;
                                    strArr3[4] = "sRRWLtm0DZNG4v9ouKUzxgKaNuMUuTn";
                                    strArr3[0] = "skFxzuAYv2diCkn";
                                    this.A05 = j11 + j12;
                                } else {
                                    String[] strArr4 = A0B;
                                    strArr4[4] = "GLdm6LbDN5muLhXOziE9YY0TVpvEQ7n";
                                    strArr4[0] = "TR12m5URzZ7upGD";
                                    this.A05 = j11 + j12;
                                }
                            }
                            this.A02 = 0;
                            break;
                        } else {
                            break;
                        }
                    } else {
                        throw new RuntimeException();
                    }
                default:
                    throw new IllegalStateException();
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        c1601d2.A05();
        this.A08 = c1601d2.A04();
        this.A07 = interfaceC1384Yw.ALm(c1601d2.A03(), 1);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        if (j11 != -9223372036854775807L) {
            this.A05 = j11;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        this.A02 = 0;
        this.A00 = 0;
        this.A03 = 0;
        this.A05 = -9223372036854775807L;
    }
}
