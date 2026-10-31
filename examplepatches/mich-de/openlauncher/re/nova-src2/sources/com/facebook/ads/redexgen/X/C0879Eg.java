package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.Eg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0879Eg extends AbstractC2685un implements InterfaceC2378pq {
    public static String[] A0H = {"h11dznws46etjZ", "3ZjkZVkxzq7vQjbUeWnO7fMwFQlVPHa", "24u0N3z4V6D", "xxt35C8jcsfoTiPs3zZnPs", "fEEjQOnwgD3kD8gyhX1RNVoyr9lY", "2cpHtTlhqkT9PtMCAMIfpqjEhII6", "SwjnupmK68g6YR92ykF2iF", "LrklEcA9y7ZDe6VQkPlmuIfDlA0BSpTV"};
    public static final int A0I = (int) (AbstractC2385px.A02 * 80.0f);
    public float A00;
    public C2673ub A01;
    public C2701v3 A02;
    public C2728vU A03;
    public C1861hI A04;
    public boolean A05;
    public final Handler A06;
    public final View A07;
    public final RelativeLayout A08;
    public final RelativeLayout A09;
    public final LA A0A;
    public final AbstractC2452r2 A0B;
    public final InterfaceC2459r9 A0C;
    public final AbstractC0891Es A0D;
    public final AtomicBoolean A0E;
    public final boolean A0F;
    public final C2380ps A0G;

    public C0879Eg(C2689ur c2689ur) {
        super(c2689ur, true);
        this.A06 = new Handler(Looper.getMainLooper());
        this.A0F = false;
        this.A0E = new AtomicBoolean(false);
        this.A05 = true;
        this.A0C = c2689ur.A0C();
        this.A0B = c2689ur.A0B();
        this.A0A = c2689ur.A05();
        this.A0G = C2380ps.A00(c2689ur.A06(), this.A0A, this);
        this.A09 = new RelativeLayout(c2689ur.A06());
        this.A0D = A00(c2689ur, this.A0A.A32(), this.A0A.A1X());
        this.A08 = new RelativeLayout(c2689ur.A06());
        AbstractC2426qc.A0L(this.A08);
        AbstractC2426qc.A0L(this.A09);
        this.A07 = c2689ur.A02();
        A04();
        this.A09.addView(this.A08, new RelativeLayout.LayoutParams(-2, -2));
        addView(this.A09, new RelativeLayout.LayoutParams(-1, -1));
        String strA08 = this.A0A.A32().A0I().A08();
        if (strA08 != null) {
            AbstractC2668uW.A00(c2689ur.A06(), this.A09, strA08);
        }
        this.A0D.setInfo(this.A0A.A32().A0J(), this.A0A.A32().A0K(), this.A0A.A37(), this.A0A.A35().A01(), null, null);
        A03();
        super.A08.A06().A0F().AM1(AbstractC2361pZ.A00(this.A00), getResources().getConfiguration().orientation, false, true, AbstractC1701ef.A0E(super.A08.A04()));
    }

    private AbstractC0891Es A00(C2689ur c2689ur, C1735fE c1735fE, String str) {
        float fA0M;
        String strA08 = c1735fE.A0I().A08();
        if (strA08 != null) {
            fA0M = new C2086kz(c2689ur.A06()).A0M(strA08);
        } else {
            fA0M = -1.0f;
        }
        this.A00 = fA0M;
        AbstractC0891Es abstractC0891EsA03 = new C2669uX(this.A00, str, c2689ur.A06(), getColors(), c2689ur.A05(), c2689ur.A0C(), getCtaButton(), A0I, false, c2689ur.A07(), c2689ur.A0F(), c2689ur.A0A(), c2689ur.A0E(), c2689ur.A08(), false).A03();
        if (c2689ur.A0G() != null) {
            abstractC0891EsA03.setChainedAdInfo(c2689ur.A0G());
        }
        return abstractC0891EsA03;
    }

    private void A01() {
        this.A02 = new C2701v3(super.A08.A06(), this.A0A, super.A08.A08(), this.A06, super.A08.A0C());
        this.A02.A0K(false);
        addView(this.A02.A0E(getCtaButton()));
    }

    private void A02() {
        AbstractC2426qc.A0e(this.A0D);
        EnumC2275o7 enumC2275o7A00 = EnumC2275o7.A00(this.A0A.A1a());
        if (enumC2275o7A00 == EnumC2275o7.A08) {
            if (this.A03 != null) {
                return;
            }
            this.A03 = new C2728vU(super.A08.A06(), this.A0A, super.A08.A08(), this.A06, super.A08.A0C(), this.A0B);
            addView(this.A03.A0K(getCtaButton()), new RelativeLayout.LayoutParams(-1, -1));
            return;
        }
        if (enumC2275o7A00 == EnumC2275o7.A05) {
            if (this.A01 != null) {
                return;
            }
            this.A01 = new C2673ub(super.A08.A06(), this.A0A, super.A08.A08(), this.A06, super.A08.A0C());
            addView(this.A01.A0D(getCtaButton()), new RelativeLayout.LayoutParams(-1, -1));
            return;
        }
        if (!this.A0A.A32().A0L().A03().isEmpty()) {
            this.A04 = new C1861hI(super.A08.A06(), this.A0A, this.A0C, getCtaButton(), this.A06, super.A08.A08());
            this.A04.A0f(false);
            RelativeLayout.LayoutParams infoParams = new RelativeLayout.LayoutParams(-1, -1);
            addView(this.A04.A0W(), infoParams);
            return;
        }
        A01();
    }

    private void A03() {
        AbstractC2426qc.A0K(this.A0D);
        addView(this.A0D, new RelativeLayout.LayoutParams(-1, -1));
        this.A0D.setVisibility(0);
        A05(getResources().getConfiguration().orientation);
        this.A0D.A0u(getResources().getConfiguration().orientation);
        this.A0D.bringToFront();
    }

    private void A04() {
        if (this.A07 == null) {
            return;
        }
        this.A08.addView(this.A07, new RelativeLayout.LayoutParams(-2, -2));
        AbstractC2426qc.A0L(this.A07);
        C2379pr c2379prA02 = this.A0G.A02(this.A0A);
        super.A08.A06().A0H().A00(c2379prA02.A01);
        if (c2379prA02.A00) {
            this.A07.setOnClickListener(new ViewOnClickListenerC2676ue(this));
        } else {
            if (!C2203mv.A1J(getAdContextWrapper())) {
                return;
            }
            AbstractC2621tl.A00(this.A07, C2203mv.A1K(getAdContextWrapper()), new ViewOnClickListenerC2677uf(this));
        }
    }

    private void A05(int i5) {
        A06(i5);
        A07(i5, this.A09, this.A08);
    }

    private void A06(int i5) {
        if (this.A07 == null) {
            return;
        }
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.A07.getLayoutParams();
        layoutParams.removeRule(13);
        layoutParams.removeRule(10);
        layoutParams.removeRule(9);
        if (i5 == 1) {
            layoutParams.width = -1;
            layoutParams.height = -2;
            layoutParams.addRule(10);
        } else {
            layoutParams.width = -2;
            layoutParams.height = -1;
            if (AbstractC2361pZ.A05(this.A00)) {
                layoutParams.addRule(13);
            } else {
                layoutParams.addRule(9);
            }
        }
        this.A07.setLayoutParams(layoutParams);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A07(int i5, ViewGroup viewGroup, RelativeLayout relativeLayout) {
        if (!(this.A0D instanceof C06986q)) {
            AbstractC0891Es abstractC0891Es = this.A0D;
            String[] strArr = A0H;
            if (strArr[1].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            A0H[2] = "B1dyWth12L6yWah5";
            if (abstractC0891Es instanceof C06976p) {
                AbstractC2426qc.A0K(this.A0D);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
                if (getResources().getConfiguration().orientation == 2) {
                    layoutParams.addRule(1, relativeLayout.getId());
                    this.A0D.setLayoutParams(layoutParams);
                    viewGroup.addView(this.A0D);
                } else {
                    addView(this.A0D, layoutParams);
                }
            }
        }
        this.A0D.A0l(i5);
        if (A0H[7].charAt(0) == 'a') {
            throw new RuntimeException();
        }
        A0H[3] = "wBoil6AAawdX4Jy27KUXy3SWPNH5B";
        this.A0D.A0y(viewGroup, relativeLayout, i5);
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
    public final EnumC1698ec A1P(String str) {
        return this.A0D.getCTAButton().A0E(str);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() {
        super.A1Q();
        this.A06.removeCallbacksAndMessages(null);
        this.A0D.A0j();
        if (this.A03 != null) {
            this.A03.A0L();
        }
        if (this.A01 != null) {
            this.A01.A0E();
        }
        if (this.A04 != null) {
            this.A04.A0Y();
        }
        if (this.A02 != null) {
            this.A02.A0H();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        super.A1X(c1735fE, str, d5, bundle);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1b(boolean z11) {
        super.A1b(z11);
        this.A0D.A0m(z11);
        if (this.A03 != null) {
            this.A03.A0N(z11);
        }
        if (this.A01 != null) {
            this.A01.A0G(z11);
        }
        if (this.A04 != null) {
            this.A04.A0e(z11);
        }
        if (this.A02 != null) {
            this.A02.A0J(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1d() {
        return this.A0A.A32().A0W();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1i(boolean z11) {
        if (this.A0A.A32().A0W() && !this.A0E.get()) {
            A1j();
            return true;
        }
        return false;
    }

    public final void A1j() {
        this.A0E.set(true);
        AbstractC2426qc.A0e(this.A08, this.A0D, this.A09);
        AbstractC2426qc.A0M(this.A0B);
        AbstractC2426qc.A0X(this);
        A02();
        this.A05 = true;
        if (super.A08.A0D() != null) {
            super.A08.A0D().AH3(true);
            if (this.A0B != null && this.A0A.A32().A0L().A00() > 0) {
                this.A05 = false;
                if (this.A0A.A3N()) {
                    this.A0B.setToolbarActionMode(8);
                } else {
                    this.A0B.setToolbarActionMode(2);
                }
                new Handler(Looper.getMainLooper()).postDelayed(new RunnableC2678ug(this), this.A0A.A32().A0L().A00());
            }
        }
    }

    public final boolean A1k() {
        return this.A0E.get();
    }

    public final boolean A1l() {
        return this.A05;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public int getCloseButtonStyle() {
        if (A1d() && !this.A0E.get()) {
            return 1;
        }
        return super.getCloseButtonStyle();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.A03 != null && this.A0E.get()) {
            this.A03.A0M(configuration.orientation);
            return;
        }
        if (this.A01 != null && this.A0E.get()) {
            this.A01.A0F(configuration.orientation);
            return;
        }
        C1861hI c1861hI = this.A04;
        if (A0H[2].length() == 1) {
            throw new RuntimeException();
        }
        A0H[3] = "1nPVrd0jWGY7";
        if (c1861hI != null && this.A0E.get()) {
            this.A04.A0a(configuration.orientation);
        } else {
            A05(configuration.orientation);
        }
    }
}
