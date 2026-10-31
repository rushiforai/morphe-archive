package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Tp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1259Tp implements InterfaceC1018Jt {
    public final float A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public static final C1259Tp A05 = new C1259Tp(0, 0);
    public static final String A09 = N1.A0h(0);
    public static final String A06 = N1.A0h(1);
    public static final String A08 = N1.A0h(2);
    public static final String A07 = N1.A0h(3);
    public static final InterfaceC1017Js<C1259Tp> A04 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Tv
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C1259Tp.A00(bundle);
        }
    };

    public C1259Tp(int i5, int i11) {
        this(i5, i11, 0, 1.0f);
    }

    public C1259Tp(int i5, int i11, int i12, float f11) {
        this.A03 = i5;
        this.A01 = i11;
        this.A02 = i12;
        this.A00 = f11;
    }

    public static /* synthetic */ C1259Tp A00(Bundle bundle) {
        int i5 = bundle.getInt(A09, 0);
        int i11 = bundle.getInt(A06, 0);
        int height = bundle.getInt(A08, 0);
        return new C1259Tp(i5, i11, height, bundle.getFloat(A07, 1.0f));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C1259Tp)) {
            return false;
        }
        C1259Tp c1259Tp = (C1259Tp) obj;
        return this.A03 == c1259Tp.A03 && this.A01 == c1259Tp.A01 && this.A02 == c1259Tp.A02 && this.A00 == c1259Tp.A00;
    }

    public final int hashCode() {
        int result = this.A03;
        int result2 = ((((7 * 31) + result) * 31) + this.A01) * 31;
        int result3 = this.A02;
        return ((result2 + result3) * 31) + Float.floatToRawIntBits(this.A00);
    }
}
