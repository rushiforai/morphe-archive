package com.facebook.ads.redexgen.X;

import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.lr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2138lr {
    public static AbstractC06635h A00(final C2689ur c2689ur, int i5, final String str, final C0823Cc c0823Cc, int i11) {
        if (i5 == 1) {
            switch (i11) {
                case 1:
                    return new C06143k(c2689ur, str, c0823Cc);
                case 2:
                    return new C06123i(c2689ur, str, c0823Cc);
            }
        }
        return new AbstractC06635h(c2689ur, str, c0823Cc) { // from class: com.facebook.ads.redexgen.X.3j
            public static final int A00 = (int) (AbstractC2385px.A02 * 12.0f);

            @Override // com.facebook.ads.redexgen.X.AbstractC2685un
            public final boolean A03() {
                return false;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC06635h, com.facebook.ads.redexgen.X.AbstractC2685un
            public final boolean A0H() {
                return false;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC06635h
            public final void A1t(C0958Hi c0958Hi) {
                C2667uV titleDescContainer = getTitleDescContainer();
                titleDescContainer.setAlignment(3);
                RelativeLayout.LayoutParams adTitleAndDescriptionLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
                adTitleAndDescriptionLayoutParams.addRule(8, getMediaContainer().getId());
                titleDescContainer.setLayoutParams(adTitleAndDescriptionLayoutParams);
                titleDescContainer.setPadding(A00, A00, A00, A00);
                AbstractC2426qc.A0V(titleDescContainer, getAdContextWrapper());
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
                layoutParams.addRule(3, getMediaContainer().getId());
                getCtaButton().setLayoutParams(layoutParams);
                addView(getMediaContainer());
                addView(titleDescContainer);
                addView(getCtaButton());
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC06635h
            public final void A1u(C0958Hi c0958Hi, InterfaceC1959iv interfaceC1959iv) {
            }
        };
    }
}
