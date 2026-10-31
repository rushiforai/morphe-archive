package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.Nv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1121Nv implements InterfaceC1375Yn {
    public static String[] A04 = {"RLAlGP8S1DSoS72DYU8wZ8AX45", "A6eaT6jJa", "2mFwODVwh52i5QBvOlEgNE4ybkDRDOCf", "KuOsktzp3x818lDv5uDr6lC4YF", "wVqU5ZkhhGLQ1t8pizd9XHSKop", "2RKV86AtSMgi18RmHH4LwO1qcK", "HA", "JlThFtiPrXA6USExEli2F6rd93zikkV3"};
    public final int A00;
    public final int A01;
    public final C1084Mk A02 = new C1084Mk();
    public final C1092Ms A03;

    public C1121Nv(int i5, C1092Ms c1092Ms, int i11) {
        this.A00 = i5;
        this.A03 = c1092Ms;
        this.A01 = i11;
    }

    private C1373Yl A00(C1084Mk c1084Mk, long j11, long j12) {
        int iA00;
        int iA002;
        int iA0A = c1084Mk.A0A();
        long j13 = -1;
        long j14 = -1;
        long lastPcrTimeUsInRange = -9223372036854775807L;
        while (c1084Mk.A07() >= 188 && (iA002 = (iA00 = AbstractC1603d4.A00(c1084Mk.A0l(), c1084Mk.A09(), iA0A)) + 188) <= iA0A) {
            long jA01 = AbstractC1603d4.A01(c1084Mk, iA00, this.A00);
            if (jA01 != -9223372036854775807L) {
                long jA06 = this.A03.A06(jA01);
                if (A04[1].length() == 15) {
                    throw new RuntimeException();
                }
                String[] strArr = A04;
                strArr[2] = "erK58Snr16wV4tgsNlP4CY6fSs4SFCk6";
                strArr[7] = "bez4joxev592tBuTsloFEwMQX3bGJ8tl";
                if (jA06 > j11) {
                    if (lastPcrTimeUsInRange == -9223372036854775807L) {
                        return C1373Yl.A04(jA06, j12);
                    }
                    long j15 = j12 + j13;
                    String[] strArr2 = A04;
                    if (strArr2[2].charAt(17) != strArr2[7].charAt(17)) {
                        throw new RuntimeException();
                    }
                    String[] strArr3 = A04;
                    strArr3[4] = "rdKAfEqj9LG96MS1peXmFhiWHg";
                    strArr3[0] = "OVbZe2Ml1jCzI6iN57G5dXZdr2";
                    return C1373Yl.A03(j15);
                }
                long endOfLastPacketPositionInStream = jA06 + 100000;
                if (endOfLastPacketPositionInStream > j11) {
                    return C1373Yl.A03(iA00 + j12);
                }
                j13 = iA00;
                lastPcrTimeUsInRange = jA06;
            }
            c1084Mk.A0f(iA002);
            j14 = iA002;
        }
        if (lastPcrTimeUsInRange != -9223372036854775807L) {
            return C1373Yl.A05(lastPcrTimeUsInRange, j12 + j14);
        }
        return C1373Yl.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1375Yn
    public final void AGz() {
        this.A02.A0i(N1.A07);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1375Yn
    public final C1373Yl AKE(Q9 q92, long j11) throws IOException {
        long jA9Q = q92.A9Q();
        int iMin = (int) Math.min(this.A01, q92.A90() - jA9Q);
        this.A02.A0d(iMin);
        q92.AI6(this.A02.A0l(), 0, iMin);
        return A00(this.A02, j11, jA9Q);
    }
}
