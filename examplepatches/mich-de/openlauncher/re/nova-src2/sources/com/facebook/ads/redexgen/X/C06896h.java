package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.view.View;
import android.widget.RelativeLayout;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.6h, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06896h extends AbstractC0878Ef {
    public static byte[] A0B;
    public static String[] A0C = {"c", "LY5VuE3sw40uvda5OQZKW3PreLDG4CCi", "yaY62hLg0KEERGlLeoDmNcSPx1UKbNmJ", "WMYiLBtSpNLwztzNEHWBwM41h9X6LETc", "lJgdaiAQrorx7RR6v7Nk", "1EyOY2JXCtksXat6kEe1b6rdzOUJKqwg", "ezcXNiMPWsqFOxerBn6KS8GabMq", "kdyJCeyQxSdwIYyLBskZ6hZJRVJxcaw"};
    public float A00;
    public C2673ub A01;
    public C2728vU A02;
    public C1861hI A03;
    public boolean A04;
    public final Handler A05;
    public final View A06;
    public final RelativeLayout A07;
    public final RelativeLayout A08;
    public final AbstractC2452r2 A09;
    public final InterfaceC2459r9 A0A;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 2);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A0B = new byte[]{AbstractJsonLexerKt.TC_INVALID, 123, 119, 113, 115, 107, 124, 110, 120, 107, 125, 124, 125, 70, 111, 112, 125, 124, 118};
    }

    static {
        A06();
    }

    public C06896h(C2689ur c2689ur) {
        super(c2689ur, true);
        this.A05 = new Handler(Looper.getMainLooper());
        this.A04 = false;
        this.A0A = c2689ur.A0C();
        this.A09 = c2689ur.A0B();
        this.A08 = new RelativeLayout(c2689ur.A06());
        this.A07 = new RelativeLayout(c2689ur.A06());
        AbstractC2426qc.A0L(this.A07);
        AbstractC2426qc.A0L(this.A08);
        this.A06 = c2689ur.A02();
        A04();
        this.A08.addView(this.A07, new RelativeLayout.LayoutParams(-2, -2));
        addView(this.A08, new RelativeLayout.LayoutParams(-1, -1));
        String strA08 = getAdInfo().A0I().A08();
        if (strA08 != null) {
            AbstractC2668uW.A00(c2689ur.A06(), this.A08, strA08);
        }
        A03();
        ((AbstractC2685un) this).A08.A06().A0F().AM1(AbstractC2361pZ.A00(this.A00), getResources().getConfiguration().orientation, false, false, AbstractC1701ef.A0E(((AbstractC2685un) this).A08.A04()));
    }

    private void A02() {
        EnumC2275o7 enumC2275o7A00 = EnumC2275o7.A00(getAdDataBundle().A1a());
        if (enumC2275o7A00 == EnumC2275o7.A08) {
            if (this.A02 != null) {
                return;
            }
            AbstractC2426qc.A0e(getAdDetailsView(), getCtaButton());
            this.A02 = new C2728vU(((AbstractC2685un) this).A08.A06(), getAdDataBundle(), ((AbstractC2685un) this).A08.A08(), this.A05, this.A0A, this.A09);
            addView(this.A02.A0K(getCtaButton()), new RelativeLayout.LayoutParams(-1, -1));
            return;
        }
        EnumC2275o7 enumC2275o7 = EnumC2275o7.A05;
        if (A0C[6].length() == 8) {
            throw new RuntimeException();
        }
        A0C[4] = "YRtDzV4ZcHqRVqrZ3ByQ";
        if (enumC2275o7A00 == enumC2275o7) {
            if (this.A01 != null) {
                return;
            }
            AbstractC2426qc.A0e(getAdDetailsView(), getCtaButton());
            this.A01 = new C2673ub(((AbstractC2685un) this).A08.A06(), getAdDataBundle(), ((AbstractC2685un) this).A08.A08(), this.A05, this.A0A);
            addView(this.A01.A0D(getCtaButton()), new RelativeLayout.LayoutParams(-1, -1));
            return;
        }
        AbstractC2426qc.A0e(this.A09, getAdDetailsView(), getCtaButton());
        this.A03 = new C1861hI(((AbstractC2685un) this).A08.A06(), getAdDataBundle(), this.A0A, getCtaButton(), this.A05, ((AbstractC2685un) this).A08.A08());
        RelativeLayout.LayoutParams infoParams = new RelativeLayout.LayoutParams(-1, -1);
        addView(this.A03.A0W(), infoParams);
    }

    private void A03() {
        AbstractC2426qc.A0K(getAdDetailsView());
        addView(getAdDetailsView(), new RelativeLayout.LayoutParams(-1, -1));
        getAdDetailsView().setVisibility(0);
        A07(getResources().getConfiguration().orientation);
        if (getAdDetailsView() instanceof AbstractC0891Es) {
            ((AbstractC0891Es) getAdDetailsView()).A0u(getResources().getConfiguration().orientation);
        }
    }

    private void A04() {
        if (this.A06 == null) {
            return;
        }
        this.A07.addView(this.A06, new RelativeLayout.LayoutParams(-2, -2));
        AbstractC2426qc.A0L(this.A06);
        C2379pr c2379prA02 = ((AbstractC0878Ef) this).A08.A02(getAdDataBundle());
        ((AbstractC2685un) this).A08.A06().A0H().A00(c2379prA02.A01);
        if (c2379prA02.A00) {
            this.A06.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.uk
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.A00.A1q(view);
                }
            });
        } else {
            if (!C2203mv.A1J(getAdContextWrapper())) {
                return;
            }
            AbstractC2621tl.A00(this.A06, C2203mv.A1K(getAdContextWrapper()), new ViewOnClickListenerC2683ul(this));
        }
    }

    private void A05() {
        super.A09.set(true);
        AbstractC2426qc.A0X(this);
        int i5 = 2;
        AbstractC2426qc.A0e(this.A07, getAdDetailsView());
        AbstractC2426qc.A0M(this.A09);
        A02();
        if (getAdInfo().A0L().A00() >= 0) {
            this.A04 = true;
            if (this.A09 != null) {
                AbstractC2452r2 abstractC2452r2 = this.A09;
                if (getAdDataBundle().A3N()) {
                    i5 = 8;
                }
                abstractC2452r2.setToolbarActionMode(i5);
                if (A0C[1].charAt(23) != 'r') {
                    throw new RuntimeException();
                }
                A0C[5] = "n8wm5IXYbLpzt1LS3L0lDS1mFaYnkNcJ";
                this.A09.setProgressImmediate(0.0f);
            }
            new C2370pi((int) getAdInfo().A0L().A00(), 20.0f, 20L, new Handler(Looper.getMainLooper()), new C0876Ed(this)).A07();
        }
    }

    private void A07(int i5) {
        A08(i5);
        A1o(i5, this.A08, this.A07);
    }

    private void A08(int i5) {
        if (this.A06 == null) {
            return;
        }
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.A06.getLayoutParams();
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
                RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.A07.getLayoutParams();
                layoutParams2.addRule(14);
                RelativeLayout relativeLayout = this.A07;
                if (A0C[3].charAt(7) == 'Q') {
                    throw new RuntimeException();
                }
                A0C[0] = "b3l6zVr9i";
                relativeLayout.setLayoutParams(layoutParams2);
            } else {
                layoutParams.addRule(9);
            }
        }
        this.A06.setLayoutParams(layoutParams);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A0A() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A0H() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef, com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() throws RemoteException {
        super.A1Q();
        this.A05.removeCallbacksAndMessages(null);
        getAdDetailsView().A0j();
        if (this.A02 != null) {
            this.A02.A0L();
        }
        if (this.A01 != null) {
            this.A01.A0E();
        }
        if (this.A03 != null) {
            this.A03.A0Y();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1W(int i5) {
        if (getAdDataBundle().A1c().equals(A01(5, 14, 27)) && (getAdDetailsView() instanceof AbstractC0891Es)) {
            ((AbstractC0891Es) getAdDetailsView()).A0s(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef, com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        super.A1X(c1735fE, str, d5, bundle);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1b(boolean z11) {
        super.A1b(z11);
        getAdDetailsView().A0m(z11);
        if (this.A02 != null) {
            this.A02.A0N(z11);
        }
        if (this.A01 != null) {
            this.A01.A0G(z11);
        }
        if (this.A03 != null) {
            this.A03.A0e(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1d() {
        return getAdInfo().A0W();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1i(boolean z11) {
        if (getAdInfo().A0W() && !super.A09.get()) {
            A05();
            return true;
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef
    public final AbstractC2624to A1k(C2689ur c2689ur, C1735fE c1735fE, String str) {
        float fA0M;
        String strA08 = c1735fE.A0I().A08();
        if (strA08 != null) {
            fA0M = new C2086kz(c2689ur.A06()).A0M(strA08);
        } else {
            fA0M = -1.0f;
        }
        this.A00 = fA0M;
        return new C2669uX(this.A00, str, c2689ur.A06(), getColors(), c2689ur.A05(), c2689ur.A0C(), getCtaButton(), AbstractC0878Ef.A0H, false, c2689ur.A07(), c2689ur.A0F(), c2689ur.A0A(), c2689ur.A0E(), c2689ur.A08(), false).A03();
    }

    public final /* synthetic */ void A1q(View view) {
        getCtaButton().A0E(A01(0, 5, 20));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public int getCloseButtonStyle() {
        if (this.A04) {
            if (getAdDataBundle().A3N()) {
                return 8;
            }
            return 2;
        }
        if (A1d()) {
            AtomicBoolean atomicBoolean = super.A09;
            if (A0C[5].charAt(24) == 'n') {
                throw new RuntimeException();
            }
            A0C[4] = "FHXgWFqMeBDfmBjqlqLD";
            if (!atomicBoolean.get()) {
                return 1;
            }
        }
        return super.getCloseButtonStyle();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef, com.facebook.ads.redexgen.X.AbstractC2685un, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.A02 != null && super.A09.get()) {
            this.A02.A0M(configuration.orientation);
            return;
        }
        if (this.A01 != null && super.A09.get()) {
            this.A01.A0F(configuration.orientation);
        } else if (this.A03 != null && super.A09.get()) {
            this.A03.A0a(configuration.orientation);
        } else {
            A07(configuration.orientation);
        }
    }
}
