package com.facebook.ads.redexgen.X;

import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ea, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0873Ea extends AbstractC2685un implements InterfaceC2378pq {
    public static byte[] A05;
    public static final int A06;
    public final LA A00;
    public final C2380ps A01;
    public final InterfaceC2459r9 A02;
    public final C2712vE A03;
    public final C2329p0 A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 22);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{52, 48, 60, 58, 56};
    }

    static {
        A01();
        A06 = Resources.getSystem().getDisplayMetrics().widthPixels;
    }

    public C0873Ea(C2689ur c2689ur, boolean z11) {
        int id2;
        int iA01;
        super(c2689ur, z11);
        this.A02 = c2689ur.A0C();
        this.A00 = c2689ur.A05();
        this.A03 = new C2712vE(c2689ur.A06(), c2689ur.A02());
        this.A03.A01(getTitleDescContainer(), z11);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(12);
        layoutParams.setMargins(AbstractC2685un.A09, AbstractC2685un.A09, AbstractC2685un.A09, AbstractC2685un.A09);
        getCtaButton().setLayoutParams(layoutParams);
        if (c2689ur.A0H()) {
            this.A04 = new C2329p0(c2689ur.A06());
            this.A04.setPageDetails(c2689ur.A05().A35());
            AbstractC2426qc.A0H(1007, this.A04);
            RelativeLayout.LayoutParams pageDetailsParams = new RelativeLayout.LayoutParams(-2, -2);
            pageDetailsParams.addRule(2, getCtaButton().getId());
            pageDetailsParams.setMargins(AbstractC2685un.A09, AbstractC2685un.A09 - (AbstractC2685un.A09 / 2), AbstractC2685un.A09, 0);
            this.A04.setLayoutParams(pageDetailsParams);
            id2 = this.A04.getId();
            iA01 = c2689ur.A01() - (AbstractC2685un.A09 / 2);
        } else {
            id2 = getCtaButton().getId();
            iA01 = c2689ur.A01();
            this.A04 = null;
        }
        FrameLayout insideContainerLayout = new FrameLayout(c2689ur.A06());
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams2.addRule(10);
        layoutParams2.addRule(2, id2);
        layoutParams2.setMargins(0, iA01, 0, 0);
        insideContainerLayout.setLayoutParams(layoutParams2);
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-1, -2);
        layoutParams3.gravity = 17;
        layoutParams3.setMargins(AbstractC2685un.A09, 0, AbstractC2685un.A09, 0);
        insideContainerLayout.addView(this.A03, layoutParams3);
        addView(insideContainerLayout);
        if (this.A04 != null) {
            addView(this.A04);
        }
        addView(getCtaButton());
        getCtaButton().A0I(c2689ur.A05(), c2689ur.A0B());
        View viewA02 = c2689ur.A02();
        this.A01 = C2380ps.A00(c2689ur.A06(), this.A00, this);
        C2379pr c2379prA02 = this.A01.A02(this.A00);
        c2689ur.A06().A0H().A00(c2379prA02.A01);
        if (viewA02 != null && c2379prA02.A00) {
            viewA02.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.ux
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.A00.A1j(view);
                }
            });
        } else if (viewA02 != null && C2203mv.A1J(getAdContextWrapper())) {
            AbstractC2621tl.A00(viewA02, C2203mv.A1K(getAdContextWrapper()), new ViewOnClickListenerC2696uy(this));
        }
        if (C2203mv.A16(c2689ur.A06())) {
            getTitleDescContainer().setCTAClickListener(getCtaButton());
            if (c2689ur.A0B() != null) {
                c2689ur.A0B().setCTAClickListener(getCtaButton());
            }
        }
        if (this.A04 != null && C2203mv.A17(c2689ur.A06())) {
            this.A04.setOnClickListener(getCtaButton());
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A0A() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A0H() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() {
        super.A1Q();
        this.A01.A03();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        super.A1X(c1735fE, str, d5, bundle);
        if (d5 > 0.0d) {
            int mediaHeight = (int) ((A06 - (AbstractC2685un.A09 * 2)) / d5);
            this.A03.A00(mediaHeight);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return false;
    }

    public final /* synthetic */ void A1j(View view) {
        getCtaButton().A0E(A00(0, 5, 75));
    }
}
