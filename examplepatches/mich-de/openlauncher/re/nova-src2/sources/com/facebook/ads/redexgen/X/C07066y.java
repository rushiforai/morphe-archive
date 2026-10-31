package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;

/* renamed from: com.facebook.ads.redexgen.X.6y, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07066y extends AbstractC0902Fd {
    public static String[] A0F = {"Wig1hLPkKRVxVmj3WWn5TJs0oa9CPoof", "nXJy7w8xrBopQigqFpns", "L9zf6W9Mlj7Zg9Gn", "g2eJG", "3uE", "W6oSc", "Ua6HLBUtKyHuD7Z", "bgivUb39KQdrYsEepiJJw5K7MLLYT62o"};
    public C5Z A00;
    public String A01;
    public boolean A02;
    public boolean A03;
    public final ViewGroup A04;
    public final C2086kz A05;
    public final InterfaceC2224nG A06;
    public final C0799Be A07;
    public final BM A08;
    public final BK A09;
    public final C0790Av A0A;
    public final ViewOnClickListenerC0787As A0B;
    public final C0786Ar A0C;
    public final AbstractC1540c3 A0D;
    public final C1539c2 A0E;

    public C07066y(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, C2086kz c2086kz, C2232nO c2232nO, View.OnClickListener onClickListener, LA la2) {
        super(c0958Hi, onClickListener, c2232nO, la2);
        this.A03 = false;
        this.A02 = false;
        this.A08 = new BM() { // from class: com.facebook.ads.redexgen.X.70
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                if (C2203mv.A1T(((AbstractC0902Fd) this.A00).A08)) {
                    this.A00.A07.A0f(EnumC1664e4.A03, 30);
                }
            }
        };
        this.A09 = new C07076z(this);
        this.A06 = interfaceC2224nG;
        this.A05 = c2086kz;
        this.A0D = A00();
        this.A0E = A07();
        this.A04 = new FrameLayout(c0958Hi);
        addView(this.A04, new RelativeLayout.LayoutParams(-1, -1));
        this.A07 = A01(c2232nO);
        this.A0B = A04();
        this.A0A = A03();
        this.A0C = A06(c2232nO);
        AbstractC2426qc.A0L(this.A0C);
        A0G();
    }

    private C0901Fc A00() {
        return new C0901Fc(this);
    }

    private C0799Be A01(C2232nO c2232nO) {
        C0799Be c0799Be = new C0799Be(super.A08);
        AbstractC2426qc.A0L(c0799Be);
        c0799Be.setFunnelLoggingHandler(c2232nO);
        c0799Be.getEventBus().A03(this.A08, this.A09);
        if (C2203mv.A1V(super.A08)) {
            c0799Be.setVolume(0.0f);
        }
        boolean zA1Q = C2203mv.A1Q(super.A08);
        if (A0F[4].length() != 3) {
            throw new RuntimeException();
        }
        A0F[5] = "REocw";
        if (!zA1Q) {
            c0799Be.setOnClickListener(new ViewOnClickListenerC2477rR(this));
        }
        RelativeLayout.LayoutParams videoLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
        videoLayoutParams.addRule(13);
        addView(c0799Be, videoLayoutParams);
        return c0799Be;
    }

    private C0790Av A03() {
        C0790Av c0790Av = new C0790Av(super.A08);
        c0790Av.setTextColor(-1);
        AbstractC2426qc.A0b(c0790Av, false, 12);
        c0790Av.setGravity(17);
        this.A07.A0g(c0790Av);
        return c0790Av;
    }

    private ViewOnClickListenerC0787As A04() {
        ViewOnClickListenerC0787As viewOnClickListenerC0787As = new ViewOnClickListenerC0787As(super.A08);
        this.A07.A0g(viewOnClickListenerC0787As);
        return viewOnClickListenerC0787As;
    }

    private C0786Ar A06(C2232nO c2232nO) {
        C0786Ar c0786Ar = new C0786Ar(super.A08, c2232nO, true);
        c0786Ar.setBackgroundPaintColor(855638016);
        this.A07.A0g(c0786Ar);
        return c0786Ar;
    }

    private C1539c2 A07() {
        return new C1539c2(this, 50, true, new WeakReference(this.A0D), super.A08);
    }

    private void A09() {
        if (getVisibility() == 0 && this.A02 && hasWindowFocus()) {
            this.A0E.A0U();
            return;
        }
        if (super.A05 != null) {
            super.A05.A0P();
        }
        this.A0E.A0V();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
    public final void A0E() {
        this.A0E.A0V();
        this.A07.getEventBus().A04(this.A08, this.A09);
        this.A07.A0X();
        if (super.A05 != null) {
            super.A05.A0O();
        }
        C0799Be c0799Be = this.A07;
        String[] strArr = A0F;
        if (strArr[3].length() == strArr[1].length()) {
            throw new RuntimeException();
        }
        A0F[5] = "m52FM";
        AbstractC2426qc.A0K(c0799Be);
        if (this.A00 != null) {
            this.A00.A0p();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
    public final void A0F() {
        super.A0F();
        this.A0C.A09();
        this.A03 = true;
        this.A0E.A0U();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
    public final void A0G() {
        super.A0G();
        if (C2203mv.A1W(super.A08)) {
            AbstractC2426qc.A0K(this.A0B);
            this.A0B.setLayoutParams(A0D(true, false));
            addView(this.A0B);
        }
        if (C2203mv.A1S(super.A08)) {
            AbstractC2426qc.A0K(this.A0A);
            this.A0A.setLayoutParams(A0D(true, true));
            addView(this.A0A);
        }
        if (C2203mv.A1U(super.A08)) {
            AbstractC2426qc.A0K(this.A0C);
            this.A0C.setLayoutParams(A0D(false, false));
            addView(this.A0C);
        }
        if (super.A04 != null) {
            AbstractC2426qc.A0K(super.A04);
            if (C2203mv.A1U(super.A08)) {
                super.A04.setLayoutParams(AbstractC0902Fd.A0B(this.A0C));
            } else {
                super.A04.setLayoutParams(AbstractC0902Fd.A0B(null));
            }
            addView(super.A04);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
    public final boolean A0H() {
        return this.A07.A0m();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
    public final boolean A0I() {
        if (getMeasuredWidth() <= 0 || this.A07.getMeasuredWidth() <= 0) {
            return true;
        }
        int measuredWidth = (int) ((getMeasuredWidth() - this.A07.getMeasuredWidth()) / 2.0d);
        int i5 = AbstractC0902Fd.A0C;
        int widthGap = AbstractC0902Fd.A0B;
        return measuredWidth > i5 + (widthGap * 2);
    }

    public final C07066y A0J(String str, String str2, String str3, String str4, String str5) {
        this.A01 = str2;
        this.A07.setVideoURI(this.A05.A0T(str2));
        this.A00 = new C5Z(super.A08, this.A06, this.A07, str);
        if (str3 != null) {
            boolean zIsEmpty = TextUtils.isEmpty(str3);
            String[] strArr = A0F;
            String str6 = strArr[3];
            String cachedVideoUrl = strArr[1];
            if (str6.length() == cachedVideoUrl.length()) {
                throw new RuntimeException();
            }
            A0F[6] = "ntVhLGQ5bthREmR";
            if (!zIsEmpty) {
                new AsyncTaskC0892Et(this.A04, super.A08).A05(this.A04.getHeight(), this.A04.getWidth()).A06(new C0900Fb(this)).A07(str3);
            }
        }
        if (str5 != null) {
            this.A0B.setPlayAccessibilityLabel(str4);
        }
        if (str5 != null) {
            this.A0B.setPauseAccessibilityLabel(str5);
        }
        return this;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
    public int getMediaViewId() {
        return this.A07.getId();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.A02 = true;
        A09();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.A02 = false;
        A09();
    }

    @Override // android.view.View
    public final void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        A09();
    }

    @Override // android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        A09();
    }
}
