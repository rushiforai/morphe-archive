package com.facebook.ads.redexgen.X;

import java.io.IOException;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;
import org.checkerframework.checker.nullness.qual.EnsuresNonNullIf;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* renamed from: com.facebook.ads.redexgen.X.bN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1498bN {
    public static String[] A0D = {"g8nan3Eix9TMXF71b3ii", "VqOiAqE20ZMhG0SyxN0KJWf0m7t4NbS3", "0umC86Nmv", "3Zzeue8JuUGGD0kv0PRBSFB07eO2nT", "u9S02E0zErA94rYTmZeQAGWZBMk5ji", "bZrsQmbn99WLyfcy8e8udZLxLZkq3LB7", "IsIEVc2Ll", "LGQBk4985b5dKy7tpgajPMb3cjzomyMi"};
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public long A04;
    public long A05;
    public InterfaceC1384Yw A06;
    public ZP A07;
    public InterfaceC1495bK A08;
    public boolean A0A;
    public boolean A0B;
    public final C1493bI A0C = new C1493bI();
    public C1497bM A09 = new C1497bM();

    public abstract long A0E(C1084Mk c1084Mk);

    @EnsuresNonNullIf
    public abstract boolean A0J(C1084Mk c1084Mk, long j11, C1497bM c1497bM) throws IOException;

    @RequiresNonNull
    private int A07(Q9 q92) throws IOException {
        if (A0A(q92)) {
            this.A00 = this.A09.A00.A0G;
            if (!this.A0A) {
                this.A07.A7E(this.A09.A00);
                this.A0A = true;
            }
            if (this.A09.A01 != null) {
                this.A08 = this.A09.A01;
            } else if (q92.A90() == -1) {
                this.A08 = new C1138Om();
            } else {
                C1494bJ c1494bJA02 = this.A0C.A02();
                this.A08 = new C1148Ow(this, this.A04, q92.A90(), c1494bJA02.A01 + c1494bJA02.A00, c1494bJA02.A05, (c1494bJA02.A04 & 4) != 0);
            }
            this.A01 = 2;
            this.A0C.A04();
            return 0;
        }
        return -1;
    }

    @RequiresNonNull
    private int A08(Q9 q92, ZH zh2) throws IOException {
        long jAIa = this.A08.AIa(q92);
        if (jAIa >= 0) {
            zh2.A00 = jAIa;
            return 1;
        }
        if (jAIa < -1) {
            A0F(-(2 + jAIa));
        }
        if (!this.A0B) {
            this.A06.AKP((ZK) AbstractC1062Ln.A02(this.A08.A68()));
            this.A0B = true;
        }
        if (this.A03 <= 0 && !this.A0C.A05(q92)) {
            this.A01 = 3;
            return -1;
        }
        this.A03 = 0L;
        C1084Mk c1084MkA01 = this.A0C.A01();
        long jA0E = A0E(c1084MkA01);
        if (jA0E >= 0) {
            long j11 = this.A02 + jA0E;
            if (A0D[1].charAt(5) == 'U') {
                throw new RuntimeException();
            }
            String[] strArr = A0D;
            strArr[6] = "mfKthaVa8";
            strArr[2] = "Pdzie9OR7";
            if (j11 >= this.A05) {
                long position = this.A02;
                long jA0C = A0C(position);
                this.A07.AK9(c1084MkA01, c1084MkA01.A0A());
                this.A07.AKC(jA0C, 1, c1084MkA01.A0A(), 0, null);
                this.A05 = -1L;
            }
        }
        this.A02 += jA0E;
        return 0;
    }

    @EnsuresNonNull
    private void A09() {
        AbstractC1062Ln.A02(this.A07);
    }

    @EnsuresNonNullIf
    private boolean A0A(Q9 q92) throws IOException {
        while (this.A0C.A05(q92)) {
            this.A03 = q92.A9Q() - this.A04;
            C1084Mk c1084MkA01 = this.A0C.A01();
            long j11 = this.A04;
            C1497bM c1497bM = this.A09;
            String[] strArr = A0D;
            if (strArr[6].length() == strArr[2].length()) {
                String[] strArr2 = A0D;
                strArr2[6] = "UnGMnhYLI";
                strArr2[2] = "vvAxuYbCR";
                if (A0J(c1084MkA01, j11, c1497bM)) {
                    this.A04 = q92.A9Q();
                } else if (A0D[7].charAt(10) == '5') {
                    A0D[4] = "3qpqZK65S8VZSf";
                    return true;
                }
            }
            throw new RuntimeException();
        }
        this.A01 = 3;
        return false;
    }

    public final int A0B(Q9 q92, ZH zh2) throws IOException {
        A09();
        switch (this.A01) {
            case 0:
                int iA07 = A07(q92);
                if (A0D[0].length() == 9) {
                    throw new RuntimeException();
                }
                A0D[4] = "67Vs16VC5kRnPsaF4P7";
                return iA07;
            case 1:
                q92.ALL((int) this.A04);
                this.A01 = 2;
                return 0;
            case 2:
                return A08(q92, zh2);
            case 3:
                return -1;
            default:
                throw new IllegalStateException();
        }
    }

    public final long A0C(long j11) {
        return (1000000 * j11) / this.A00;
    }

    public final long A0D(long j11) {
        return (this.A00 * j11) / 1000000;
    }

    public void A0F(long j11) {
        this.A02 = j11;
    }

    public final void A0G(long j11, long j12) {
        this.A0C.A03();
        if (j11 == 0) {
            A0I(!this.A0B);
        } else {
            if (this.A01 == 0) {
                return;
            }
            this.A05 = A0D(j12);
            ((InterfaceC1495bK) N1.A0f(this.A08)).ALV(this.A05);
            this.A01 = 2;
        }
    }

    public final void A0H(InterfaceC1384Yw interfaceC1384Yw, ZP zp2) {
        this.A06 = interfaceC1384Yw;
        this.A07 = zp2;
        A0I(true);
    }

    public void A0I(boolean z11) {
        if (z11) {
            this.A09 = new C1497bM();
            this.A04 = 0L;
            this.A01 = 0;
        } else {
            this.A01 = 1;
        }
        this.A05 = -1L;
        this.A02 = 0L;
    }
}
