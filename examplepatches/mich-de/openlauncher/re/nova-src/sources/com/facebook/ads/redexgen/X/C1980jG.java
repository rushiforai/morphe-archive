package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.jG, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1980jG {
    public static String[] A05 = {"IS69BmVCyt3r7rCL06vW", "i2lfi3JYyaWanuhNA9EoVixSZwQkBGPJ", "IP2snh2DbdtJP84nmUNUnat", "M7qM02aMAAjP0VsgCoHzcI67snq6Xoz6", "g2Y2aWNGMjfm3AzRUQfTQ", "z59QBS9AE5GFtdBn17xV89BNaNN5ntVX", "icRlwMXc031dCVyQa9g0z", "JdVLDxEugZkBcdzJI35N90WET0E7DRJI"};
    public int A00 = 0;
    public int A01;
    public int A02;
    public int A03;
    public int A04;

    private final int A00(int i5, int i11) {
        if (i5 > i11) {
            return 1;
        }
        if (i5 == i11) {
            return 2;
        }
        return 4;
    }

    public final void A01() {
        this.A00 = 0;
    }

    public final void A02(int i5) {
        this.A00 |= i5;
    }

    public final void A03(int i5, int i11, int i12, int i13) {
        this.A04 = i5;
        this.A03 = i11;
        this.A02 = i12;
        this.A01 = i13;
    }

    public final boolean A04() {
        if ((this.A00 & 7) != 0 && (this.A00 & (A00(this.A02, this.A04) << 0)) == 0) {
            return false;
        }
        int i5 = this.A00 & 112;
        String[] strArr = A05;
        if (strArr[5].charAt(13) != strArr[7].charAt(13)) {
            throw new RuntimeException();
        }
        A05[0] = "xw0gZhFc6GA1WyK2bJob";
        if (i5 != 0 && (this.A00 & (A00(this.A02, this.A03) << 4)) == 0) {
            return false;
        }
        if ((this.A00 & 1792) == 0 || (this.A00 & (A00(this.A01, this.A04) << 8)) != 0) {
            return (this.A00 & 28672) == 0 || (this.A00 & (A00(this.A01, this.A03) << 12)) != 0;
        }
        return false;
    }
}
