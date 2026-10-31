package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class H1 implements InterfaceC2236nS {
    public static byte[] A04;
    public static String[] A05 = {"Y66c6k3Hy3UvBBfpHck", "fJ4NdAtGEgbYsoLarolV0m2U2ouke5wB", "RcyYmVgVLeSkKDa12w3", "KskJyNeVQ7IEAjxWCckPmucmu9amULkO", "1ed8Y", "R", "mHN6PRZU6o6WB3AjYfdaJfhjKiNadrGW", "OPv53LJXnFYa9uQB3GUlIx9f3blXJ2fU"};
    public static final String A06;
    public H2 A00;
    public C05912l<C2210n2, C2215n7> A01;
    public final C0957Hh A02;
    public final AnonymousClass14 A03 = AnonymousClass14.A01();

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A05[1].charAt(19) != 'V') {
                throw new RuntimeException();
            }
            A05[1] = "obfng8wQuS9GtxnUf86VO2yIawxGqzEf";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 105);
            i13++;
        }
    }

    public static void A02() {
        A04 = new byte[]{-29, -9, -12, -81, -4, -12, -13, -8, -16, -81, -14, 1, -12, -16, 3, -8, 5, -12, -81, 5, -8, -12, 6, -81, -8, 2, -81, -3, 4, -5, -5, -67, -57, -32, -28, -41, -39, -37, -27, -26, -41, -28, -37, -32, -39, -110, -45, -110, -32, -25, -34, -34, -110, -43, -28, -41, -45, -26, -37, -24, -41, -110, -24, -37, -41, -23, -109, 6, 25, 21, 39, 32, 31, 25, 30, 36, -12, 17, 36, 17, -48, 25, 35, -48, 30, 37, 28, 28, -47, 4, -10, -12, 0, -1, -11, -16, -12, -7, -14, -1, -1, -10, -3};
    }

    static {
        A02();
        A06 = H1.class.getSimpleName();
    }

    public H1(C0957Hh c0957Hh) {
        this.A02 = c0957Hh;
    }

    private void A01() {
        this.A02.A08().ABz(A00(89, 14, 40), 3600, new C2127lg(A00(67, 22, 71)));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2236nS
    public final void AEc() {
        if (this.A01 != null) {
            this.A01.A07.A00();
        } else {
            A01();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2236nS
    public final void AHm() {
        if (this.A01 != null) {
            this.A01.A07.A03();
        } else {
            A01();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2236nS
    public final void ALo(View view) {
        if (this.A01 == null) {
            this.A02.A08().ABz(A00(89, 14, 40), 3600, new C2127lg(A00(32, 35, 9)));
            return;
        }
        this.A03.A06(view);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2236nS
    public final void AM7(View view, String str, boolean z11) {
        AM8(view, str, z11, false);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2236nS
    public final void AM8(View view, String str, boolean z11, boolean z12) {
        AM9(view, str, z11, z12, false);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2236nS
    public final void AM9(View view, String str, boolean z11, boolean z12, boolean z13) {
        if (view != null) {
            this.A00 = new H2(view, this.A02);
            this.A03.A08(this.A00, view);
            if (z12) {
                H2 h22 = this.A00;
                String[] strArr = A05;
                if (strArr[0].length() != strArr[2].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A05;
                strArr2[0] = "hwPcHACCkDldKsuu7a1";
                strArr2[2] = "KVS16a9OP0E0NreE4Vx";
                h22.A06();
            }
            this.A01 = C05912l.A00(new C2210n2(this.A02, view, str, z11, z13), new C2215n7(), A06).A06(new H3(new H0())).A07();
            this.A03.A07(view, this.A01);
            return;
        }
        this.A02.A08().ABz(A00(89, 14, 40), 3600, new C2127lg(A00(0, 32, 38)));
    }
}
