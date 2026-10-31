package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class IZ extends AbstractC1965j1 {
    public static String[] A02 = {"mAEXsU", "ynqBxBOImfiaim2rOjt4gNln3IJjMmAs", "wywpOwDcOClPwSqhh8hqnS4LzA6xmBGs", "SzqLf2", "g6", "3b", "2rYsw0AU9P5CKqqKD8yWz2y811Q4TNqs", "g7NtZwf9Cfcv4ky8xJWe0WMsxKKUH5F1"};
    public boolean A00 = false;
    public final /* synthetic */ IY A01;

    public IZ(IY iy2) {
        this.A01 = iy2;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1965j1
    public final void A0P(C7O c7o, int i5) {
        super.A0P(c7o, i5);
        if (i5 == 0 && this.A00) {
            this.A00 = false;
            this.A01.A0F();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1965j1
    public final void A0Q(C7O c7o, int i5, int i11) {
        if (i5 == 0 && i11 == 0) {
            return;
        }
        String[] strArr = A02;
        if (strArr[5].length() == strArr[3].length()) {
            throw new RuntimeException();
        }
        A02[1] = "WMOmT1QQvzwg3wEMb9eL1K1wBJkCMN2D";
        this.A00 = true;
    }
}
