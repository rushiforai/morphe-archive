package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.ads.androidx.media3.common.Metadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class Pu implements InterfaceC1383Yv {
    public static String[] A0E = {"zWnN8Cjz7WBbmu1e6d", "YWoQxYfRPepU", "2MQyiFWQBt4Fob21R2678jSxG37z", "wlkKQZNYzypIOj6eZICCgQsDFGsk", "IaksYYOwOgDfxL05PkLPBje8KY0H1w50", "ochPkjq7YK5t", "XRoKMReFu8G349hGPwpsHitDZJ2L6zPz", "ImP3Z1MWELf5Qe2nd5bCJ8XkbuF93Tkd"};
    public static final InterfaceC1387Yz A0F = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.Pw
        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final InterfaceC1383Yv[] A5w() {
            return Pu.A09();
        }

        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
            return AbstractC1386Yy.A01(this, uri, map);
        }
    };
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public long A04;
    public Metadata A05;
    public InterfaceC1384Yw A06;
    public Z5 A07;
    public ZP A08;
    public Py A09;
    public final C1084Mk A0A;
    public final Z0 A0B;
    public final boolean A0C;
    public final byte[] A0D;

    public Pu() {
        this(0);
    }

    public Pu(int i5) {
        this.A0D = new byte[42];
        this.A0A = new C1084Mk(new byte[SQLiteDatabase.OPEN_NOMUTEX], 0);
        this.A0C = (i5 & 1) != 0;
        this.A0B = new Z0();
        this.A03 = 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x009c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int A00(Q9 q92, ZH zh2) throws IOException {
        int iCharAt;
        int currentLimit;
        AbstractC1062Ln.A01(this.A08);
        AbstractC1062Ln.A01(this.A07);
        if (this.A09 != null && this.A09.A0B()) {
            return this.A09.A08(q92, zh2);
        }
        if (this.A04 == -1) {
            this.A04 = Z1.A01(q92, this.A07);
            return 0;
        }
        int bytesRead = this.A0A.A0A();
        boolean z11 = false;
        if (bytesRead < 32768) {
            int i5 = q92.read(this.A0A.A0l(), bytesRead, SQLiteDatabase.OPEN_NOMUTEX - bytesRead);
            z11 = i5 == -1;
            String[] strArr = A0E;
            String str = strArr[1];
            String str2 = strArr[5];
            int length = str.length();
            int currentLimit2 = str2.length();
            if (length == currentLimit2) {
                A0E[0] = "0tM9uXoYk89rR";
                if (!z11) {
                    C1084Mk c1084Mk = this.A0A;
                    if (A0E[0].length() != 26) {
                        A0E[7] = "cZLbYcposMAPFJ6vKrsqJf879HHfmQpV";
                        c1084Mk.A0e(bytesRead + i5);
                    }
                } else {
                    int currentLimit3 = this.A0A.A07();
                    if (currentLimit3 == 0) {
                        A03();
                        return -1;
                    }
                }
                C1084Mk c1084Mk2 = this.A0A;
                String[] strArr2 = A0E;
                String str3 = strArr2[4];
                String str4 = strArr2[6];
                iCharAt = str3.charAt(1);
                currentLimit = str4.charAt(1);
                if (iCharAt != currentLimit) {
                }
            }
        } else {
            C1084Mk c1084Mk22 = this.A0A;
            String[] strArr22 = A0E;
            String str32 = strArr22[4];
            String str42 = strArr22[6];
            iCharAt = str32.charAt(1);
            currentLimit = str42.charAt(1);
            if (iCharAt != currentLimit) {
                A0E[7] = "ZbUf0aAmoKRsQ9npseAzJizoo08Ux9Rf";
                int iA09 = c1084Mk22.A09();
                int i11 = this.A00;
                int currentLimit4 = this.A02;
                if (i11 < currentLimit4) {
                    C1084Mk c1084Mk3 = this.A0A;
                    int i12 = this.A02;
                    int currentLimit5 = this.A00;
                    int i13 = i12 - currentLimit5;
                    int currentLimit6 = this.A0A.A07();
                    c1084Mk3.A0g(Math.min(i13, currentLimit6));
                }
                long jA01 = A01(this.A0A, z11);
                int iA092 = this.A0A.A09() - iA09;
                this.A0A.A0f(iA09);
                this.A08.AK9(this.A0A, iA092);
                int currentLimit7 = this.A00;
                this.A00 = currentLimit7 + iA092;
                if (jA01 != -1) {
                    A03();
                    this.A00 = 0;
                    this.A04 = jA01;
                }
                if (this.A0A.A07() < 16) {
                    int iA07 = this.A0A.A07();
                    System.arraycopy(this.A0A.A0l(), this.A0A.A09(), this.A0A.A0l(), 0, iA07);
                    this.A0A.A0f(0);
                    this.A0A.A0e(iA07);
                }
                return 0;
            }
        }
        throw new RuntimeException();
    }

    /* JADX WARN: Incorrect condition in loop: B:12:0x0034 */
    /* JADX WARN: Incorrect condition in loop: B:4:0x000f */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private long A01(C1084Mk c1084Mk, boolean z11) {
        boolean zA07;
        AbstractC1062Ln.A01(this.A07);
        int iA09 = c1084Mk.A09();
        while (iA09 <= frameOffset - 16) {
            c1084Mk.A0f(iA09);
            if (Z1.A07(c1084Mk, this.A07, this.A01, this.A0B)) {
                c1084Mk.A0f(iA09);
                return this.A0B.A00;
            }
            iA09++;
        }
        if (z11) {
            while (iA09 <= iA0A - frameOffset) {
                c1084Mk.A0f(iA09);
                try {
                    zA07 = Z1.A07(c1084Mk, this.A07, this.A01, this.A0B);
                } catch (IndexOutOfBoundsException unused) {
                    zA07 = false;
                }
                int iA092 = c1084Mk.A09();
                int frameOffset = c1084Mk.A0A();
                if (iA092 > frameOffset) {
                    zA07 = false;
                }
                if (zA07) {
                    c1084Mk.A0f(iA09);
                    return this.A0B.A00;
                }
                iA09++;
            }
            int iA0A = c1084Mk.A0A();
            if (A0E[7].charAt(20) != 'J') {
                throw new RuntimeException();
            }
            String[] strArr = A0E;
            strArr[3] = "GYhA2myC4wjI0S4oXXXRuUzHVuZZ";
            strArr[2] = "xr8JlCzPWnFDVPufqvMfWt94WpQE";
            c1084Mk.A0f(iA0A);
            return -1L;
        }
        c1084Mk.A0f(iA09);
        return -1L;
    }

    private ZK A02(long j11, long j12) {
        AbstractC1062Ln.A01(this.A07);
        if (this.A07.A0A != null) {
            return new Q6(this.A07, j11);
        }
        if (j12 != -1 && this.A07.A09 > 0) {
            this.A09 = new Py(this.A07, this.A01, j11, j12);
            return this.A09.A09();
        }
        return new Q4(this.A07.A06());
    }

    private void A03() {
        ((ZP) N1.A0f(this.A08)).AKC((this.A04 * 1000000) / ((Z5) N1.A0f(this.A07)).A07, 1, this.A00, 0, null);
    }

    private void A04(Q9 q92) throws IOException {
        this.A01 = Z3.A00(q92);
        ((InterfaceC1384Yw) N1.A0f(this.A06)).AKP(A02(q92.A9Q(), q92.A90()));
        this.A03 = 5;
    }

    private void A05(Q9 q92) throws IOException {
        q92.AI6(this.A0D, 0, this.A0D.length);
        q92.AK3();
        this.A03 = 2;
    }

    private void A06(Q9 q92) throws IOException {
        this.A05 = Z3.A02(q92, !this.A0C);
        this.A03 = 1;
    }

    private void A07(Q9 q92) throws IOException {
        boolean zA0B = false;
        Z2 metadataHolder = new Z2(this.A07);
        while (!zA0B) {
            zA0B = Z3.A0B(q92, metadataHolder);
            this.A07 = (Z5) N1.A0f(metadataHolder.A00);
        }
        AbstractC1062Ln.A01(this.A07);
        this.A02 = Math.max(this.A07.A06, 6);
        ((ZP) N1.A0f(this.A08)).A7E(this.A07.A08(this.A0D, this.A05));
        this.A03 = 4;
    }

    private void A08(Q9 q92) throws IOException {
        Z3.A09(q92);
        this.A03 = 3;
    }

    public static /* synthetic */ InterfaceC1383Yv[] A09() {
        return new InterfaceC1383Yv[]{new Pu()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A06 = interfaceC1384Yw;
        this.A08 = interfaceC1384Yw.ALm(0, 1);
        interfaceC1384Yw.A6x();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        switch (this.A03) {
            case 0:
                A06(q92);
                return 0;
            case 1:
                A05(q92);
                return 0;
            case 2:
                A08(q92);
                String[] strArr = A0E;
                if (strArr[1].length() != strArr[5].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0E;
                strArr2[1] = "jMiuRjpS2ayQ";
                strArr2[5] = "rihjrbtKwpaI";
                return 0;
            case 3:
                A07(q92);
                return 0;
            case 4:
                A04(q92);
                return 0;
            case 5:
                return A00(q92, zh2);
            default:
                throw new IllegalStateException();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        if (j11 == 0) {
            this.A03 = 0;
        } else if (this.A09 != null) {
            this.A09.A0A(j12);
        }
        this.A04 = j12 != 0 ? -1L : 0L;
        this.A00 = 0;
        this.A0A.A0d(0);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        Z3.A01(q92, false);
        return Z3.A0A(q92);
    }
}
