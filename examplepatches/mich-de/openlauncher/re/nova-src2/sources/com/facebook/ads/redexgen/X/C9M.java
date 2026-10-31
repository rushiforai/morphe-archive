package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.9M, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C9M extends US {
    public final boolean A00;
    public final boolean A01;
    public static final String A04 = N1.A0h(1);
    public static final String A03 = N1.A0h(2);
    public static final InterfaceC1017Js<C9M> A02 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.UQ
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C9M.A00(bundle);
        }
    };

    public C9M() {
        this.A01 = false;
        this.A00 = false;
    }

    public C9M(boolean z11) {
        this.A01 = true;
        this.A00 = z11;
    }

    public static C9M A00(Bundle bundle) {
        boolean rated = bundle.getInt(US.A02, -1) == 3;
        AbstractC1062Ln.A07(rated);
        boolean rated2 = bundle.getBoolean(A04, false);
        if (rated2) {
            return new C9M(bundle.getBoolean(A03, false));
        }
        return new C9M();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof C9M)) {
            return false;
        }
        C9M c9m = (C9M) obj;
        return this.A00 == c9m.A00 && this.A01 == c9m.A01;
    }

    public final int hashCode() {
        return A6.A00(Boolean.valueOf(this.A01), Boolean.valueOf(this.A00));
    }
}
