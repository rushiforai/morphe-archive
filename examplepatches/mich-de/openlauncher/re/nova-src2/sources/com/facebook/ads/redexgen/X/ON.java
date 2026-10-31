package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class ON implements InterfaceC1580ch {
    public static byte[] A0C;
    public static String[] A0D = {"ep9gEVnLdHQukhszVIgQLkMVsu7wmA", "5A1zYpSeIeOgAqUkbC", "kXHLxxwLRtkdCVbOZs2QIWnQntQQylkW", "tWYnEg4Wx6AOnen8geTVgcs3Rk1exgFZ", "nsAK4bp41FYiOmcf294ZlwkuQ7OJH9Wc", "E3xEuYzC7Z", "HSxndViYjZhdb7", "wynUtS2qCDQ1uB1gl7eO4Qu"};
    public int A00;
    public int A01;
    public int A02;
    public long A03;
    public long A04;
    public VC A05;
    public ZP A06;
    public String A07;
    public boolean A08;
    public final C1083Mj A09;
    public final C1084Mk A0A;
    public final String A0B;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 37);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0C = new byte[]{103, 115, 98, 111, 105, 41, 103, 101, 53};
    }

    static {
        A02();
    }

    public ON() {
        this(null);
    }

    public ON(String str) {
        this.A09 = new C1083Mj(new byte[128]);
        this.A0A = new C1084Mk(this.A09.A00);
        this.A02 = 0;
        this.A04 = -9223372036854775807L;
        this.A0B = str;
    }

    @RequiresNonNull
    private void A01() {
        this.A09.A08(0);
        C1365Yc c1365YcA09 = AbstractC1366Yd.A09(this.A09);
        if (this.A05 == null || c1365YcA09.A01 != this.A05.A06 || c1365YcA09.A04 != this.A05.A0G || !N1.A1E(c1365YcA09.A06, this.A05.A0W)) {
            C1029Ke c1029KeA0j = new C1029Ke().A0y(this.A07).A11(c1365YcA09.A06).A0b(c1365YcA09.A01).A0m(c1365YcA09.A04).A10(this.A0B).A0j(c1365YcA09.A00);
            if (A00(0, 9, 35).equals(c1365YcA09.A06)) {
                c1029KeA0j.A0a(c1365YcA09.A00);
            }
            this.A05 = c1029KeA0j.A14();
            this.A06.A7E(this.A05);
        }
        this.A01 = c1365YcA09.A02;
        long j11 = c1365YcA09.A03;
        if (A0D[0].length() != 30) {
            throw new RuntimeException();
        }
        String[] strArr = A0D;
        strArr[7] = "y7sa434xnL7Q43sfgX6PnLI";
        strArr[6] = "xeNUR191odINOC";
        this.A03 = (j11 * 1000000) / this.A05.A0G;
    }

    private boolean A03(C1084Mk c1084Mk) {
        while (true) {
            int iA07 = c1084Mk.A07();
            if (A0D[3].charAt(0) != 't') {
                throw new RuntimeException();
            }
            String[] strArr = A0D;
            strArr[7] = "dAJxwBAgW7qvdGzP1N5Wvw9";
            strArr[6] = "1V4X54GGKEEW4j";
            if (iA07 <= 0) {
                return false;
            }
            if (!this.A08) {
                this.A08 = c1084Mk.A0I() == 11;
            } else {
                int iA0I = c1084Mk.A0I();
                if (iA0I == 119) {
                    this.A08 = false;
                    return true;
                }
                this.A08 = iA0I == 11;
            }
        }
    }

    private boolean A04(C1084Mk c1084Mk, byte[] bArr, int i5) {
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
        AbstractC1062Ln.A02(this.A06);
        while (c1084Mk.A07() > 0) {
            switch (this.A02) {
                case 0:
                    if (!A03(c1084Mk)) {
                        break;
                    } else {
                        this.A02 = 1;
                        this.A0A.A0l()[0] = 11;
                        this.A0A.A0l()[1] = 119;
                        this.A00 = 2;
                        break;
                    }
                case 1:
                    if (!A04(c1084Mk, this.A0A.A0l(), 128)) {
                        break;
                    } else {
                        A01();
                        this.A0A.A0f(0);
                        this.A06.AK9(this.A0A, 128);
                        this.A02 = 2;
                        break;
                    }
                case 2:
                    int iMin = Math.min(c1084Mk.A07(), this.A01 - this.A00);
                    this.A06.AK9(c1084Mk, iMin);
                    int bytesToRead = this.A00;
                    this.A00 = bytesToRead + iMin;
                    int i5 = this.A00;
                    int bytesToRead2 = this.A01;
                    if (i5 == bytesToRead2) {
                        if (this.A04 != -9223372036854775807L) {
                            this.A06.AKC(this.A04, 1, this.A01, 0, null);
                            this.A04 += this.A03;
                        }
                        this.A02 = 0;
                        break;
                    } else {
                        break;
                    }
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        c1601d2.A05();
        this.A07 = c1601d2.A04();
        this.A06 = interfaceC1384Yw.ALm(c1601d2.A03(), 1);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        if (j11 != -9223372036854775807L) {
            this.A04 = j11;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        this.A02 = 0;
        this.A00 = 0;
        this.A08 = false;
        this.A04 = -9223372036854775807L;
    }
}
