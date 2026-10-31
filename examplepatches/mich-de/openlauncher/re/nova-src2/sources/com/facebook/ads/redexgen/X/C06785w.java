package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.graphics.Rect;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.5w, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06785w extends D8 {
    public static byte[] A0B;
    public static String[] A0C = {"7OndFOhXL4fFvt9jPrbRhbPvcdx7xG0m", "u66anQJsGMZImmEGY3J", "6QUuw3fE6YZInEgeelDD1riYgCDiwwWd", "dlwfam", "Gd24NhAKQwSMVORdYrbX7OKUmJ6Jo9hH", "tp1lJvSeXkYaHvz0HBRMtdf0GjUKpBkN", "3puR3ZuXflvVCggj3hbkYFVhWEAiWGf8", "SuC9F05via3NQdhkRFt"};
    public C2370pi A00;
    public AbstractC2685un A01;
    public C0781Am A02;
    public boolean A03;
    public final ImageView A04;
    public final InterfaceC2004je A05;
    public final C1814gV A06;
    public final List<C2370pi> A07;
    public final AtomicBoolean A08;
    public final AtomicBoolean A09;
    public final AtomicBoolean A0A;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 53);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A0B = new byte[]{-60, -51, -48, -63, -61, -62, -67, -52, -46, -62, -6, -2, -14, -8, -10, -4, -12, -14, -7};
    }

    static {
        A09();
    }

    public C06785w(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, InterfaceC2224nG interfaceC2224nG, LA la2, C2086kz c2086kz, InterfaceC2459r9 interfaceC2459r9) {
        C1814gV c1814gV;
        super(c0958Hi, interfaceC2515s3, interfaceC2224nG, la2, c2086kz, interfaceC2459r9);
        this.A05 = new C0845Cy(this);
        this.A09 = new AtomicBoolean(false);
        this.A08 = new AtomicBoolean(false);
        this.A0A = new AtomicBoolean(false);
        this.A03 = false;
        this.A07 = new ArrayList();
        if (interfaceC2515s3 instanceof FG) {
            c1814gV = new C1814gV(c0958Hi, interfaceC2515s3, la2.A1u(), interfaceC2459r9);
        } else {
            c1814gV = null;
        }
        this.A06 = c1814gV;
        this.A04 = new ImageView(getContext());
        int forceTimeSeconds = getEffectiveForceTimeSeconds();
        if (forceTimeSeconds > 0) {
            this.A02 = new C0781Am(c0958Hi, forceTimeSeconds * 1000);
        }
        this.A04.setScaleType(ImageView.ScaleType.CENTER);
        this.A04.setAdjustViewBounds(true);
        new AsyncTaskC0892Et(this.A04, super.A05).A05(super.A03.A32().A0I().A00(), super.A03.A32().A0I().A01()).A06(new C0844Cx(this)).A07(super.A03.A32().A0I().A08());
    }

    private AbstractC2685un A01(int i5) throws SecurityException {
        if (this.A04.getParent() != null) {
            AbstractC2426qc.A0K(this.A04);
        }
        C2688uq c2688uqA0M = new C2688uq(super.A05, super.A06, super.A0A, super.A03, this.A04, this.A0C, super.A08).A0J(super.A09.getToolbarHeight()).A0P(super.A09).A0I(i5).A0M(super.A07);
        if (this.A02 != null) {
            c2688uqA0M.A0R(this.A02);
        }
        c2688uqA0M.A0L(C1702eg.A00(super.A05, super.A06, A03(0, 0, 77), AbstractC2351pP.A00(super.A03.A32().A0K().A06()), new HashMap(), super.A03.A33()));
        C2689ur params = c2688uqA0M.A0U();
        return AbstractC2686uo.A00(params, null, true);
    }

    private void A06() {
        if (this.A00 != null) {
            this.A00.A06();
            this.A07.remove(this.A00);
            this.A00 = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07() {
        if (this.A09.get() && this.A08.get()) {
            A0n();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A08() {
        this.A0A.set(true);
        if (this.A06 != null) {
            super.A0A.A5C(this.A0B.A7L());
            this.A06.A06();
        }
    }

    private void A0A(int i5) {
        AbstractC2426qc.A0K(this.A01);
        this.A01 = A01(i5);
        if ((this.A0B instanceof FG) && !this.A04.hasOnClickListeners()) {
            this.A04.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.ru
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.A00.A0x(view);
                }
            });
        }
        if (A0F()) {
            this.A01.A02(new InterfaceC2643u7() { // from class: com.facebook.ads.redexgen.X.D1
                @Override // com.facebook.ads.redexgen.X.InterfaceC2643u7
                public final void AEZ() {
                    this.A00.A0v();
                }
            });
        }
        this.A01.setAccidentalClickCappingListener(new InterfaceC1699ed() { // from class: com.facebook.ads.redexgen.X.D0
            @Override // com.facebook.ads.redexgen.X.InterfaceC1699ed
            public final void ADg() {
                this.A00.A0w();
            }
        });
        this.A01.setNtdHideCallback(new InterfaceC2684um() { // from class: com.facebook.ads.redexgen.X.Cz
            @Override // com.facebook.ads.redexgen.X.InterfaceC2684um
            public final void AEO(View view) {
                this.A00.A0y(view);
            }
        });
        C1744fN colors = this.A01.getColors();
        Integer backgroundColorForToolbar = getBackgroundColorForToolbar();
        boolean z11 = true;
        if (backgroundColorForToolbar == null) {
            AbstractC2426qc.A0O(this, colors.A08(this.A01 != null && (this.A01.A1g() || (this.A01 instanceof AbstractC0878Ef))));
        } else {
            AbstractC2426qc.A0O(this, backgroundColorForToolbar.intValue());
        }
        super.A09.setFullscreen(this.A01.A1g());
        super.A09.A0D(colors, ViewOnClickListenerC0884El.A05(super.A03));
        A0r(this.A01);
        if (super.A01 != null) {
            addView(super.A01, 0, D8.A0H);
        }
        if (this.A01 == null || !this.A01.A1g()) {
            z11 = false;
        }
        setUpFullscreenMode(z11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0B(int i5) {
        super.A02 = true;
        super.A09.setToolbarActionMode(8);
        int persistentForcedNtdPlays = super.A03.A30();
        this.A00 = new C2370pi(i5 * persistentForcedNtdPlays, new C0840Ct(this));
        this.A00.A07();
        this.A07.add(this.A00);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0F() {
        return super.A03.A3G() && !super.A03.A32().A0U();
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final AbstractC2452r2 A0l() {
        AbstractC2452r2 abstractC2452r2A0l = super.A0l();
        if (super.A03.A3R()) {
            abstractC2452r2A0l.setOnClickListener(new ViewOnClickListenerC2504rs(this));
        }
        return abstractC2452r2A0l;
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0p() {
        if (this.A01 != null) {
            super.A07.A04(EnumC2231nN.A0Y, null);
            this.A03 = true;
            if (A0F()) {
                if (super.A03.A32().A0W()) {
                    this.A01.A1i(false);
                }
                this.A01.A1P(A03(0, 10, 41));
                A0o();
                A06();
                if (this.A0A.get()) {
                    super.A09.setToolbarActionMode(0);
                    return;
                }
                return;
            }
            if (super.A03.A3K() && super.A03.A32().A0U()) {
                this.A01.A1V();
                A0o();
                return;
            }
            EnumC1698ec enumC1698ecA1P = this.A01.A1P(A03(15, 4, 84));
            if (super.A03.A3H()) {
                return;
            }
            EnumC1698ec actionOutcome = EnumC1698ec.A08;
            if (enumC1698ecA1P != actionOutcome) {
                EnumC1698ec actionOutcome2 = EnumC1698ec.A05;
                if (enumC1698ecA1P != actionOutcome2) {
                    A0o();
                }
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0q() {
        AbstractC2426qc.A0M(this.A01);
        AbstractC2426qc.A0M(super.A09);
        this.A08.set(true);
        A07();
        int effectiveForceTimeSeconds = getEffectiveForceTimeSeconds();
        int iA02 = super.A03.A32().A0I().A02();
        if (effectiveForceTimeSeconds > 0) {
            if (this.A01 != null) {
                AbstractC2685un abstractC2685un = this.A01;
                if (A0C[5].charAt(31) != 'N') {
                    throw new RuntimeException();
                }
                A0C[5] = "InnCWjgAzy1Ng21MZZ8xI6Z1vcuYV5SN";
                abstractC2685un.A1U();
            }
            this.A07.add(A0k(effectiveForceTimeSeconds, new C0843Cw(this, effectiveForceTimeSeconds), this.A02, new C0842Cv(this)));
            if (iA02 == 0 || iA02 >= effectiveForceTimeSeconds) {
                super.A02 = true;
                super.A09.setToolbarActionMode(8);
                return;
            } else {
                if (iA02 <= 0 || A0F()) {
                    return;
                }
                super.A09.setProgressSpinnerInvisible(true);
                this.A07.add(A0j(iA02, new C0841Cu(this), null));
                return;
            }
        }
        AbstractC2452r2 abstractC2452r2 = super.A09;
        int effectiveUnskippableSeconds = getCloseButtonStyle();
        abstractC2452r2.setToolbarActionMode(effectiveUnskippableSeconds);
        A08();
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0s(C1998jY c1998jY) {
        FrameLayout.LayoutParams layoutParams;
        c1998jY.A0A(this.A05);
        int orientation = c1998jY.A05().getResources().getConfiguration().orientation;
        A0A(orientation);
        if (A0u()) {
            AbstractC2426qc.A0K(super.A09);
        }
        boolean zA0u = A0u();
        if (A0C[7].length() == 19) {
            String[] strArr = A0C;
            strArr[1] = "eIrljY9WLCj2qZVYxAY";
            strArr[3] = "cN2qfG";
            if (zA0u) {
                layoutParams = new FrameLayout.LayoutParams(-1, -2);
                Rect requestedMargins = super.A09.getRequestedMargins();
                if (requestedMargins == null) {
                    layoutParams.setMargins(0, AbstractC2383pv.A0u, 0, 0);
                } else {
                    int i5 = requestedMargins.left;
                    int i11 = requestedMargins.top;
                    String[] strArr2 = A0C;
                    String str = strArr2[6];
                    String str2 = strArr2[2];
                    int iCharAt = str.charAt(27);
                    int orientation2 = str2.charAt(27);
                    if (iCharAt != orientation2) {
                        String[] strArr3 = A0C;
                        strArr3[0] = "kD9MFQRuMfEwIMuparMuFvmLXjVrNoLK";
                        strArr3[4] = "8tRwa2zHQDKU02uvOr7MIFjDGekFRcgq";
                        int i12 = requestedMargins.right;
                        int orientation3 = requestedMargins.bottom;
                        layoutParams.setMargins(i5, i11, i12, orientation3);
                    } else {
                        String[] strArr4 = A0C;
                        strArr4[1] = "1QUiUzza5altpTl6Wm0";
                        strArr4[3] = "RDlmq9";
                        int i13 = requestedMargins.right;
                        int orientation4 = requestedMargins.bottom;
                        layoutParams.setMargins(i5, i11, i13, orientation4);
                    }
                }
            } else {
                layoutParams = new FrameLayout.LayoutParams(-1, super.A09.getToolbarHeight());
            }
            View view = super.A09;
            String[] strArr5 = A0C;
            String str3 = strArr5[6];
            String str4 = strArr5[2];
            int iCharAt2 = str3.charAt(27);
            int orientation5 = str4.charAt(27);
            if (iCharAt2 == orientation5) {
                String[] strArr6 = A0C;
                strArr6[0] = "fkMlabU8sQnoX87MnrY1Pev3S4jiVWdQ";
                strArr6[4] = "bfzZB4DobhU3EGIatrsc2EQHdnYavGAY";
                addView(view, layoutParams);
                AbstractC2426qc.A0I(this.A01);
                AbstractC2426qc.A0I(super.A09);
                return;
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final boolean A0t() {
        return this.A01 != null && this.A01.A1i(false);
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final boolean A0u() {
        return super.A03.A2V() || super.A03.A2q() || super.A03.A2K();
    }

    public final /* synthetic */ void A0v() {
        this.A03 = true;
    }

    public final /* synthetic */ void A0w() {
        A0o();
    }

    public final /* synthetic */ void A0x(View view) {
        this.A03 = true;
        if (this.A01 != null) {
            this.A01.A1P(A03(10, 5, 92));
        }
    }

    public final /* synthetic */ void A0y(View view) {
        if (super.A03.A3L()) {
            A0o();
        }
        if (super.A03.A3M() && view != null) {
            view.setOnClickListener(null);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
        Iterator<C2370pi> it = this.A07.iterator();
        while (it.hasNext()) {
            it.next().A06();
        }
        if (this.A02 != null) {
            this.A02.A08();
        }
        if (this.A01 != null) {
            this.A01.A1b(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
        Iterator<C2370pi> it = this.A07.iterator();
        while (it.hasNext()) {
            it.next().A07();
        }
        if (this.A01 != null) {
            this.A01.A1c(z11);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getCloseButtonStyle() {
        if (this.A01 != null) {
            return this.A01.getCloseButtonStyle();
        }
        return 0;
    }

    private int getEffectiveForceTimeSeconds() {
        int secondsForReward;
        int iA04 = super.A03.A32().A0I().A04();
        if (iA04 <= 0 && (secondsForReward = super.A03.A32().A0I().A03()) > 0 && secondsForReward != Integer.MAX_VALUE) {
            iA04 = secondsForReward;
        }
        if (iA04 <= 0) {
            InterfaceC2515s3 interfaceC2515s3 = this.A0B;
            String[] strArr = A0C;
            String str = strArr[0];
            String str2 = strArr[4];
            int iCharAt = str.charAt(17);
            int forceTimeSeconds = str2.charAt(17);
            if (iCharAt != forceTimeSeconds) {
                throw new RuntimeException();
            }
            A0C[5] = "IISOmy5wUb9kbPwMGbeFamNABq4wsTvN";
            if (interfaceC2515s3 instanceof FG) {
                iA04 = 5;
                C2232nO c2232nO = super.A07;
                String[] strArr2 = A0C;
                String str3 = strArr2[6];
                String str4 = strArr2[2];
                int iCharAt2 = str3.charAt(27);
                int forceTimeSeconds2 = str4.charAt(27);
                if (iCharAt2 != forceTimeSeconds2) {
                    A0C[7] = "hwbe6IzVGEIGnFYCGus";
                    c2232nO.A04(EnumC2231nN.A0u, null);
                } else {
                    String[] strArr3 = A0C;
                    strArr3[0] = "ggpAthkRO8dLNjB9arK6lUDuPnIwRyXW";
                    strArr3[4] = "rJU3jIJm8zUBUkzdOrnlJmssj3q33cg9";
                    c2232nO.A04(EnumC2231nN.A0u, null);
                }
            }
        }
        return iA04;
    }

    @Override // com.facebook.ads.redexgen.X.D8, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (!super.A03.A32().A0U() && !A0u()) {
            A0A(configuration.orientation);
        }
    }

    @Override // com.facebook.ads.redexgen.X.D8, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
        Iterator<C2370pi> it = this.A07.iterator();
        while (it.hasNext()) {
            it.next().A06();
        }
        if (C2203mv.A1z(super.A05)) {
            super.A05.A0B().ALo(this.A04);
        }
        AbstractC2685un abstractC2685un = this.A01;
        String[] strArr = A0C;
        if (strArr[1].length() == strArr[3].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0C;
        strArr2[1] = "TUlRzJZbxFgmcKRHhm4";
        strArr2[3] = "GjzV0D";
        if (abstractC2685un != null) {
            this.A01.A1Q();
        }
        super.onDestroy();
    }
}
