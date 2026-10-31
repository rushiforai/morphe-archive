package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.cp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1588cp {
    public static String[] A0D = {"DTulKQrrWb7WgzZwh16YoEcpy778VgMy", "8EjtzI3HlIz4Pm9zhd0onx8Z3l7fT0K4", "hZG7PFSqDvHFx4aZzCCs", "NrBUNAbcM2tXV0XazOUf6pBtZmmB7BuO", "rw6GjiBqQQJEVkZ86xi8", "BAZaFrCayruuOD7F2KUN0A6FB01Uk5HF", "HWz5uYK1hcLDuQI2yRRFXcETfaJzrjnP", "uIyZjA4SaSm7DVUQlHbIfXLJsnmilllF"};
    public int A00;
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public boolean A05;
    public boolean A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;
    public boolean A0A;
    public boolean A0B;
    public final ZP A0C;

    public C1588cp(ZP zp2) {
        this.A0C = zp2;
    }

    private void A00(int i5) {
        if (this.A04 == -9223372036854775807L) {
            return;
        }
        boolean z11 = this.A0B;
        this.A0C.AKC(this.A04, z11 ? 1 : 0, (int) (this.A01 - this.A03), i5, null);
    }

    public static boolean A01(int i5) {
        return (32 <= i5 && i5 <= 35) || i5 == 39;
    }

    public static boolean A02(int i5) {
        return i5 < 32 || i5 == 40;
    }

    public final void A03() {
        this.A07 = false;
        this.A06 = false;
        this.A05 = false;
        this.A0A = false;
        this.A09 = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0086  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A04(long j11, int i5, int i11, long j12, boolean z11) {
        boolean z12 = false;
        this.A06 = false;
        this.A05 = false;
        this.A02 = j12;
        this.A00 = 0;
        this.A01 = j11;
        if (!A02(i11)) {
            if (this.A0A && !this.A09) {
                if (z11) {
                    A00(i5);
                }
                this.A0A = false;
            }
            if (A01(i11)) {
                this.A05 = !this.A09;
                this.A09 = true;
            }
        }
        if (i11 >= 16) {
            String[] strArr = A0D;
            if (strArr[3].charAt(3) != strArr[0].charAt(3)) {
                String[] strArr2 = A0D;
                strArr2[3] = "ZCFeQwj13391vHgWRN0b9uu4saTnirie";
                strArr2[0] = "T77fmyWcZ5yZAw0CyZibU1NLloD5WIOg";
                boolean z13 = i11 <= 21;
                this.A08 = z13;
                if (!this.A08) {
                    String[] strArr3 = A0D;
                    if (strArr3[2].length() == strArr3[4].length()) {
                        String[] strArr4 = A0D;
                        strArr4[6] = "4Ocv8JF3GKDeC4mKXjD2s8n1gM1kadkJ";
                        strArr4[1] = "fjNjuBzyWMVUxDoBQ51YAFtOMAzxYHsV";
                        if (i11 <= 9) {
                            z12 = true;
                        }
                    }
                }
                this.A07 = z12;
                return;
            }
        }
        throw new RuntimeException();
    }

    public final void A05(long j11, int i5, boolean z11) {
        if (this.A09 && this.A06) {
            this.A0B = this.A08;
            this.A09 = false;
            return;
        }
        boolean z12 = this.A05;
        String[] strArr = A0D;
        if (strArr[3].charAt(3) == strArr[0].charAt(3)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0D;
        strArr2[7] = "0flequyMyfE5xt94RCUdjTeoAwKrmuTb";
        strArr2[5] = "aoZIho4nWCQ4EPCYRAggXfcopQb3mjtK";
        if (!z12 && !this.A06) {
            return;
        }
        if (z11 && this.A0A) {
            A00(i5 + ((int) (j11 - this.A01)));
        }
        this.A03 = this.A01;
        this.A04 = this.A02;
        this.A0B = this.A08;
        this.A0A = true;
    }

    public final void A06(byte[] bArr, int i5, int i11) {
        if (this.A07) {
            int i12 = (i5 + 2) - this.A00;
            if (i12 < i11) {
                int headerOffset = bArr[i12];
                this.A06 = (headerOffset & 128) != 0;
                this.A07 = false;
                return;
            }
            this.A00 += i11 - i5;
        }
    }
}
