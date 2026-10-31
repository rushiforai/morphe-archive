package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.cl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1584cl {
    public static String[] A08 = {"T34PjHqEzj1ctaGuLMlaLvf6D0KsR8a2", "WQjUFITf3", "l9UjtgDKnZ7sjoaKQhjopS5Obo", "DdtXO2QpGAK3d7grPxf6ESMPb1xlPLyq", "JP08pl", "zRIe8uD7prrSbDm9PBymph8MZXsLH", "Y43ym5tEohkn1qgNEEtErjdhf", "U6AeamgotpLOyTVpJJk3DDe"};
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public boolean A04;
    public boolean A05;
    public boolean A06;
    public final ZP A07;

    public C1584cl(ZP zp2) {
        this.A07 = zp2;
    }

    public final void A00() {
        this.A05 = false;
        this.A04 = false;
        this.A06 = false;
        this.A00 = -1;
    }

    public final void A01(int i5, long j11) {
        this.A00 = i5;
        this.A06 = false;
        boolean z11 = true;
        this.A05 = i5 == 182 || i5 == 179;
        if (A08[6].length() == 9) {
            throw new RuntimeException();
        }
        A08[3] = "fo4XDTjRM6hqmIu9QsjgFOFyAGWhhWyT";
        if (i5 != 182) {
            z11 = false;
        }
        this.A04 = z11;
        this.A01 = 0;
        this.A03 = j11;
    }

    public final void A02(long j11, int i5, boolean z11) {
        if (this.A00 == 182 && z11 && this.A05) {
            long j12 = this.A03;
            String[] strArr = A08;
            if (strArr[1].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            A08[0] = "M66inROcz26ZuKnRt8kTGrBut9qF88s2";
            if (j12 != -9223372036854775807L) {
                this.A07.AKC(this.A03, this.A06 ? 1 : 0, (int) (j11 - this.A02), i5, null);
            }
        }
        if (this.A00 != 179) {
            this.A02 = j11;
        }
    }

    public final void A03(byte[] bArr, int i5, int i11) {
        if (this.A04) {
            int i12 = (i5 + 1) - this.A01;
            if (i12 < i11) {
                int headerOffset = bArr[i12];
                this.A06 = ((headerOffset & 192) >> 6) == 0;
                String[] strArr = A08;
                String str = strArr[5];
                String str2 = strArr[4];
                int length = str.length();
                int headerOffset2 = str2.length();
                if (length == headerOffset2) {
                    throw new RuntimeException();
                }
                A08[2] = "nMD11EbpAEAyrDpemBVmV7Uqp1";
                this.A04 = false;
                return;
            }
            this.A01 += i11 - i5;
        }
    }
}
