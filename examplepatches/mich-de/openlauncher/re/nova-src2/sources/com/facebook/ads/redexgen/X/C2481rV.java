package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import java.lang.ref.WeakReference;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.rV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2481rV extends FrameLayout {
    public static byte[] A0D;
    public static String[] A0E = {"tbDze41vR57WitlKMZyAWwQAPr5W6UnI", "IuZs1YJSi1bHFsg6mzMK9q5xKMO6o7or", "hodcQuDmNahPcJfuRDFyg3Dt7ywQDJlo", "pe0GQOvuFh5pg2TnQbBafefGr0TJwnl9", "GBdfSPafrBJGpom", "dBimmGt7g4heT7CXoRBe25ieDEtLBdAn", "Fd20gvJSvkSAp5OFhbQMjKnWZcr", "I2dHkzrwBjQ3AOP"};
    public static final int A0F;
    public boolean A00;
    public final LK A01;
    public final LA A02;
    public final C0958Hi A03;
    public final InterfaceC2224nG A04;
    public final C2232nO A05;
    public final C2417qT A06;
    public final C0904Ff A07;
    public final AbstractC0902Fd A08;
    public final AbstractC1540c3 A09;
    public final C1539c2 A0A;
    public final String A0B;
    public final WeakReference<InterfaceC2480rU> A0C;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 20 out of bounds for length 19
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public C2481rV(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, C2086kz c2086kz, WeakReference<InterfaceC2480rU> weakReference, int i5, int i11, int i12, int i13, LK lk2, String str) {
        super(c0958Hi);
        this.A06 = new C2417qT();
        this.A03 = c0958Hi;
        this.A04 = interfaceC2224nG;
        this.A01 = lk2;
        this.A0C = weakReference;
        this.A0B = str;
        LA laA0F = this.A01.A0F();
        if (laA0F == null) {
            throw new IllegalStateException(A09(0, 32, 99));
        }
        this.A02 = this.A01.A0F();
        AbstractC2426qc.A0O(this, -1);
        this.A05 = new C2232nO(this.A01.A7z(), this.A04);
        this.A09 = A06();
        this.A0A = A07(i5, i13, i11, i12);
        LinearLayout linearLayout = new LinearLayout(c0958Hi);
        linearLayout.setOrientation(1);
        addView(linearLayout, new FrameLayout.LayoutParams(-1, -1));
        this.A08 = A04(c2086kz);
        if (this.A08 != null) {
            linearLayout.addView(this.A08, new LinearLayout.LayoutParams(-1, 0, 1.0f));
        }
        this.A07 = A02(laA0F);
        linearLayout.addView(this.A07, new LinearLayout.LayoutParams(-1, -2));
    }

    public static String A09(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 49);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0F() {
        A0D = new byte[]{19, 54, 114, 54, 51, 38, 51, 114, 48, 39, 60, 54, 62, 55, 114, 59, 33, 114, 49, 51, 60, 60, 61, 38, 114, 48, 55, 114, 60, 39, 62, 62, 82, 94, 92, 31, 87, 80, 82, 84, 83, 94, 94, 90, 31, 80, 85, 66, 31, 83, 80, 95, 95, 84, 67, 31, 82, 93, 88, 82, 90, 84, 85};
    }

    static {
        A0F();
        A0F = (int) (AbstractC2385px.A02 * 40.0f);
    }

    private C0904Ff A02(LA la2) {
        C1744fN c1744fNA00;
        C1735fE c1735fEA32 = la2.A32();
        AbstractC0911Fn abstractC0911Fn = new AbstractC0911Fn() { // from class: com.facebook.ads.redexgen.X.6x
            public static byte[] A01;

            static {
                A01();
            }

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 111);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                A01 = new byte[]{65};
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2459r9
            public final void A5C(String str) {
                C1840gw.A00(this.A00.A03).A07(new Intent(str + A00(0, 1, 20) + this.A00.A0B));
            }
        };
        if (getOrientation() == 1) {
            c1744fNA00 = la2.A31().A01();
        } else {
            c1744fNA00 = la2.A31().A00();
        }
        C0904Ff c0904Ff = new C0904Ff(this.A03, A0F, c1744fNA00, c1735fEA32.A0K().A07(), A09(32, 31, 0), this.A04, abstractC0911Fn, this.A0A, this.A06, la2.A33());
        c0904Ff.getCTAButton().getCtaActionHelper().A0A(la2);
        c0904Ff.setInfo(c1735fEA32.A0J(), c1735fEA32.A0K(), this.A01.A7z(), la2.A35().A01(), null, null);
        if (C2203mv.A1N(this.A03)) {
            c0904Ff.A0k();
        }
        return c0904Ff;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [com.facebook.ads.redexgen.X.71] */
    private AbstractC0902Fd A04(C2086kz c2086kz) {
        final ViewOnClickListenerC2478rS viewOnClickListenerC2478rS = new ViewOnClickListenerC2478rS(this);
        String videoUrl = this.A01.A0e();
        if (A0H(c2086kz, this.A01) && videoUrl != null) {
            C07066y c07066yA0J = new C07066y(this.A03, this.A04, c2086kz, this.A05, viewOnClickListenerC2478rS, this.A02).A0J(this.A01.A7z(), videoUrl, this.A01.A0H() != null ? this.A01.A0H().getUrl() : null, this.A01.A0R(), this.A01.A0Q());
            C0958Hi c0958Hi = this.A03;
            if (A0E[0].charAt(8) != 'R') {
                throw new RuntimeException();
            }
            A0E[0] = "77qnFvJsRWmRKk6JBgJBKEGWiyh1GlxA";
            if (C2203mv.A1R(c0958Hi)) {
                setViewAsCTA(c07066yA0J);
            }
            return c07066yA0J;
        }
        C2252ni c2252niA0H = this.A01.A0H();
        if (c2252niA0H == null) {
            return null;
        }
        final C0958Hi c0958Hi2 = this.A03;
        final C2232nO c2232nO = this.A05;
        final LA la2 = this.A02;
        AnonymousClass71 anonymousClass71A0J = new AbstractC0902Fd(c0958Hi2, viewOnClickListenerC2478rS, c2232nO, la2) { // from class: com.facebook.ads.redexgen.X.71
            public static String[] A01 = {"zn2Jj3FLXRTbJtfw8Afxej", "dtmtrgWIKVcWUlm8dEr0sz0z9tf2J", "65otsIevi2", "WIcVvvEwkashef3N2EiIBveLumlZYLnq", "znrVNV6qMGpKzfn7IZK4DoefRCFoha0z", "F9i1YLvz3R", "dnWzAs8QX1u", "24chPJcrZ9gPM5HVBrP4Hx0vuAfDCuLF"};
            public final C2614te A00;

            {
                super(c0958Hi2, viewOnClickListenerC2478rS, c2232nO, la2);
                this.A00 = new C2614te(c0958Hi2);
                addView(this.A00, new RelativeLayout.LayoutParams(-1, -1));
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
            public final void A0F() {
                super.A0F();
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
            public final void A0G() {
                super.A0G();
                if (this.A04 != null) {
                    AbstractC2426qc.A0K(this.A04);
                    C2552se c2552se = this.A04;
                    if (A01[1].length() == 32) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A01;
                    strArr[3] = "LQJH1HzQRbzmZJzAQOnyFR28ulfrgLB8";
                    strArr[7] = "K31P2xmHlOzC52emjhwrGa1Mutq82lvW";
                    c2552se.setLayoutParams(AbstractC0902Fd.A0B(null));
                    addView(this.A04);
                }
            }

            public final AnonymousClass71 A0J(String str) {
                new AsyncTaskC0892Et(this.A00, this.A08).A05(this.A00.getHeight(), this.A00.getWidth()).A06(new C0903Fe(this)).A07(str);
                A0G();
                return this;
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC0902Fd
            public int getMediaViewId() {
                return this.A00.getId();
            }
        }.A0J(c2252niA0H.getUrl());
        if (C2203mv.A1P(this.A03)) {
            setViewAsCTA(anonymousClass71A0J);
        }
        return anonymousClass71A0J;
    }

    private C0899Fa A06() {
        return new C0899Fa(this);
    }

    private C1539c2 A07(int i5, int i11, int i12, int i13) {
        C1539c2 c1539c2 = new C1539c2(this, i5, i11, true, new WeakReference(this.A09), this.A03);
        c1539c2.A0W(i12);
        c1539c2.A0X(i13);
        return c1539c2;
    }

    private void A0C() throws SecurityException {
        String strA0M = this.A01.A0M();
        if (!TextUtils.isEmpty(strA0M)) {
            C2347pK c2347pK = new C2347pK();
            C0958Hi c0958Hi = this.A03;
            Uri uriA00 = AbstractC2351pP.A00(strA0M);
            String adChoicesLinkUrl = this.A01.A7z();
            C2347pK.A0P(c2347pK, c0958Hi, uriA00, adChoicesLinkUrl);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0D() throws SecurityException {
        this.A05.A04(EnumC2231nN.A0A, null);
        if (!AbstractC1820gb.A00(this.A03.A02()).A0O(this.A03, false)) {
            A0C();
            return;
        }
        AbstractC2524sC abstractC2524sCA01 = AbstractC2525sD.A01(this.A03, this.A04, this.A01.A7z(), this);
        if (abstractC2524sCA01 == null) {
            A0C();
            return;
        }
        AbstractC2426qc.A0X(this);
        addView(abstractC2524sCA01, new FrameLayout.LayoutParams(-1, -1));
        abstractC2524sCA01.A0N();
    }

    private void A0E() {
        if (getVisibility() == 0 && this.A00 && hasWindowFocus()) {
            this.A0A.A0U();
            return;
        }
        C1539c2 c1539c2 = this.A0A;
        String[] strArr = A0E;
        if (strArr[2].charAt(4) != strArr[3].charAt(4)) {
            throw new RuntimeException();
        }
        A0E[5] = "SgvS5kp7YWZNPSZIgTDwR2Me85gfZWHQ";
        c1539c2.A0V();
    }

    public static boolean A0H(C2086kz c2086kz, LK lk2) {
        String strA0e = lk2.A0e();
        if (TextUtils.isEmpty(strA0e)) {
            return false;
        }
        String strA0T = c2086kz.A0T(strA0e);
        String videoUrl = A0E[6];
        if (videoUrl.length() == 10) {
            throw new RuntimeException();
        }
        A0E[6] = "4EiEXi";
        return !TextUtils.isEmpty(strA0T);
    }

    public final void A0I() {
        if (this.A08 != null) {
            this.A08.A0E();
        }
        if (this.A0A != null) {
            this.A0A.A0V();
        }
        AbstractC2426qc.A0K(this);
    }

    public final void A0J() {
        if (this.A08 != null) {
            this.A08.A0F();
        }
    }

    private int getOrientation() {
        Activity activity = this.A03.A0E();
        if (activity != null) {
            return activity.getResources().getConfiguration().orientation;
        }
        return 1;
    }

    public C1539c2 getViewabilityChecker() {
        return this.A0A;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.A00 = true;
        A0E();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.A00 = false;
        A0E();
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        this.A06.A06(this.A03, motionEvent, this, this);
        return super.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.view.View
    public final void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        A0E();
    }

    @Override // android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        A0E();
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
        if (i5 == 0) {
            InterfaceC1640df interfaceC1640dfA0F = this.A03.A0F();
            if (AbstractC2503rr.A01(interfaceC1640dfA0F.getId())) {
                interfaceC1640dfA0F.A5E(EnumC2299oW.A04.name());
            }
        }
    }

    private void setViewAsCTA(View view) {
        view.setOnClickListener(new ViewOnClickListenerC2479rT(this));
    }
}
