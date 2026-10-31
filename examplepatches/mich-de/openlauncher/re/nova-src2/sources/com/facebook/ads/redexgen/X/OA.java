package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class OA {
    public final int A00;
    public final int A01;
    public final VC A02;
    public final VC A03;
    public final String A04;

    public OA(String str, VC vc, VC vc2, int i5, int i11) {
        AbstractC1062Ln.A07(i5 == 0 || i11 == 0);
        this.A04 = AbstractC1062Ln.A05(str);
        this.A03 = (VC) AbstractC1062Ln.A01(vc);
        this.A02 = (VC) AbstractC1062Ln.A01(vc2);
        this.A01 = i5;
        this.A00 = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        OA oa2 = (OA) obj;
        if (this.A01 == oa2.A01 && this.A00 == oa2.A00 && this.A04.equals(oa2.A04) && this.A03.equals(oa2.A03) && this.A02.equals(oa2.A02)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        int hashCode = this.A01;
        int hashCode2 = ((((17 * 31) + hashCode) * 31) + this.A00) * 31;
        int hashCode3 = this.A04.hashCode();
        int hashCode4 = (((hashCode2 + hashCode3) * 31) + this.A03.hashCode()) * 31;
        int hashCode5 = this.A02.hashCode();
        return hashCode4 + hashCode5;
    }
}
