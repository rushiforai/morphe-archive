package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.Ip, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0991Ip extends AbstractC1858hF {
    public static String[] A01 = {"Aypyv0FACfsPQTq8B8UFxLSJIGYFzsCC", "O7nTze5knL3NcSr2rovnk7vqxWhLtUKF", "w8KDuB7m9FBYOy6hiJzio9ilRX5MSLSp", "Kqe5H6YPSeJrA9PRZ2BXFN4qonyjjTB9", "VPpNE9vsyh3HxU94PoFE47DnBqUfoC5Y", "VSW3ZMLcugYKNhiURlJ0g5uJ7Smp29SS", "AB", "JpT6Sbfy0irMNtnKFHDBnJ8tZotKHb"};
    public final C0978Ic A00;

    public C0991Ip(C0978Ic c0978Ic) {
        this.A00 = c0978Ic;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1858hF
    public final void A08(View view, C1904i0 c1904i0) {
        super.A08(view, c1904i0);
        if (!this.A00.A0B() && this.A00.A01.getLayoutManager() != null) {
            this.A00.A01.getLayoutManager().A2R(view, c1904i0);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1858hF
    public final boolean A09(View view, int i5, Bundle bundle) {
        if (super.A09(view, i5, bundle)) {
            if (A01[2].charAt(3) == 'j') {
                throw new RuntimeException();
            }
            A01[6] = "SRS22nAnXgHfwC2qheyHP9Kgc2YZ";
            return true;
        }
        if (!this.A00.A0B() && this.A00.A01.getLayoutManager() != null) {
            return this.A00.A01.getLayoutManager().A31(view, i5, bundle);
        }
        return false;
    }
}
