package com.facebook.ads.redexgen.X;

import android.transition.ChangeBounds;
import android.transition.Explode;
import android.transition.TransitionSet;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: assets/audience_network/classes.dex */
public final class FE extends AbstractC2524sC {
    public static final int A03 = (int) (AbstractC2385px.A02 * 8.0f);
    public final RelativeLayout A00;
    public final C1819ga A01;
    public final C0958Hi A02;

    public FE(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str, C1756fZ c1756fZ, InterfaceC2460rA interfaceC2460rA, InterfaceC2459r9 interfaceC2459r9) {
        super(c0958Hi, interfaceC2224nG, str, c1756fZ, interfaceC2460rA, interfaceC2459r9);
        this.A02 = c0958Hi;
        this.A01 = AbstractC1820gb.A00(c0958Hi.A02());
        this.A00 = new RelativeLayout(getContext());
        addView(this.A00, new RelativeLayout.LayoutParams(-1, -1));
        AbstractC2426qc.A0O(this.A00, -1728053248);
        if (C2203mv.A2d(c0958Hi)) {
            this.A00.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.sH
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.A00.A0T(view);
                }
            });
        }
    }

    public static RelativeLayout.LayoutParams A00(boolean z11) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, z11 ? -1 : -2);
        layoutParams.addRule(12);
        return layoutParams;
    }

    private void A01() {
        TransitionSet transitionSet = new TransitionSet();
        transitionSet.setOrdering(0);
        transitionSet.addTransition(new ChangeBounds()).addTransition(new Explode());
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0O() {
        C1823ge c1823geA0A = this.A01.A0A();
        C2539sR c2539sR = new C2539sR(this.A02);
        AbstractC2426qc.A0H(1119, c2539sR);
        c2539sR.setInfo(EnumC2437qn.HIDE_AD, this.A01.A0H(), this.A01.A0G());
        c2539sR.setOnClickListener(new ViewOnClickListenerC2530sI(this));
        C1823ge c1823geA0B = this.A01.A0B();
        C2539sR c2539sR2 = new C2539sR(this.A02);
        AbstractC2426qc.A0H(1120, c2539sR2);
        c2539sR2.setInfo(EnumC2437qn.REPORT_AD, this.A01.A0L(), this.A01.A0K());
        c2539sR2.setOnClickListener(new ViewOnClickListenerC2531sJ(this));
        C2539sR c2539sR3 = new C2539sR(this.A02);
        AbstractC2426qc.A0H(1121, c2539sR3);
        c2539sR3.setInfo(EnumC2437qn.AD_CHOICES_ICON, this.A01.A0M(), b.f42142b);
        c2539sR3.setOnClickListener(new ViewOnClickListenerC2532sK(this));
        LinearLayout.LayoutParams itemParams = new LinearLayout.LayoutParams(-1, -2);
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setClickable(true);
        linearLayout.setOrientation(1);
        linearLayout.setPadding(A03 * 2, A03, A03 * 2, A03);
        AbstractC2426qc.A0O(linearLayout, -1);
        if (!c1823geA0A.A05().isEmpty()) {
            linearLayout.addView(c2539sR, itemParams);
        }
        if (!c1823geA0B.A05().isEmpty()) {
            linearLayout.addView(c2539sR2, itemParams);
        }
        linearLayout.addView(c2539sR3, itemParams);
        A01();
        this.A00.removeAllViews();
        this.A00.addView(linearLayout, A00(false));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0P() {
        this.A00.removeAllViews();
        AbstractC2426qc.A0K(this);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0Q(C1823ge c1823ge, EnumC1821gc enumC1821gc) {
        String strA0E;
        int i5;
        if (enumC1821gc == EnumC1821gc.A04) {
            return;
        }
        boolean z11 = enumC1821gc == EnumC1821gc.A05;
        C2521s9 c2521s9 = new C2521s9(this.A02, this.A0D);
        if (z11) {
            strA0E = this.A01.A0F();
        } else {
            strA0E = this.A01.A0E();
        }
        C2521s9 c2521s9A0D = c2521s9.A0H(strA0E).A0G(this.A01.A0D()).A0E(c1823ge.A04()).A0D(z11 ? EnumC2437qn.REPORT_AD : EnumC2437qn.HIDE_AD);
        if (z11) {
            i5 = -552389;
        } else {
            i5 = -13272859;
        }
        C2522sA adHiddenView = c2521s9A0D.A0C(i5).A0F(this.A0C != null ? this.A0C.A01() : b.f42142b).A0L();
        AbstractC2426qc.A0O(adHiddenView, -1);
        AbstractC2426qc.A0X(this);
        this.A00.removeAllViews();
        this.A00.addView(adHiddenView, A00(true));
        super.A0Q(c1823ge, enumC1821gc);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0R(C1823ge c1823ge, EnumC1821gc enumC1821gc) {
        String strA0H;
        boolean z11 = enumC1821gc == EnumC1821gc.A05;
        C0958Hi c0958Hi = this.A02;
        InterfaceC2526sE interfaceC2526sE = this.A0D;
        if (z11) {
            strA0H = this.A01.A0L();
        } else {
            strA0H = this.A01.A0H();
        }
        C2542sU c2542sU = new C2542sU(c0958Hi, c1823ge, interfaceC2526sE, strA0H, z11 ? EnumC2437qn.REPORT_AD : EnumC2437qn.HIDE_AD);
        c2542sU.setClickable(true);
        AbstractC2426qc.A0O(c2542sU, -1);
        c2542sU.setPadding(A03 * 2, A03, A03 * 2, A03);
        A01();
        this.A00.removeAllViews();
        this.A00.addView(c2542sU, A00(false));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final boolean A0S() {
        return false;
    }

    public final /* synthetic */ void A0T(View view) {
        this.A0D.A5d();
    }
}
