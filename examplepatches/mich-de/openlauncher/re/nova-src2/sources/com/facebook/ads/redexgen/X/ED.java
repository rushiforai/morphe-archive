package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class ED extends AbstractC2685un {
    public static byte[] A00;
    public static String[] A01 = {"tJRtfPKHoy7gQ0Hrrag4OkVDHQvHpM6e", "ntrk62ddU7J9c8B2GtO4dhepCrAVPpDV", "iQ54QNqjdD5kyZO2OLG", "4R7BJQoUCBFINf313UyvxR7fWPUp11Dk", "Ad2P", "mQFjJcGEaXO3GAoxmnr0yBCCZwtlhd6p", "65xONPI2i6gPpcf6kW2ve41HMoO1k057", "z69fhWo2iasYfVs3h6jnYZwontL4UpVs"};

    public static String A0H(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 94);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0I() {
        A00 = new byte[]{43, 46, 46, 47, 62, 43, 51, 54, 61};
    }

    public abstract void A1k();

    public abstract void A1l();

    public abstract void A1m();

    public abstract boolean A1n();

    public abstract boolean A1o();

    static {
        A0I();
    }

    public ED(C2689ur c2689ur, boolean z11) {
        super(c2689ur, z11);
        if (C2203mv.A16(c2689ur.A06())) {
            if (c2689ur.A0B() != null) {
                c2689ur.A0B().setCTAClickListener(getCtaButton());
            }
            getTitleDescContainer().setCTAClickListener(getCtaButton());
        }
    }

    public final void A1j() {
        if (C2203mv.A16(this.A08.A06()) && this.A08.A0B() != null) {
            this.A08.A0B().setCTAClickListener(getCtaButton());
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public ViewOnClickListenerC0884El getCtaButton() {
        return super.getCtaButton();
    }

    public void setAdDetailsClickListener(AbstractC2624to abstractC2624to) {
        if (C2203mv.A16(this.A08.A06()) && abstractC2624to != null) {
            ViewOnClickListenerC0884El ctaButton = getCtaButton();
            if (A01[1].charAt(21) != 'h') {
                throw new RuntimeException();
            }
            A01[3] = "am5A0dIgunRuJRLaM18rzwVTPisxqXDR";
            abstractC2624to.setOnClickListener(AbstractC2675ud.A03(ctaButton, A0H(0, 9, 108)));
        }
    }

    public void setupNativeCtaExtension(C2314ol c2314ol) {
    }
}
