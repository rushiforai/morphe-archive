package com.facebook.ads.redexgen.X;

import android.widget.RelativeLayout;
import java.util.HashMap;

/* renamed from: com.facebook.ads.redexgen.X.uA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2646uA {
    /* JADX WARN: Type inference failed for: r0v0, types: [com.facebook.ads.redexgen.X.3t] */
    public static C06233t A00(final C2689ur c2689ur, final GT gt2, final String str, final C06996r c06996r) {
        final boolean z11 = true;
        return new C06906i(c2689ur, gt2, z11, str, c06996r) { // from class: com.facebook.ads.redexgen.X.3t
            public ViewOnClickListenerC0884El A00;
            public C2314ol A01;
            public final InterfaceC2224nG A02 = this.A0I.A06().A02().A0A();
            public final GT A03;
            public final C06996r A04;
            public final String A05;
            public static final int A07 = (int) (AbstractC2385px.A02 * (-4.0f));
            public static final int A06 = (int) (AbstractC2385px.A02 * 6.0f);

            {
                this.A03 = gt2;
                this.A05 = str;
                this.A04 = c06996r;
                this.A03.A1Q(this);
            }

            @Override // com.facebook.ads.redexgen.X.ED
            public void setupNativeCtaExtension(C2314ol c2314ol) {
                C1750fT c1750fTA33;
                this.A01 = c2314ol;
                int iA0O = C2203mv.A0O(this.A0I.A06());
                C1744fN c1744fNA01 = this.A03.A13().A31().A01();
                C0958Hi c0958HiA06 = this.A0I.A06();
                String strA1X = this.A03.A13().A1X();
                InterfaceC2224nG interfaceC2224nG = this.A02;
                InterfaceC2459r9 dummyListener = C2605tV.getDummyListener();
                C1539c2 c1539c2A0n = this.A04.A0n();
                C2417qT c2417qTA1E = this.A03.A1E();
                if (this.A03.A13() == null) {
                    c1750fTA33 = null;
                } else {
                    c1750fTA33 = this.A03.A13().A33();
                }
                this.A00 = new ViewOnClickListenerC0884El(c0958HiA06, strA1X, c1744fNA01, interfaceC2224nG, dummyListener, c1539c2A0n, c2417qTA1E, c1750fTA33);
                this.A00.setCta(c2314ol.A03().A0K(), this.A05, new HashMap());
                this.A03.A1Q(this.A00);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
                if (iA0O == 1) {
                    layoutParams.addRule(12);
                    AbstractC2426qc.A0S(this.A00, A06, 5, c1744fNA01.A0A(false));
                    ((C06906i) this).A06.addView(this.A00, layoutParams);
                } else {
                    if (iA0O != 2) {
                        return;
                    }
                    layoutParams.addRule(3, ((C06906i) this).A06.getId());
                    int extensionVariant = A07;
                    layoutParams.setMargins(0, extensionVariant, 0, 0);
                    addView(this.A00, 0, layoutParams);
                    ((C06906i) this).A06.bringToFront();
                }
            }
        };
    }
}
