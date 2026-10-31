package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.text.NumberFormat;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.6f, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06876f extends AbstractC0878Ef {
    public static byte[] A0M;
    public static String[] A0N = {"QUFYIN7o4MSHfMbcaqgxGqdg8oING", "Qixa92rp7KQSHPhBId3L5m9SXc6gxNRP", "TUKhftCqFUFv9xNbjbPA3CLhBIkdW", "aNiMBj1VMT3xct4Co4hWzqTsg", "QYSCqyZ4CS", "VjIbmM2G6pRRrYhuKIf6SOzC6eQUF7eo", "KFJXOgKoK7JNlCBWMf", "dachHr6cLZKwbIDqTeRsc0FgbmZCJ"};
    public static final int A0O;
    public static final int A0P;
    public static final int A0Q;
    public static final int A0R;
    public static final int A0S;
    public static final int A0T;
    public static final int A0U;
    public static final int A0V;
    public static final int A0W;
    public static final int A0X;
    public static final int A0Y;
    public static final int A0Z;
    public static final int A0a;
    public View A00;
    public View A01;
    public ImageView A02;
    public C0958Hi A03;
    public C2370pi A04;
    public AbstractC2452r2 A05;
    public C2673ub A06;
    public AbstractC2685un A07;
    public C2701v3 A08;
    public C2728vU A09;
    public C1870hR A0A;
    public C1861hI A0B;
    public C0774Af A0C;
    public boolean A0D;
    public boolean A0E;
    public final Handler A0F;
    public final InterfaceC2459r9 A0G;
    public final InterfaceC2658uM A0H;
    public final C2659uN A0I;
    public final C2689ur A0J;
    public final C0799Be A0K;
    public final C0781Am A0L;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0M, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 13);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0D() {
        A0M = new byte[]{-85, -86, -68, -75, -54, -71, -45, -57, -56, -75, -58, -56, -67, -62, -69, -45, -75, -62, -67, -63, -75, -56, -67, -61, -62, -57, -45, -60, -64, -75, -51, -71, -72, -109, -106, -102, -116, -90, -103, -116, -98, -120, -103, -117, -90, -102, -118, -103, -116, -116, -107, -90, -102, -113, -106, -98, -107, -127, 107, 125, -119, 111, 120, 110, -119, 109, 107, 124, 110, -119, 125, 114, 121, -127, 120, -55, -57, -71, -58, -73, -64, -67, -73, -65};
    }

    static {
        A0D();
        A0R = AbstractC2383pv.A0e;
        A0Z = AbstractC2383pv.A0c;
        A0O = (int) (AbstractC2385px.A02 * 8.0f);
        A0P = (int) (AbstractC2385px.A02 * 10.0f);
        A0U = (int) (AbstractC2385px.A02 * 20.0f);
        A0V = (int) (AbstractC2385px.A02 * 13.0f);
        A0S = (int) (AbstractC2385px.A02 * 48.0f);
        A0Y = (int) (AbstractC2385px.A02 * 14.0f);
        A0W = (int) (AbstractC2385px.A02 * 12.0f);
        A0Q = AbstractC2383pv.A0y;
        A0X = AbstractC1841gx.A02(-1, 77);
        A0T = (int) (AbstractC2385px.A02 * 16.0f);
        A0a = (int) (AbstractC2385px.A02 * 12.0f);
    }

    public C06876f(C2689ur c2689ur) {
        super(c2689ur, false);
        this.A0F = new Handler(Looper.getMainLooper());
        this.A0E = false;
        this.A0D = false;
        this.A03 = c2689ur.A06();
        this.A05 = c2689ur.A0B();
        this.A0J = c2689ur;
        this.A01 = new View(this.A03);
        AbstractC2426qc.A0L(this.A01);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(0, 0);
        layoutParams.addRule(13);
        addView(this.A01, layoutParams);
        A0A();
        this.A0G = c2689ur.A0C();
        AbstractC2668uW.A00(c2689ur.A06(), this, getAdInfo().A0I().A08());
        this.A0K = A02(c2689ur);
        AbstractC2426qc.A0L(this.A0K);
        getAdDetailsView().bringToFront();
        if (!A05()) {
            this.A0L = A03(c2689ur);
        } else {
            this.A0L = null;
        }
        if (getAdDataBundle().A2m()) {
            if (this.A0L != null) {
                this.A0L.setVisibility(8);
            }
            getAdDetailsView().setVisibility(8);
            A09();
        }
        A1l();
        this.A0A = new C1870hR(this.A03, c2689ur.A07(), getAdDataBundle());
        this.A0H = new C0875Ec(this);
        this.A0I = A01(c2689ur);
        C2379pr c2379prA02 = ((AbstractC0878Ef) this).A08.A02(getAdDataBundle());
        this.A03.A0H().A00(c2379prA02.A01);
        if (c2379prA02.A00) {
            this.A0K.getVideoImplView().setOnClickListener(new ViewOnClickListenerC2692uu(this));
        } else if (C2203mv.A1L(getAdContextWrapper())) {
            AbstractC2621tl.A00(this.A0K.getVideoImplView(), C2203mv.A1M(getAdContextWrapper()), new ViewOnClickListenerC2693uv(this));
        }
        if (c2689ur.A05().A2a()) {
            if (this.A0J.A05().A2d()) {
                this.A07 = new ER(c2689ur);
            } else {
                this.A07 = new ES(c2689ur);
            }
            View view = this.A07;
            ViewGroup.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
            addView(view, layoutParams2);
            getAdDetailsView().setVisibility(8);
        }
    }

    private C2659uN A01(C2689ur c2689ur) {
        if (this.A0L != null) {
            return new C2659uN(c2689ur, getAdDataBundle(), this.A0K, this.A0L, getAdDetailsView(), this.A0G, this.A0H);
        }
        return new C2659uN(c2689ur, getAdDataBundle(), this.A0K, this.A0G, this.A0H, getAdDetailsView());
    }

    private C0799Be A02(C2689ur c2689ur) {
        RelativeLayout.LayoutParams layoutParams;
        C0799Be c0799Be = (C0799Be) c2689ur.A02();
        if (c0799Be == null) {
            c0799Be = new C0799Be(this.A03);
        }
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
        if (getAdDataBundle().A2m()) {
            c0799Be.getVideoView().setPadding(c0799Be.getVideoView().getPaddingLeft(), c0799Be.getVideoView().getPaddingTop(), c0799Be.getVideoView().getPaddingRight(), c0799Be.getVideoView().getPaddingBottom() + A0a);
        }
        layoutParams2.addRule(13);
        addView(c0799Be, layoutParams2);
        int iA1j = A1j(c2689ur.A0B());
        this.A02 = (ImageView) c2689ur.A03();
        if (this.A02 != null) {
            if (!A05()) {
                ImageView imageView = this.A02;
                int i5 = AbstractC0878Ef.A0K;
                int toolbarHeight = AbstractC0878Ef.A0K;
                imageView.setPadding(i5, toolbarHeight, AbstractC0878Ef.A0K, AbstractC0878Ef.A0K);
                layoutParams = new RelativeLayout.LayoutParams(AbstractC0878Ef.A0L, AbstractC0878Ef.A0L);
                layoutParams.setMargins(0, iA1j, AbstractC0878Ef.A0J, 0);
                layoutParams.addRule(11);
            } else {
                layoutParams = new RelativeLayout.LayoutParams(AbstractC2685un.A0B, AbstractC2685un.A0B);
                int i11 = AbstractC2383pv.A0e;
                int toolbarHeight2 = AbstractC2383pv.A0u;
                layoutParams.setMargins(i11, toolbarHeight2, AbstractC2383pv.A0e, AbstractC2383pv.A0c);
                layoutParams.addRule(9);
            }
            layoutParams.addRule(10);
            ImageView imageView2 = this.A02;
            String[] strArr = A0N;
            if (strArr[7].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            A0N[3] = "RUV05LvgTVtcmprhEttuSCpIx";
            c0799Be.addView(imageView2, layoutParams);
        }
        return c0799Be;
    }

    private C0781Am A03(C2689ur c2689ur) {
        C0781Am c0781AmA0E = c2689ur.A0E();
        if (c0781AmA0E == null) {
            return null;
        }
        c0781AmA0E.A0A(-1, AbstractC0878Ef.A0D, false);
        c0781AmA0E.setPadding(AbstractC0878Ef.A0O, AbstractC0878Ef.A0O, AbstractC0878Ef.A0O, AbstractC0878Ef.A0O);
        RelativeLayout.LayoutParams progressBarLayoutParams = new RelativeLayout.LayoutParams(-1, AbstractC0878Ef.A0N);
        progressBarLayoutParams.addRule(12);
        addView(c0781AmA0E, progressBarLayoutParams);
        return c0781AmA0E;
    }

    private void A05() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        if (this.A0B != null) {
            addView(this.A0B.A0W(), layoutParams);
        }
    }

    private void A06() {
        this.A08 = new C2701v3(this.A0J.A06(), getAdDataBundle(), this.A0J.A08(), this.A0F, this.A0J.A0C());
        addView(this.A08.A0E(getCtaButton()));
    }

    private void A07() {
        AbstractC2426qc.A0e(this.A02, getCtaButton(), getAdDetailsView(), this.A01, this.A0I, this.A0J.A0B());
        for (InterfaceC1663e3 interfaceC1663e3 : this.A0K.getPlugins()) {
            if (interfaceC1663e3 instanceof AnonymousClass51) {
                this.A0K.A0h(interfaceC1663e3);
                return;
            }
        }
    }

    private void A08() {
        if (getAnimationPlugin() != null) {
            getAnimationPlugin().A0H();
            this.A0K.A0h(getAnimationPlugin());
        }
    }

    private void A09() {
        RelativeLayout.LayoutParams layoutParams;
        RelativeLayout relativeLayout = new RelativeLayout(getContext());
        A0E(relativeLayout);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.setMargins(0, 0, A0R, 0);
        RelativeLayout relativeLayout2 = new RelativeLayout(getContext());
        RelativeLayout.LayoutParams appMetadataLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
        appMetadataLayoutParams.setMargins(A0R, A0Z, A0R, A0Z);
        appMetadataLayoutParams.addRule(12);
        relativeLayout2.addView(relativeLayout, layoutParams2);
        ViewOnClickListenerC0884El ctaButton = getCtaButton();
        ctaButton.setTextSize(14.0f);
        ctaButton.setIncludeFontPadding(false);
        ctaButton.setTextColor(-1);
        layoutParams2.addRule(0, ctaButton.getId());
        if (!getAdDataBundle().A2e()) {
            ctaButton.setPadding(A0P, A0P, A0P, A0P);
            layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(6, relativeLayout.getId());
            layoutParams.addRule(8, relativeLayout.getId());
            ctaButton.setBackgroundColor(-12549889);
        } else {
            layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            AbstractC2426qc.A0W(ctaButton, AbstractC2426qc.A06(-16738826, A0O));
            ctaButton.setPadding(A0U, A0V, A0U, A0V);
            ctaButton.setStateListAnimator(null);
            AbstractC2426qc.A0a(ctaButton);
        }
        layoutParams.addRule(11);
        if (ctaButton.getParent() != null) {
            AbstractC2426qc.A0e(ctaButton);
        }
        relativeLayout2.addView(ctaButton, layoutParams);
        addView(relativeLayout2, appMetadataLayoutParams);
        relativeLayout2.bringToFront();
    }

    private void A0A() {
        if (this.A05 == null) {
            return;
        }
        LA adDataBundle = getAdDataBundle();
        if (A0N[6].length() != 18) {
            throw new RuntimeException();
        }
        String[] strArr = A0N;
        strArr[2] = "8PENcoURn8tYxYDZWdxrE0xj5q4aF";
        strArr[0] = "NpgYsaWM2tMmK1ULlf2RY7UcVYKwt";
        if (!adDataBundle.A2D()) {
            this.A0C = new C0774Af(this.A05, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, -this.A05.getToolbarHeight(), 0);
        }
    }

    private void A0B() {
        new C2232nO(getAdDataBundle().A37(), getAdEventManager()).A04(EnumC2231nN.A1D, null);
        if (!getAdInfo().A0W()) {
            return;
        }
        super.A09.set(true);
        AbstractC2426qc.A0X(this);
        AbstractC2426qc.A0e(this.A0L, this.A0I, this.A00);
        AbstractC2426qc.A0M(this.A05);
        Pair<EnumC1871hS, View> pairA03 = this.A0A.A03(getCtaButton());
        View view = (View) pairA03.second;
        String[] strArr = A0N;
        if (strArr[2].length() != strArr[0].length()) {
            throw new RuntimeException();
        }
        A0N[3] = "FxfG3zWETYKhpCEsP1aqGpvXk";
        this.A00 = view;
        A0F((EnumC1871hS) pairA03.first);
        if (getAdInfo().A0L().A00() >= 0) {
            this.A0D = true;
            if (this.A05 != null) {
                this.A05.setToolbarActionMode(getAdDataBundle().A3N() ? 8 : 2);
                this.A05.setProgressImmediate(0.0f);
            }
            this.A04 = new C2370pi((int) getAdInfo().A0L().A00(), 20.0f, 20L, new Handler(Looper.getMainLooper()), new C0874Eb(this));
            this.A04.A07();
        }
    }

    private void A0C() {
        if (this.A0C != null) {
            this.A0C.A4b(true, false);
        }
        if (!A05() && !getAdDataBundle().A2m() && getAdDetailsAnimation() != null) {
            getAdDetailsAnimation().A4b(true, false);
        }
    }

    private void A0E(RelativeLayout relativeLayout) {
        int i5;
        String formattingRatingCount;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A0S, A0S);
        layoutParams.addRule(15);
        layoutParams.addRule(9);
        C2661uP c2661uP = new C2661uP(this.A03);
        AbstractC2426qc.A0O(c2661uP, 0);
        AbstractC2426qc.A0L(c2661uP);
        new AsyncTaskC0892Et(c2661uP, this.A03).A05(A0S, A0S).A07(getAdDataBundle().A35().A01());
        TextView textView = new TextView(this.A03);
        AbstractC2426qc.A0L(textView);
        textView.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        textView.setTextColor(getAdDataBundle().A31().A01().A07(true));
        textView.setText(getAdDataBundle().A32().A0J().A0H());
        textView.setTextSize(!getAdDataBundle().A2e() ? 16.0f : 17.0f);
        textView.setMaxLines(1);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        C0958Hi c0958Hi = this.A03;
        if (!getAdDataBundle().A2e()) {
            i5 = A0Y;
        } else {
            i5 = A0W;
            String[] strArr = A0N;
            if (strArr[2].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            A0N[5] = "zMOp0v68HU8LM6AfFyrfYJAIOfQzbFgD";
        }
        C2663uR c2663uR = new C2663uR(c0958Hi, i5, 5, A0X, -1);
        c2663uR.setGravity(16);
        LinearLayout.LayoutParams ratingCountParams = new LinearLayout.LayoutParams(-2, -1);
        TextView textView2 = new TextView(this.A03);
        textView2.setTextColor(getAdDataBundle().A31().A01().A07(true));
        textView2.setGravity(16);
        textView2.setIncludeFontPadding(false);
        if (!getAdDataBundle().A2e()) {
            textView2.setTextSize(13.0f);
        }
        LinearLayout.LayoutParams starRatingContainerParams = new LinearLayout.LayoutParams(-2, -1);
        starRatingContainerParams.leftMargin = A0Q;
        LinearLayout linearLayout = new LinearLayout(this.A03);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, A0T);
        layoutParams2.topMargin = A0Q / 2;
        layoutParams2.addRule(3, textView.getId());
        linearLayout.addView(c2663uR, ratingCountParams);
        linearLayout.addView(textView2, starRatingContainerParams);
        RelativeLayout.LayoutParams containerParams = new RelativeLayout.LayoutParams(-2, -2);
        containerParams.leftMargin = A0Q;
        containerParams.addRule(1, c2661uP.getId());
        containerParams.addRule(15);
        RelativeLayout relativeLayout2 = new RelativeLayout(getContext());
        relativeLayout2.addView(linearLayout, layoutParams2);
        relativeLayout2.addView(textView);
        relativeLayout.addView(relativeLayout2, containerParams);
        relativeLayout.addView(c2661uP, layoutParams);
        if (TextUtils.isEmpty(getAdDataBundle().A32().A0J().A0D())) {
            linearLayout.setVisibility(8);
            return;
        }
        linearLayout.setVisibility(0);
        c2663uR.setRating(Float.parseFloat(getAdDataBundle().A32().A0J().A0D()));
        if (getAdDataBundle().A32().A0J().A0A() == null) {
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(A04(0, 1, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
        if (!getAdDataBundle().A2e()) {
            formattingRatingCount = NumberFormat.getNumberInstance().format(Integer.parseInt(getAdDataBundle().A32().A0J().A0A()));
        } else {
            formattingRatingCount = AbstractC2395q7.A01(Integer.parseInt(getAdDataBundle().A32().A0J().A0A()));
        }
        sb2.append(formattingRatingCount);
        String formattingRatingCount2 = A04(1, 1, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
        sb2.append(formattingRatingCount2);
        String formattingRatingCount3 = sb2.toString();
        textView2.setText(formattingRatingCount3);
    }

    private void A0F(EnumC1871hS enumC1871hS) {
        EnumC2275o7 enumC2275o7A00 = EnumC2275o7.A00(getAdDataBundle().A1a());
        if (enumC2275o7A00 == EnumC2275o7.A08) {
            if (this.A09 != null) {
                return;
            }
            AbstractC2426qc.A0e(this.A02, getCtaButton(), getAdDetailsView(), this.A01, this.A0I);
            this.A09 = new C2728vU(this.A03, getAdDataBundle(), this.A0J.A08(), this.A0F, this.A0J.A0C(), this.A05);
            addView(this.A09.A0K(getCtaButton()), new RelativeLayout.LayoutParams(-1, -1));
            return;
        }
        if (enumC2275o7A00 == EnumC2275o7.A05) {
            if (this.A06 != null) {
                return;
            }
            AbstractC2426qc.A0e(this.A02, getCtaButton(), getAdDetailsView(), this.A01, this.A0I);
            this.A06 = new C2673ub(this.A03, getAdDataBundle(), this.A0J.A08(), this.A0F, this.A0J.A0C());
            addView(this.A06.A0D(getCtaButton()), new RelativeLayout.LayoutParams(-1, -1));
            return;
        }
        if (!getAdDataBundle().A32().A0L().A03().isEmpty()) {
            if (getAdDataBundle().A32().A0L().A04()) {
                this.A0B = new C1861hI(this.A03, getAdDataBundle(), this.A0G, getCtaButton(), this.A0F, this.A0J.A08());
                AbstractC2426qc.A0e(this.A05, getAdDetailsView(), this.A02);
                A05();
                return;
            }
        } else if (getAdDataBundle().A32().A0L().A04() || getAdDataBundle().A32().A0L().A05()) {
            A07();
            A06();
            return;
        }
        A0G(enumC1871hS);
        String[] strArr = A0N;
        if (strArr[2].length() != strArr[0].length()) {
            throw new RuntimeException();
        }
        A0N[5] = "XwWMDLrqRvQWrOlwGXJRzy5eNtvO8QzI";
    }

    private void A0G(EnumC1871hS enumC1871hS) {
        if (this.A00 == null) {
        }
        this.A0K.A0i(false);
        this.A0K.setVisibility(8);
        switch (C2694uw.A00[enumC1871hS.ordinal()]) {
            case 1:
                getAdDetailsView().setVisibility(0);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
                layoutParams.setMargins(0, A1j(this.A05), 0, 0);
                layoutParams.addRule(2, getAdDetailsView().getId());
                addView(this.A00, layoutParams);
                break;
            case 2:
                AbstractC2426qc.A0e(getAdDetailsView());
                RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
                layoutParams2.setMargins(AbstractC0878Ef.A0M, AbstractC0878Ef.A0M, AbstractC0878Ef.A0M, AbstractC0878Ef.A0M);
                addView(this.A00, layoutParams2);
                break;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef, com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() throws RemoteException {
        super.A1Q();
        A08();
        getAdDetailsView().A0j();
        if (this.A09 != null) {
            this.A09.A0L();
        }
        C2673ub c2673ub = this.A06;
        if (A0N[5].charAt(17) != 'k') {
            A0N[6] = "md7rIfygLfbWPIkKcE";
            if (c2673ub != null) {
                this.A06.A0E();
            }
            if (this.A0B != null) {
                this.A0B.A0Y();
            }
            if (this.A08 != null) {
                this.A08.A0H();
            }
            this.A0F.removeCallbacksAndMessages(null);
            if (A0N[3].length() == 25) {
                A0N[5] = "bB4JBA3ZSEqYzY8c8XgwhRx5D9raQ3WM";
                return;
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef, com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        super.A1X(c1735fE, str, d5, bundle);
        if (bundle == null) {
            bundle = new Bundle();
        }
        if (!bundle.getBoolean(A04(2, 31, 103), false)) {
            A0C();
        }
        if (bundle.getBoolean(A04(57, 18, 29), false)) {
            A0B();
        }
        if (bundle.getBoolean(A04(33, 24, 58), false)) {
            C2659uN c2659uN = this.A0I;
            if (A0N[1].charAt(18) != '3') {
                throw new RuntimeException();
            }
            String[] strArr = A0N;
            strArr[2] = "jjtMTZWEM7Dg1szUnnnmuTjwvMhej";
            strArr[0] = "cexdZia4vusGbXInA5fVVHDcQrSB4";
            c2659uN.A07(this);
        }
        if (A05() && (getAdDetailsView() instanceof AbstractC0891Es)) {
            AbstractC0891Es abstractC0891Es = (AbstractC0891Es) getAdDetailsView();
            String[] strArr2 = A0N;
            if (strArr2[7].length() != strArr2[4].length()) {
                String[] strArr3 = A0N;
                strArr3[2] = "Ih6EqgYtvSfaYgSNPPElGp7Lxj0t8";
                strArr3[0] = "h5CA5aG2lPOu2yMQLS9sdpZh4eIWu";
                abstractC0891Es.A0q();
                return;
            }
            String[] strArr4 = A0N;
            strArr4[7] = "00UfvTGlPPvipTISrgumxqYWr80Pn";
            strArr4[4] = "mO62e8xwcE";
            abstractC0891Es.A0q();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Y(C5Y c5y) {
        super.A1Y(c5y);
        if (A05() && !getAdDataBundle().A2D()) {
            removeView(getAdDetailsView());
        }
        A0B();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Z(BD bd2) {
        super.A1Z(bd2);
        if (this.A07 != null && this.A07.getVisibility() == 0) {
            return;
        }
        if (A05()) {
            this.A03.A0F().AM1(AbstractC2361pZ.A00((float) this.A0J.A05().A1F()), getResources().getConfiguration().orientation, true, false, AbstractC1701ef.A0E(this.A0J.A04()));
        }
        Resources resources = getResources();
        if (A0N[5].charAt(17) == 'k') {
            throw new RuntimeException();
        }
        A0N[6] = "ip031XD9FRryimrL8V";
        A1t(resources.getConfiguration().orientation);
        if (getAdDataBundle().A2O()) {
            this.A0K.setOnClickListener(getCtaButton());
        }
        if (A05()) {
            getAdDetailsView().setVisibility(0);
            if (getAdDetailsView() instanceof AbstractC0891Es) {
                ((AbstractC0891Es) getAdDetailsView()).A0u(getResources().getConfiguration().orientation);
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1a(C5V c5v, int i5) {
        super.A1a(c5v, i5);
        int videoLengthMs = c5v.A00();
        int remainingVideoTimeInMillis = this.A0K.getDuration();
        int videoLengthMs2 = remainingVideoTimeInMillis - videoLengthMs;
        if (getAnimationPlugin() != null && videoLengthMs2 < 3000 && getAnimationPlugin().A0M()) {
            getAnimationPlugin().A0I();
        }
        if ((getAdDetailsView() instanceof AbstractC0891Es) && !this.A0J.A05().A2d()) {
            int currentPosMs = c5v.A00();
            ((AbstractC0891Es) getAdDetailsView()).A0s(((remainingVideoTimeInMillis * i5) + currentPosMs) / 1000);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1b(boolean z11) {
        super.A1b(z11);
        getAdDetailsView().A0m(z11);
        if (this.A07 != null) {
            this.A07.A1b(z11);
        }
        if (this.A09 != null) {
            this.A09.A0N(z11);
        }
        C2673ub c2673ub = this.A06;
        String[] strArr = A0N;
        if (strArr[7].length() == strArr[4].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0N;
        strArr2[7] = "iXZFA7pvq2EjOt4WoFSsptv7Y6FsA";
        strArr2[4] = "3FZLJfDRd9";
        if (c2673ub != null) {
            this.A06.A0G(z11);
        }
        if (this.A0B != null) {
            this.A0B.A0e(z11);
        }
        if (this.A08 != null) {
            this.A08.A0J(z11);
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

    /* JADX WARN: Removed duplicated region for block: B:14:0x004a  */
    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A1i(boolean z11) {
        if (!z11 || this.A0E) {
            boolean zA0W = getAdInfo().A0W();
            if (A0N[5].charAt(17) != 'k') {
                A0N[1] = "YRUjLZqfjvY5EOxU383ujQcW8j7gUgor";
                if (zA0W && !super.A09.get()) {
                    this.A0K.A0e(EnumC1718ex.A09);
                    return true;
                }
                return false;
            }
        } else {
            boolean z12 = super.A09.get();
            String[] strArr = A0N;
            if (strArr[7].length() != strArr[4].length()) {
                String[] strArr2 = A0N;
                strArr2[2] = "IfEmWBIDBUNw5tL7YhS4lNzldGhzw";
                strArr2[0] = "8CoNQoXVMdzgwU1krh95bRLsSKKH4";
                if (!z12) {
                    this.A0I.A07(this);
                    return true;
                }
                boolean zA0W2 = getAdInfo().A0W();
                if (A0N[5].charAt(17) != 'k') {
                }
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef
    public final AbstractC2624to A1k(C2689ur c2689ur, C1735fE c1735fE, String str) {
        double dA1F = c2689ur.A05().A1F();
        if (A05()) {
            return new C2669uX((float) dA1F, str, c2689ur.A06(), getColors(), c2689ur.A05(), c2689ur.A0C(), getCtaButton(), AbstractC0878Ef.A0H, false, c2689ur.A07(), c2689ur.A0F(), c2689ur.A0A(), c2689ur.A0E(), c2689ur.A08(), false).A03();
        }
        return new C0880Eh(c2689ur.A06(), getCtaButton(), AbstractC0878Ef.A0I, c1735fE.A0J().A00() == EnumC1740fJ.A05, getColors(), c1735fE.A0K().A07(), str, c2689ur.A07(), c2689ur.A0C(), c2689ur.A0F(), c2689ur.A0A(), c2689ur.A05());
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef
    public final void A1l() {
        super.A1l();
        if (getAnimationPlugin() != null) {
            getAnimationPlugin().ABd(this.A0K);
        }
    }

    public final void A1q() {
        getCtaButton().A0E(A04(75, 9, 71));
    }

    public final void A1r() {
        if (getAdDetailsView() instanceof AbstractC0891Es) {
            ((AbstractC0891Es) getAdDetailsView()).setPlaceHolderTextForRewardsConversion(getAdDataBundle().A1o());
        }
    }

    public final void A1s() {
        new C2232nO(this.A0J.A05().A37(), getAdEventManager()).A04(EnumC2231nN.A0v, null);
        if (this.A0J.A0B() != null) {
            this.A0J.A0B().setVisibility(8);
            String[] strArr = A0N;
            if (strArr[2].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            A0N[6] = "yAwhrDcExjWPfFDTEi";
            removeView(this.A0J.A0B());
        }
        removeView(this.A07);
        removeView(this.A0K);
        A08();
        removeView(getAdDetailsView());
        removeView(this.A0L);
        removeView(this.A00);
        if (this.A0B != null) {
            removeView(this.A0B.A0X());
        }
        if (this.A0J.A05().A2d()) {
            A1n();
        } else {
            A1m();
        }
    }

    public final void A1t(int i5) {
        if (!A05()) {
            return;
        }
        this.A03.A0F().AM3(i5);
        this.A0K.A0a(i5);
        A1o(i5, this.A0K, (RelativeLayout) this.A0K.getVideoView());
    }

    public final void A1u(C5Z c5z) {
        if (this.A07 != null) {
            boolean z11 = this.A07 instanceof ER;
            if (A0N[3].length() != 25) {
                throw new RuntimeException();
            }
            A0N[5] = "FAigyzJhEFxQxsaDiDi5NbLqtOf6Lp3I";
            if (z11) {
                ((ER) this.A07).A1j(c5z);
            }
            if (this.A07 instanceof ES) {
                ((ES) this.A07).A1j(c5z);
            }
            this.A07.A1Q();
            removeView(this.A07);
            if (A0N[6].length() != 18) {
                String[] strArr = A0N;
                strArr[7] = "VyeDXSZFGYmD1QmQMyFsICGfXcawo";
                strArr[4] = "LIOwJh30UZ";
                this.A07 = null;
            } else {
                String[] strArr2 = A0N;
                strArr2[7] = "wN3IsD8puMayp9KO28b4vVZi0fOl6";
                strArr2[4] = "vypOhhEh5B";
                this.A07 = null;
            }
        }
        getAdDetailsView().setVisibility(0);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public int getCloseButtonStyle() {
        if (getAdDataBundle().A2n() && this.A05 != null) {
            return this.A05.getToolbarActionMode();
        }
        if (this.A0D) {
            if (getAdDataBundle().A3N()) {
                return 8;
            }
            return 2;
        }
        if (A1d() && !super.A09.get()) {
            return 1;
        }
        return super.getCloseButtonStyle();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0878Ef, com.facebook.ads.redexgen.X.AbstractC2685un, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.A07 != null && this.A07.getVisibility() == 0) {
            getAdDetailsView().setVisibility(8);
            return;
        }
        if (this.A09 != null && super.A09.get()) {
            this.A09.A0M(configuration.orientation);
            String[] strArr = A0N;
            if (strArr[7].length() != strArr[4].length()) {
                A0N[1] = "DO7In235juv9PXUKV934zSaX5akZYCRG";
                return;
            }
        } else {
            C2673ub c2673ub = this.A06;
            String[] strArr2 = A0N;
            if (strArr2[2].length() == strArr2[0].length()) {
                A0N[3] = "fUeg7uXpIwsYCOJvIzf4Pz9qp";
                if (c2673ub != null && super.A09.get()) {
                    this.A06.A0F(configuration.orientation);
                    return;
                }
                if (getAdDataBundle().A32().A0L().A04() && this.A0B != null && super.A09.get()) {
                    this.A0B.A0a(configuration.orientation);
                    if (A0N[3].length() != 25) {
                        throw new RuntimeException();
                    }
                    A0N[5] = "kZmqBw7HqjefhdtwCyHYueahbgSJOGXS";
                    return;
                }
                A1t(configuration.orientation);
                return;
            }
        }
        throw new RuntimeException();
    }

    public void setVideoAdViewListener(InterfaceC2409qL interfaceC2409qL) {
        if (this.A07 instanceof ER) {
            ((ER) this.A07).setVideoAdViewListener(interfaceC2409qL);
        }
        if (this.A07 instanceof ES) {
            ((ES) this.A07).setVideoAdViewListener(interfaceC2409qL);
        }
    }
}
