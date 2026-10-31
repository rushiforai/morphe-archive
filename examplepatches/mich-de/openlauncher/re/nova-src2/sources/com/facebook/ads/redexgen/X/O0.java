package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* loaded from: assets/audience_network/classes.dex */
public final class O0 implements InterfaceC1375Yn {
    public static String[] A02 = {"PJhN3FZVgP73WsVHjeIkIiqy1o5Nm6ot", "vHZEoF8Vdr6b9GOxglGjIcztgEb4lGpG", "7Zn", "WjGQxEG9muEXHUuRTkTnxckEJUcVVgfc", "vS1KFBax", "Z3S79xbW9uIa6QlxLinm6wAfFUFiRJHB", "7OX92GDqqDUkwkv5Php4XqNaHQn7rSna", "lYpSwIZ9e0XrNoGQ5mu7eY5DTp5WJL8e"};
    public final C1084Mk A00;
    public final C1092Ms A01;

    public O0(C1092Ms c1092Ms) {
        this.A01 = c1092Ms;
        this.A00 = new C1084Mk();
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x00db, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private C1373Yl A00(C1084Mk c1084Mk, long j11, long j12) {
        int iA09 = -1;
        int iA092 = -1;
        long j13 = -9223372036854775807L;
        while (true) {
            int endOfLastPacketPosition = c1084Mk.A07();
            if (endOfLastPacketPosition >= 4) {
                byte[] bArrA0l = c1084Mk.A0l();
                int endOfLastPacketPosition2 = c1084Mk.A09();
                int iA00 = C1125Nz.A00(bArrA0l, endOfLastPacketPosition2);
                if (A02[4].length() == 3) {
                    break;
                }
                A02[2] = "VSk";
                if (iA00 == 442) {
                    c1084Mk.A0g(4);
                    long jA06 = C1591cs.A06(c1084Mk);
                    if (jA06 != -9223372036854775807L) {
                        long jA062 = this.A01.A06(jA06);
                        if (jA062 > j11) {
                            if (j13 == -9223372036854775807L) {
                                return C1373Yl.A04(jA062, j12);
                            }
                            return C1373Yl.A03(iA09 + j12);
                        }
                        if (100000 + jA062 > j11) {
                            return C1373Yl.A03(c1084Mk.A09() + j12);
                        }
                        j13 = jA062;
                        iA09 = c1084Mk.A09();
                    }
                    A01(c1084Mk);
                    iA092 = c1084Mk.A09();
                } else if (A02[2].length() != 3) {
                    String[] strArr = A02;
                    strArr[5] = "Nn5J6L6hAUloK5liRrJgt8p77UAZcSJH";
                    strArr[3] = "IT7ZCNGlgICVvylA5U02sqKTdUzkVSY5";
                    c1084Mk.A0g(1);
                } else {
                    String[] strArr2 = A02;
                    strArr2[1] = "jubqiDg7PIOX8A5j1IwxQMQf4VcOzTUB";
                    strArr2[6] = "Yz6XdAIPGC3B7YV3lv6Yebkr9CAv7Zu0";
                    c1084Mk.A0g(1);
                }
            } else if (j13 != -9223372036854775807L) {
                long j14 = iA092 + j12;
                String[] strArr3 = A02;
                if (strArr3[1].charAt(3) != strArr3[6].charAt(3)) {
                    String[] strArr4 = A02;
                    strArr4[5] = "HOvXZkH3qZY5W2uBRQ5zalBDwUdW14MF";
                    strArr4[3] = "FFFw59d8TQDlsrvnJyK8q264EUQFEdHa";
                    return C1373Yl.A05(j13, j14);
                }
            } else {
                return C1373Yl.A03;
            }
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:22:0x005b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A01(C1084Mk c1084Mk) {
        int systemHeaderLength = c1084Mk.A0A();
        if (c1084Mk.A07() < 10) {
            c1084Mk.A0f(systemHeaderLength);
            return;
        }
        c1084Mk.A0g(9);
        int limit = c1084Mk.A0I();
        int packStuffingLength = limit & 7;
        int limit2 = c1084Mk.A07();
        if (limit2 < packStuffingLength) {
            c1084Mk.A0f(systemHeaderLength);
            return;
        }
        c1084Mk.A0g(packStuffingLength);
        int limit3 = c1084Mk.A07();
        if (limit3 < 4) {
            c1084Mk.A0f(systemHeaderLength);
            return;
        }
        byte[] bArrA0l = c1084Mk.A0l();
        int limit4 = c1084Mk.A09();
        if (C1125Nz.A00(bArrA0l, limit4) == 443) {
            c1084Mk.A0g(4);
            int packStuffingLength2 = c1084Mk.A0M();
            int limit5 = c1084Mk.A07();
            if (limit5 < packStuffingLength2) {
                c1084Mk.A0f(systemHeaderLength);
                return;
            }
            c1084Mk.A0g(packStuffingLength2);
        }
        while (limit >= 4) {
            byte[] bArrA0l2 = c1084Mk.A0l();
            int limit6 = c1084Mk.A09();
            int packStuffingLength3 = C1125Nz.A00(bArrA0l2, limit6);
            if (packStuffingLength3 == 442 || packStuffingLength3 == 441 || (packStuffingLength3 >>> 8) != 1) {
                return;
            }
            c1084Mk.A0g(4);
            if (c1084Mk.A07() < 2) {
                c1084Mk.A0f(systemHeaderLength);
                return;
            }
            int nextStartCode = c1084Mk.A0M();
            int packStuffingLength4 = c1084Mk.A0A();
            int limit7 = c1084Mk.A09();
            c1084Mk.A0f(Math.min(packStuffingLength4, limit7 + nextStartCode));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1375Yn
    public final void AGz() {
        this.A00.A0i(N1.A07);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1375Yn
    public final C1373Yl AKE(Q9 q92, long j11) throws IOException {
        long jA9Q = q92.A9Q();
        int iMin = (int) Math.min(20000L, q92.A90() - jA9Q);
        this.A00.A0d(iMin);
        q92.AI6(this.A00.A0l(), 0, iMin);
        return A00(this.A00, j11, jA9Q);
    }
}
