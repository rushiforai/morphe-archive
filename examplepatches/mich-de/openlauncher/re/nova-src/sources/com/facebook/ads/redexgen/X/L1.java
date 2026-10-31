package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public abstract class L1 {
    public static String[] A05 = {"f6K7DQ97kjhMp6e96IfUD1ROMZN5JpkK", "QwYBycT0FTWZa8nJBY", "3uodYSK8C6OX1LFhx21z1J5DAO9B2Y88", "WfAPzDK4866XuGHShT5nLyHJ8ia15vxZ", "39nAjeasm1UhaxU5R2", "tLevDQRZ", "7oo3R6cem9jVFfi9FmEtuZfAFIL", "J79G1nuGGyRQozDDNXU572mTc7Cw9hmf"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final long A03;
    public final Object A04;

    public L1(L1 l12) {
        this.A04 = l12.A04;
        this.A00 = l12.A00;
        this.A01 = l12.A01;
        this.A03 = l12.A03;
        this.A02 = l12.A02;
    }

    public L1(Object obj) {
        this(obj, -1L);
    }

    public L1(Object obj, int i5, int i11, long j11) {
        this(obj, i5, i11, j11, -1);
    }

    public L1(Object obj, int i5, int i11, long j11, int i12) {
        this.A04 = obj;
        this.A00 = i5;
        this.A01 = i11;
        this.A03 = j11;
        this.A02 = i12;
    }

    public L1(Object obj, long j11) {
        this(obj, -1, -1, j11, -1);
    }

    public final boolean A00() {
        return this.A00 != -1;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof L1)) {
            return false;
        }
        L1 l12 = (L1) obj;
        if (this.A04.equals(l12.A04) && this.A00 == l12.A00 && this.A01 == l12.A01) {
            long j11 = this.A03;
            if (A05[5].length() != 8) {
                throw new RuntimeException();
            }
            A05[6] = "lY5HX9NlvaxNSEjfAfbBVBcWsIPxH7Zc";
            if (j11 == l12.A03 && this.A02 == l12.A02) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int result = this.A04.hashCode();
        int result2 = ((((17 * 31) + result) * 31) + this.A00) * 31;
        int result3 = this.A01;
        int result4 = (((result2 + result3) * 31) + ((int) this.A03)) * 31;
        int result5 = this.A02;
        return result4 + result5;
    }
}
