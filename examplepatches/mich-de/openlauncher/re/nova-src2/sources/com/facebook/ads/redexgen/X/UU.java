package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import java.util.ArrayList;

/* loaded from: assets/audience_network/classes.dex */
public final class UU implements InterfaceC1018Jt {
    public final C1027Kc A00;
    public static final UU A02 = new LE().A04();
    public static final String A03 = N1.A0h(0);
    public static final InterfaceC1017Js<UU> A01 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.UV
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return UU.A01(bundle);
        }
    };

    public UU(C1027Kc c1027Kc) {
        this.A00 = c1027Kc;
    }

    public static UU A01(Bundle bundle) {
        ArrayList<Integer> integerArrayList = bundle.getIntegerArrayList(A03);
        if (integerArrayList == null) {
            return A02;
        }
        LE le2 = new LE();
        for (int i5 = 0; i5 < integerArrayList.size(); i5++) {
            le2.A00(integerArrayList.get(i5).intValue());
        }
        return le2.A04();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof UU)) {
            return false;
        }
        return this.A00.equals(((UU) obj).A00);
    }

    public final int hashCode() {
        return this.A00.hashCode();
    }
}
