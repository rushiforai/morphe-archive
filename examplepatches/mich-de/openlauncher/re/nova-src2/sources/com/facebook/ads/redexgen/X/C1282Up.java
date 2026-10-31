package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Up, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1282Up implements InterfaceC1018Jt {
    public final long A00;
    public final long A01;
    public final boolean A02;
    public final boolean A03;
    public final boolean A04;
    public static final C1282Up A06 = new C1035Kk().A0A();
    public static final InterfaceC1017Js<C9P> A05 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Us
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return new C1035Kk().A06(bundle.getLong(C1282Up.A01(0), 0L)).A05(bundle.getLong(C1282Up.A01(1), Long.MIN_VALUE)).A08(bundle.getBoolean(C1282Up.A01(2), false)).A07(bundle.getBoolean(C1282Up.A01(3), false)).A09(bundle.getBoolean(C1282Up.A01(4), false)).A0B();
        }
    };

    public C1282Up(C1035Kk c1035Kk) {
        this.A01 = c1035Kk.A01;
        this.A00 = c1035Kk.A00;
        this.A03 = c1035Kk.A03;
        this.A02 = c1035Kk.A02;
        this.A04 = c1035Kk.A04;
    }

    public static String A01(int i5) {
        return Integer.toString(i5, 36);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C1282Up)) {
            return false;
        }
        C1282Up c1282Up = (C1282Up) obj;
        return this.A01 == c1282Up.A01 && this.A00 == c1282Up.A00 && this.A03 == c1282Up.A03 && this.A02 == c1282Up.A02 && this.A04 == c1282Up.A04;
    }

    public final int hashCode() {
        return (((((((((int) (this.A01 ^ (this.A01 >>> 32))) * 31) + ((int) (this.A00 ^ (this.A00 >>> 32)))) * 31) + (this.A03 ? 1 : 0)) * 31) + (this.A02 ? 1 : 0)) * 31) + (this.A04 ? 1 : 0);
    }
}
