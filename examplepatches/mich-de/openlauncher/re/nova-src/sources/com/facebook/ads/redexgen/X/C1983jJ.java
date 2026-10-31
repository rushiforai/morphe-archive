package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.jJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1983jJ {
    public static String[] A02 = {"m3GQXqMIPLmV90", "GJHyDe1taa8sHfj0RdGpKE", "t", "zKiEjVGqR6UxWk3mC7l5flqkwPkxbPZ9", "lYl1u7brtSi69pWajNdkV6Hph567Zy88", "N", "zHwy1NdKzCctMJy4ad", "VUD"};
    public C1980jG A00 = new C1980jG();
    public final InterfaceC1981jH A01;

    public C1983jJ(InterfaceC1981jH interfaceC1981jH) {
        this.A01 = interfaceC1981jH;
    }

    public final View A00(int i5, int i11, int i12, int i13) {
        int iA9K = this.A01.A9K();
        int next = this.A01.A9J();
        int childEnd = i11 > i5 ? 1 : -1;
        View view = null;
        while (i5 != i11) {
            View viewA7s = this.A01.A7s(i5);
            int iA7v = this.A01.A7v(viewA7s);
            int i14 = this.A01.A7u(viewA7s);
            this.A00.A03(iA9K, next, iA7v, i14);
            if (i12 != 0) {
                this.A00.A01();
                this.A00.A02(i12);
                if (this.A00.A04()) {
                    return viewA7s;
                }
            }
            if (i13 != 0) {
                this.A00.A01();
                this.A00.A02(i13);
                if (this.A00.A04()) {
                    view = viewA7s;
                }
            }
            i5 += childEnd;
        }
        return view;
    }

    public final boolean A01(View view, int i5) {
        this.A00.A03(this.A01.A9K(), this.A01.A9J(), this.A01.A7v(view), this.A01.A7u(view));
        if (i5 != 0) {
            this.A00.A01();
            this.A00.A02(i5);
            C1980jG c1980jG = this.A00;
            String[] strArr = A02;
            if (strArr[2].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[4] = "CcDsiz54oXOGEpv23ROy12CWsbWYVe77";
            strArr2[3] = "dAE2WpjUb7j7qwunRRlMht4isYwoMM8P";
            return c1980jG.A04();
        }
        return false;
    }
}
