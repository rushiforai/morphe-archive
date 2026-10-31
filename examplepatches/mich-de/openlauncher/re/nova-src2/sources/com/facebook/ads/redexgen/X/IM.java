package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class IM extends AbstractC1709eo {
    public static byte[] A03;
    public View A00;
    public final C1997jX A01;
    public final C7D A02;

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 53);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{-23, 7, 20, 20, 21, 26, -58, 22, 24, 11, 25, 11, 20, 26, -58, 20, 27, 18, 18, -58, 7, 10, -4, 15, 11, 29};
    }

    public IM(C1997jX c1997jX) {
        this.A02 = c1997jX.A09();
        this.A01 = c1997jX;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0C() {
        this.A02.A0F().A4v();
        AbstractC2310oh.A00(new IP(this));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0D() {
        this.A02.A0F().A4y();
        AbstractC2310oh.A00(new IN(this));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0E(View view) {
        if (view != null) {
            this.A02.A0F().A4x();
            this.A00 = view;
            this.A01.A07().removeAllViews();
            this.A01.A07().addView(this.A00);
            if ((this.A00 instanceof C0894Ev) || (this.A00 instanceof C2481rV)) {
                AbstractC2267nz.A01(this.A01.A05(), this.A00, this.A01.A0A());
            }
            C07137f controller = this.A01.A08();
            if (controller != null) {
                controller.A0K();
            }
            AbstractC2310oh.A00(new IQ(this));
            this.A01.A0B(this.A01.A07(), this.A00);
            if (C2203mv.A1B(this.A01.A07().getContext())) {
                C2615tf c2615tf = new C2615tf();
                this.A01.A0D(c2615tf);
                c2615tf.A0C(this.A01.getPlacementId());
                c2615tf.A0B(this.A01.A07().getContext().getPackageName());
                if (this.A01.A08() != null && this.A01.A08().A0I() != null) {
                    c2615tf.A09(this.A01.A08().A0I().A0C());
                }
                if (this.A00 instanceof C0894Ev) {
                    c2615tf.A0A(((C0894Ev) this.A00).getViewabilityChecker());
                }
                this.A00.setOnLongClickListener(new ViewOnLongClickListenerC2005jf(this, c2615tf));
                this.A00.getOverlay().add(c2615tf);
                return;
            }
            return;
        }
        throw new IllegalStateException(A02(0, 26, 113));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0F(InterfaceC1708en interfaceC1708en) {
        this.A02.A0F().A4w(this.A01.A08() != null);
        if (this.A01.A08() != null) {
            this.A01.A08().A0L();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0G(C2262nt c2262nt) {
        this.A02.A0F().A3j(C2416qS.A01(this.A01.A04()), c2262nt.A03().getErrorCode(), c2262nt.A04());
        AbstractC2310oh.A00(new IR(this, c2262nt));
    }
}
