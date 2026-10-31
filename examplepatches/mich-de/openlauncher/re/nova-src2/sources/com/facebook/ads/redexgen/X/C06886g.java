package com.facebook.ads.redexgen.X;

import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.6g, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06886g extends AbstractC0878Ef {
    public static byte[] A02;
    public static final int A03;
    public final View A00;
    public final boolean A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{-24, -20, -32, -26, -28};
    }

    static {
        A01();
        A03 = Resources.getSystem().getDisplayMetrics().widthPixels;
    }

    public C06886g(C2689ur c2689ur, boolean z11) {
        super(c2689ur, true);
        this.A01 = z11;
        this.A00 = c2689ur.A02();
        if (this.A00 == null) {
            return;
        }
        A1l();
        if (this.A01) {
            addView(this.A00, new RelativeLayout.LayoutParams(-1, -1));
        } else {
            FrameLayout frameLayout = new FrameLayout(c2689ur.A06());
            RelativeLayout.LayoutParams insideContainerParams = new RelativeLayout.LayoutParams(-1, -1);
            insideContainerParams.addRule(2, getAdDetailsView().getId());
            frameLayout.setLayoutParams(insideContainerParams);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
            layoutParams.gravity = 17;
            layoutParams.setMargins(AbstractC2685un.A09, 0, AbstractC2685un.A09, 0);
            frameLayout.addView(this.A00, layoutParams);
            addView(frameLayout);
        }
        C2379pr c2379prA02 = ((AbstractC0878Ef) this).A08.A02(getAdDataBundle());
        c2689ur.A06().A0H().A00(c2379prA02.A01);
        if (this.A00 != null) {
            if (c2379prA02.A00) {
                this.A00.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.us
                    @Override // android.view.View.OnClickListener
                    public final void onClick(View view) {
                        this.A00.A1q(view);
                    }
                });
            } else if (C2203mv.A1J(getAdContextWrapper())) {
                AbstractC2621tl.A00(this.A00, C2203mv.A1K(getAdContextWrapper()), new ViewOnClickListenerC2691ut(this));
            }
        }
        getAdDetailsView().bringToFront();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A0A() {
        return this.A01 && super.A0A();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A0H() {
        return this.A01 && super.A0A();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef, com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        super.A1X(c1735fE, str, d5, bundle);
        if (!this.A01 && d5 > 0.0d && this.A00 != null) {
            int mediaHeight = (int) ((A03 - (AbstractC2685un.A09 * 2)) / d5);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, mediaHeight);
            layoutParams.gravity = 17;
            int i5 = AbstractC2685un.A09;
            int mediaHeight2 = AbstractC2685un.A09;
            layoutParams.setMargins(i5, 0, mediaHeight2, 0);
            this.A00.setLayoutParams(layoutParams);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef
    public final AbstractC2624to A1k(C2689ur c2689ur, C1735fE c1735fE, String str) {
        return new C0880Eh(c2689ur.A06(), getCtaButton(), AbstractC0878Ef.A0G, c1735fE.A0J().A00() == EnumC1740fJ.A05, getColors(), c1735fE.A0K().A07(), str, c2689ur.A07(), c2689ur.A0C(), c2689ur.A0F(), c2689ur.A0A(), c2689ur.A05());
    }

    public final /* synthetic */ void A1q(View view) {
        getCtaButton().A0E(A00(0, 5, 26));
    }
}
