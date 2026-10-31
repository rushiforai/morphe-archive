package com.facebook.ads.redexgen.X;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.io.InterruptedIOException;

/* renamed from: com.facebook.ads.redexgen.X.eQ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1686eQ {
    public static String[] A0A = {"t4b1NIYxcZBrapVcjEzL4J0oJeRqrgew", "swfMi0mumkRMNTfN9gjixboFPAbGrR7b", "0NRJscgydOLmxuKxdcXS6qyTWNEVTV2L", "ohQHELtXyKexlFHse2cuWokjw1EsRvOg", "VhJ6SuQTF6tn8wTQKVjWlG8ESzgqX0mL", "t5bqH2QV2Q1caO6B62lIjTzaAwZLEpph", "SmWNgPIgg2cQ4UXWYZ0EUcN61mFZDYar", "fEDmRUEmNCVt0TxVjdiAbAnLVC0eYFcb"};
    public long A00;
    public long A01;
    public long A02;
    public final NX A03;
    public final InterfaceC1671eB A04;
    public final C07327y A05;
    public final InterfaceC1685eP A06;
    public final String A07;
    public final byte[] A08;
    public volatile boolean A09;

    public C1686eQ(C07327y c07327y, NX nx2, byte[] bArr, InterfaceC1685eP interfaceC1685eP) {
        this.A05 = c07327y;
        this.A04 = c07327y.A0E();
        this.A03 = nx2;
        this.A08 = bArr == null ? new byte[SQLiteDatabase.OPEN_SHAREDCACHE] : bArr;
        this.A06 = interfaceC1685eP;
        this.A07 = c07327y.A0F().A5H(nx2);
        this.A02 = nx2.A04;
    }

    private long A00() {
        if (this.A01 == -1) {
            return -1L;
        }
        return this.A01 - this.A03.A04;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x009c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private long A01(long j11, long j12) throws Throwable {
        boolean z11 = j11 + j12 == this.A01 || j12 == -1;
        long jAHv = -1;
        boolean z12 = false;
        if (j12 != -1) {
            try {
                jAHv = this.A05.AHv(this.A03.A04().A04(j11).A03(j12).A09());
                z12 = true;
            } catch (IOException unused) {
                NS.A00(this.A05);
            }
        }
        if (!z12) {
            A02();
            NU nuA04 = this.A03.A04().A04(j11);
            if (A0A[3].charAt(18) == 'n') {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[7] = "lwhQ70maHLBavT5pyDr2TpFeNkUtAbuJ";
            strArr[1] = "CU0hCQJxktl4rTaOrIxtyYkdr1BOY2uo";
            try {
                jAHv = this.A05.AHv(nuA04.A03(-1L).A09());
            } catch (IOException e3) {
                NS.A00(this.A05);
                throw e3;
            }
        }
        int i5 = 0;
        String[] strArr2 = A0A;
        if (strArr2[2].charAt(5) != strArr2[6].charAt(5)) {
            A0A[4] = "xTJir3I7BX27771GysfBU4JEyYNpOXNe";
            if (z11) {
                if (jAHv != -1) {
                    try {
                        A04(j11 + jAHv);
                    } catch (IOException e11) {
                        NS.A00(this.A05);
                        throw e11;
                    }
                }
            }
        } else if (z11) {
        }
        int i11 = 0;
        while (i11 != -1) {
            A02();
            i11 = this.A05.read(this.A08, 0, this.A08.length);
            if (i11 != -1) {
                A03(i11);
                i5 += i11;
            }
        }
        if (z11) {
            A04(i5 + j11);
        }
        this.A05.close();
        return i5;
    }

    private void A02() throws InterruptedIOException {
        if (!this.A09) {
        } else {
            throw new InterruptedIOException();
        }
    }

    private void A03(long j11) {
        this.A00 += j11;
        if (this.A06 != null) {
            this.A06.AGe(A00(), this.A00, j11);
        }
    }

    private void A04(long j11) {
        if (this.A01 == j11) {
            return;
        }
        this.A01 = j11;
        if (this.A06 != null) {
            this.A06.AGe(A00(), this.A00, 0L);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x00ae  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A05() throws IOException {
        long nextRequestLength;
        A02();
        this.A00 = this.A04.A7l(this.A07, this.A03.A04, this.A03.A03);
        if (this.A03.A03 != -1) {
            this.A01 = this.A03.A04 + this.A03.A03;
        } else {
            long jA00 = AbstractC1691eV.A00(this.A04.A83(this.A07));
            if (jA00 == -1) {
                jA00 = -1;
            }
            this.A01 = jA00;
        }
        InterfaceC1685eP interfaceC1685eP = this.A06;
        if (A0A[3].charAt(18) == 'n') {
            throw new RuntimeException();
        }
        String[] strArr = A0A;
        strArr[0] = "TeIFe1Mz8p8maSChOI3PVQ5YMHFhVeuu";
        strArr[5] = "GNyz65g1wLXgaMeobnhvqXqPza21p8BG";
        if (interfaceC1685eP != null) {
            this.A06.AGe(A00(), this.A00, 0L);
        }
        while (true) {
            if (this.A01 == -1 || this.A02 < this.A01) {
                A02();
                if (this.A01 == -1) {
                    nextRequestLength = Long.MAX_VALUE;
                } else {
                    long nextRequestLength2 = this.A01;
                    long blockLength = this.A02;
                    nextRequestLength = nextRequestLength2 - blockLength;
                }
                long jA7m = this.A04.A7m(this.A07, this.A02, nextRequestLength);
                if (jA7m > 0) {
                    long blockLength2 = this.A02;
                    this.A02 = blockLength2 + jA7m;
                } else {
                    long j11 = -jA7m;
                    String[] strArr2 = A0A;
                    if (strArr2[7].charAt(13) != strArr2[1].charAt(13)) {
                        String[] strArr3 = A0A;
                        strArr3[7] = "OyOwyOhE02hOhTM0oEgw0vlySnueffSW";
                        strArr3[1] = "9V8RVoRBqt04lTm22thBpzlD3AnibB1O";
                        if (j11 == Long.MAX_VALUE) {
                            j11 = -1;
                        }
                        long nextRequestLength3 = this.A02;
                        long blockLength3 = this.A02;
                        this.A02 = nextRequestLength3 + A01(blockLength3, j11);
                    } else {
                        A0A[3] = "vf27TIFB9AGyGOX9zJxRzcpHYFAsHHT1";
                        if (j11 == Long.MAX_VALUE) {
                        }
                        long nextRequestLength32 = this.A02;
                        long blockLength32 = this.A02;
                        this.A02 = nextRequestLength32 + A01(blockLength32, j11);
                    }
                }
            } else {
                return;
            }
        }
    }

    public final void A06() {
        this.A09 = true;
    }
}
