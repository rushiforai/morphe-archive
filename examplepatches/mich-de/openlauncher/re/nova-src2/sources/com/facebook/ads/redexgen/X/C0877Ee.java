package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ee, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0877Ee extends AbstractC2685un implements InterfaceC2378pq {
    public static byte[] A03;
    public final LA A00;
    public final C2380ps A01;
    public final InterfaceC2459r9 A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 41);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-22, -18, -30, -24, -26};
    }

    public C0877Ee(C2689ur c2689ur, boolean z11) {
        FrameLayout.LayoutParams layoutParams;
        super(c2689ur, true);
        this.A02 = c2689ur.A0C();
        this.A00 = c2689ur.A05();
        RelativeLayout relativeLayout = new RelativeLayout(c2689ur.A06());
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(12);
        AbstractC2426qc.A0V(relativeLayout, getAdContextWrapper());
        LinearLayout linearLayout = new LinearLayout(c2689ur.A06());
        linearLayout.setOrientation(!z11 ? 1 : 0);
        linearLayout.setGravity(80);
        AbstractC2426qc.A0L(linearLayout);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams3.setMargins(AbstractC2685un.A09, 0, AbstractC2685un.A09, AbstractC2685un.A09);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(z11 ? -2 : -1, -2);
        layoutParams4.setMargins(z11 ? AbstractC2685un.A09 : 0, z11 ? 0 : AbstractC2685un.A09, 0, 0);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(z11 ? 0 : -1, -2);
        layoutParams5.setMargins(0, 0, 0, 0);
        layoutParams5.weight = 1.0f;
        linearLayout.addView(getTitleDescContainer(), layoutParams5);
        this.A01 = C2380ps.A00(c2689ur.A06(), this.A00, this);
        C2379pr c2379prA02 = this.A01.A02(this.A00);
        c2689ur.A06().A0H().A00(c2379prA02.A01);
        if (c2689ur.A0H() && !z11) {
            C2329p0 c2329p0 = new C2329p0(c2689ur.A06());
            c2329p0.setPageDetails(c2689ur.A05().A35());
            int iA05 = this.A08.A05().A31().A00().A05(true);
            c2329p0.A02(iA05, iA05);
            AbstractC2426qc.A0H(1007, c2329p0);
            LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-1, -2);
            layoutParams6.setMargins(0, AbstractC2685un.A09, 0, 0);
            linearLayout.addView(c2329p0, layoutParams6);
            if (C2203mv.A17(c2689ur.A06())) {
                c2329p0.setOnClickListener(getCtaButton());
            }
        }
        linearLayout.addView(getCtaButton(), layoutParams4);
        relativeLayout.addView(linearLayout, layoutParams3);
        getCtaButton().A0I(c2689ur.A05(), c2689ur.A0B());
        View viewA02 = c2689ur.A02();
        if (viewA02 != null && (c2379prA02.A00 || C2203mv.A1J(getAdContextWrapper()))) {
            if (z11) {
                layoutParams = new FrameLayout.LayoutParams(-2, -1);
            } else {
                layoutParams = new FrameLayout.LayoutParams(-1, -2);
            }
            layoutParams.gravity = 17;
            FrameLayout frameLayout = new FrameLayout(c2689ur.A06());
            frameLayout.addView(viewA02, layoutParams);
            addView(frameLayout, new RelativeLayout.LayoutParams(-1, -1));
            if (c2379prA02.A00) {
                viewA02.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.ui
                    @Override // android.view.View.OnClickListener
                    public final void onClick(View view) {
                        this.A00.A1j(view);
                    }
                });
            } else {
                AbstractC2621tl.A00(viewA02, C2203mv.A1K(getAdContextWrapper()), new ViewOnClickListenerC2681uj(this));
            }
        } else if (viewA02 != null) {
            addView(viewA02, new RelativeLayout.LayoutParams(-1, -1));
        }
        addView(relativeLayout, layoutParams2);
        if (C2203mv.A16(c2689ur.A06())) {
            getTitleDescContainer().setCTAClickListener(getCtaButton());
            if (c2689ur.A0B() != null) {
                c2689ur.A0B().setCTAClickListener(getCtaButton());
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() {
        super.A1Q();
        this.A01.A03();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        super.A1X(c1735fE, str, d5, bundle);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return true;
    }

    public final /* synthetic */ void A1j(View view) {
        getCtaButton().A0E(A00(0, 5, 88));
    }
}
