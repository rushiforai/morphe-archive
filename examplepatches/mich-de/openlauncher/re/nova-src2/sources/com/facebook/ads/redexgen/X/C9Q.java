package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.9Q, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C9Q extends US {
    public final boolean A00;
    public final boolean A01;
    public static final String A04 = N1.A0h(1);
    public static final String A03 = N1.A0h(2);
    public static final InterfaceC1017Js<C9Q> A02 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Ux
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C9Q.A00(bundle);
        }
    };

    public C9Q() {
        this.A01 = false;
        this.A00 = false;
    }

    public C9Q(boolean z11) {
        this.A01 = true;
        this.A00 = z11;
    }

    public static C9Q A00(Bundle bundle) {
        boolean isRated = bundle.getInt(US.A02, -1) == 0;
        AbstractC1062Ln.A07(isRated);
        boolean isRated2 = bundle.getBoolean(A04, false);
        if (isRated2) {
            return new C9Q(bundle.getBoolean(A03, false));
        }
        return new C9Q();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof C9Q)) {
            return false;
        }
        C9Q c9q = (C9Q) obj;
        return this.A00 == c9q.A00 && this.A01 == c9q.A01;
    }

    public final int hashCode() {
        return A6.A00(Boolean.valueOf(this.A01), Boolean.valueOf(this.A00));
    }
}
