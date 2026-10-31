package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.widget.RelativeLayout;
import java.util.HashMap;

/* renamed from: com.facebook.ads.redexgen.X.un, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2685un extends RelativeLayout {
    public static final int A09 = AbstractC2383pv.A0e;
    public static final int A0A = (int) (AbstractC2385px.A02 * 28.0f);
    public static final int A0B = (int) (AbstractC2385px.A02 * 32.0f);
    public C1744fN A00;
    public InterfaceC2684um A01;
    public boolean A02;
    public C2566ss A03;
    public final C0958Hi A04;
    public final InterfaceC2224nG A05;
    public final ViewOnClickListenerC0884El A06;
    public final C2667uV A07;
    public final C2689ur A08;

    public abstract boolean A1g();

    public AbstractC2685un(C2689ur c2689ur, boolean z11) {
        C1744fN c1744fNA00;
        super(c2689ur.A06());
        this.A08 = c2689ur;
        this.A04 = c2689ur.A06();
        this.A05 = c2689ur.A07();
        if (c2689ur.A00() == 1) {
            c1744fNA00 = c2689ur.A05().A31().A01();
        } else {
            c1744fNA00 = c2689ur.A05().A31().A00();
        }
        this.A00 = c1744fNA00;
        this.A02 = z11;
        this.A06 = new ViewOnClickListenerC0884El(c2689ur.A06(), c2689ur.A05(), this.A00, c2689ur.A07(), c2689ur.A0C(), c2689ur.A0F(), c2689ur.A0A(), c2689ur.A09());
        this.A06.setRoundedCornersEnabled(A03());
        this.A06.setViewShowsOverMedia(A0H());
        this.A06.setV2Design(A05());
        AbstractC2426qc.A0H(1001, this.A06);
        this.A07 = new C2667uV(this.A04, this.A00, this.A02, A04(), A0A());
        AbstractC2426qc.A0L(this.A07);
    }

    public final C2566ss A00(C0958Hi c0958Hi, LA la2, C2232nO c2232nO, EnumC2569sv enumC2569sv, InterfaceC2459r9 interfaceC2459r9) {
        this.A03 = AbstractC2571sx.A01(c0958Hi, true, la2, c2232nO, interfaceC2459r9, enumC2569sv, AbstractC2568su.A00(la2));
        AbstractC2426qc.A0L(this.A03);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        if (la2.A3S()) {
            layoutParams.setMargins(AbstractC2383pv.A0e, AbstractC2383pv.A0u, 0, 0);
            layoutParams.addRule(10);
            layoutParams.addRule(9);
        } else {
            layoutParams.setMargins(AbstractC2383pv.A0e, 0, 0, AbstractC2383pv.A0e);
            layoutParams.addRule(12);
            layoutParams.addRule(9);
        }
        this.A03.setLayoutParams(layoutParams);
        return this.A03;
    }

    public final C2570sw A01(C0958Hi c0958Hi, EnumC2569sv enumC2569sv) {
        C2570sw c2570swA02 = AbstractC2571sx.A02(c0958Hi, enumC2569sv, this.A08.A05());
        AbstractC2426qc.A0L(c2570swA02);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(AbstractC2383pv.A0e, 0, 0, AbstractC2383pv.A0e);
        layoutParams.addRule(12);
        layoutParams.addRule(9);
        c2570swA02.setLayoutParams(layoutParams);
        return c2570swA02;
    }

    public final void A02(InterfaceC2643u7 interfaceC2643u7) {
        getCtaButton().A0H(interfaceC2643u7);
    }

    public boolean A03() {
        return true;
    }

    public boolean A04() {
        return true;
    }

    public final boolean A05() {
        if (this.A08.A05().A32().A0I().A07() == null) {
            return this.A08.A05().A2o() || this.A08.A05().A2q();
        }
        return this.A08.A05().A2Z();
    }

    public boolean A0A() {
        return true;
    }

    public boolean A0H() {
        return true;
    }

    public EnumC1698ec A1P(String str) {
        return getCtaButton().A0E(str);
    }

    public void A1Q() {
        if (this.A03 != null) {
            this.A03.A0O();
        }
    }

    public void A1R() {
    }

    public void A1S() {
    }

    public void A1T() {
    }

    public void A1U() {
    }

    public void A1V() {
    }

    public void A1W(int i5) {
    }

    public void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        this.A07.A04(c1735fE.A0J().A0G(), c1735fE.A0J().A04(), null, false, !A1g() && d5 > 0.0d && d5 < 1.0d);
        this.A06.setCta(c1735fE.A0K(), str, new HashMap());
    }

    public void A1Y(C5Y c5y) {
    }

    public void A1Z(BD bd2) {
    }

    public void A1a(C5V c5v, int i5) {
    }

    public void A1b(boolean z11) {
        if (!z11 && this.A03 != null) {
            this.A03.A0P();
        }
    }

    public void A1c(boolean z11) {
    }

    public boolean A1d() {
        return false;
    }

    public boolean A1e() {
        return true;
    }

    public boolean A1f() {
        return false;
    }

    public boolean A1h(int i5, int i11, Intent intent) {
        return false;
    }

    public boolean A1i(boolean z11) {
        return false;
    }

    public C0958Hi getAdContextWrapper() {
        return this.A04;
    }

    public InterfaceC2224nG getAdEventManager() {
        return this.A05;
    }

    public int getCloseButtonStyle() {
        return 0;
    }

    public C1744fN getColors() {
        return this.A00;
    }

    public ViewOnClickListenerC0884El getCtaButton() {
        return this.A06;
    }

    public InterfaceC2684um getNtdHideCallback() {
        return this.A01;
    }

    public C2667uV getTitleDescContainer() {
        return this.A07;
    }

    @Override // android.view.View
    public void onConfigurationChanged(Configuration configuration) {
        C1744fN c1744fNA00;
        super.onConfigurationChanged(configuration);
        if (configuration.orientation == 1) {
            c1744fNA00 = this.A08.A05().A31().A01();
        } else {
            c1744fNA00 = this.A08.A05().A31().A00();
        }
        this.A00 = c1744fNA00;
        this.A06.setViewShowsOverMedia(A0H());
        this.A06.setUpButtonColors(this.A00);
        this.A07.A03(this.A00, this.A02);
    }

    public void setAccidentalClickCappingListener(InterfaceC1699ed interfaceC1699ed) {
        getCtaButton().getCtaActionHelper().A09(interfaceC1699ed);
    }

    public void setChainedWatchAndBrowseSkippableStatus(boolean z11) {
    }

    public void setNtdHideCallback(InterfaceC2684um interfaceC2684um) {
        this.A01 = interfaceC2684um;
    }
}
