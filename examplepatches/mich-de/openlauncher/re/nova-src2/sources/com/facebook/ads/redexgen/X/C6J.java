package com.facebook.ads.redexgen.X;

import android.animation.ObjectAnimator;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.6J, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C6J extends AbstractC0861Do {
    public static byte[] A0G;
    public static String[] A0H = {"zmfuAAdsWF5bboPH5APszGSkwrNjJok6", "XWbaPXrYLQznu0OckW2LOvbDL", "QXci", "aOHe6V6F8txhFIQidr0w8G1x6Nk4S", "ILYwhJqVaKxFQVioYmyMVPi8Rkm1lJYl", "6wfNJcRbuFCQ3RCTyiXr4ELUGWK4PzYN", "e4OfDXnyY91mKzJJOGUPBsuKAufhMlyE", "zoXpKsaIUnAnpB2FhTxs94rKkMLjx"};
    public static final C1E A0I;
    public static final int A0J;
    public static final int A0K;
    public static final int A0L;
    public static final int A0M;
    public static final int A0N;
    public static final int A0O;
    public static final RelativeLayout.LayoutParams A0P;
    public ObjectAnimator A00;
    public LinearLayout A01;
    public TextView A02;
    public C2370pi A03;
    public C06243u A04;
    public C2566ss A05;
    public C2570sw A06;
    public C2660uO A07;
    public C0823Cc A08;
    public C0781Am A09;
    public List<? extends C2314ol> A0A;
    public final int A0B;
    public final C2086kz A0C;
    public final C2232nO A0D;
    public final AbstractC2452r2 A0E;
    public final InterfaceC2511rz A0F;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 127);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A0G = new byte[]{-4, -1, -35, 0, 3, -4, 17, 4, 10, 13, 76, 79, 46, 76, 78, 83, 80, 56, 76, 89, 76, 82, 80, 93, -29, -26, -59, -15, -16, -10, -25, -6, -10, -39, -12, -29, -14, -14, -25, -12, 16, 19, -13, 16, 35, 16, -15, 36, 29, 19, 27, 20, 75, 78, 47, 96, 79, 88, 94, 55, 75, 88, 75, 81, 79, 92, 88, 93, 86, 94, 99, 90, 89, 56, 93, 94, 97, 89, 54, 89, 65, 94, 104, 105, 90, 99, 90, 103, 25, 37, 36, 28, 31, 29, -30, -15, -28, -32, -13, -28, -59, -12, -21, -21, -46, -30, -15, -28, -28, -19, -64, -29, -62, -15, -28, -29, -24, -13, -53, -24, -19, -28, -46, -13, -32, -13, -24, -30, -43, -24, -28, -10, -89, -83, -83, -83, -88, -1, 14, 1, -3, 16, 1, -30, 17, 8, 8, -17, -1, 14, 1, 1, 10, -35, 0, -33, 14, 1, 0, 5, 16, -24, 5, 10, 1, -14, 5, 1, 19, -60, -54, -54, -54, -59, -10, 5, -2, -2, -11, -4, -36, -1, -9, -9, -7, -2, -9, -40, -15, -2, -12, -4, -11, 2, -19, -21, -6, -57, -22, -49, -12, -20, -11, -46, -17, -7, -6, -82, -76, -76, -76, -81, 26, 24, 39, 3, 34, 37, 39, 37, 20, 28, 39, -10, 34, 31, 34, 37, -4, 33, 25, 34, -37, -31, -31, -31, -36, 86, 83, 93, 94, 79, 88, 79, 92, 60, 62, 59, 51, 62, 49, 63, 63, 109, 105, 111, 108, 93, 95, 54, 49, 49, 46, 36, 35, 52};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final void A07() {
        List<C1735fE> listA39 = super.A08.A39();
        C1h.A08(listA39, A04(194, 18, 7));
        List<C1735fE> list = listA39;
        ArrayList arrayList = new ArrayList(C0Y.A05(list, 10));
        int i5 = 0;
        for (Object obj : list) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                AbstractC05700v.A0C();
                throw null;
            }
            arrayList.add(new C2314ol(i5, listA39.size(), (C1735fE) obj));
            i5 = i11;
        }
        this.A0A = arrayList;
    }

    static {
        A05();
        A0I = new C1E(null);
        A0P = new RelativeLayout.LayoutParams(-1, -1);
        float f11 = 8;
        A0N = (int) (AbstractC2385px.A02 * f11);
        A0K = AbstractC2383pv.A0y;
        A0J = (int) (48 * AbstractC2385px.A02);
        A0L = (int) (f11 * AbstractC2385px.A02);
        A0O = (int) (56 * AbstractC2385px.A02);
        A0M = (int) (12 * AbstractC2385px.A02);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C6J(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, int i5, InterfaceC2224nG interfaceC2224nG, LA la2, InterfaceC2459r9 interfaceC2459r9, AbstractC2452r2 abstractC2452r2, C2232nO c2232nO, C2086kz c2086kz, boolean z11, boolean z12, InterfaceC2511rz interfaceC2511rz, int i11, int i12) throws IllegalStateException {
        super(c0958Hi, interfaceC2515s3, interfaceC2224nG, la2, i5, z11, z12, interfaceC2459r9, i12);
        C1h.A09(c0958Hi, A04(24, 16, 3));
        C1h.A09(interfaceC2515s3, A04(0, 10, 28));
        C1h.A09(interfaceC2224nG, A04(52, 14, 107));
        C1h.A09(la2, A04(40, 12, 48));
        C1h.A09(interfaceC2459r9, A04(237, 8, 107));
        C1h.A09(abstractC2452r2, A04(259, 7, 67));
        C1h.A09(c2232nO, A04(174, 20, 17));
        C1h.A09(c2086kz, A04(10, 14, 108));
        C1h.A09(interfaceC2511rz, A04(66, 22, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
        this.A0E = abstractC2452r2;
        this.A0D = c2232nO;
        this.A0C = c2086kz;
        this.A0F = interfaceC2511rz;
        this.A0B = i11;
        super.A01 = true;
        A07();
        setUpLayout(getResources().getConfiguration().orientation);
    }

    private final void A06() {
        TextView it = this.A02;
        if (it != null) {
            AbstractC2426qc.A0K(it);
        }
        this.A02 = null;
        String strA1V = AbstractC0861Do.A1V(super.A07, super.A06);
        TextView textView = new TextView(getContext());
        textView.setText(strA1V);
        textView.setTextColor(-872415232);
        textView.setMaxLines(1);
        textView.setTypeface(Typeface.DEFAULT);
        textView.setTextSize(14.0f);
        AbstractC2426qc.A0L(textView);
        this.A02 = textView;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        if (this.A05 != null) {
            C2566ss c2566ss = this.A05;
            C1h.A06(c2566ss);
            layoutParams.addRule(2, c2566ss.getId());
        } else {
            layoutParams.addRule(12);
        }
        layoutParams.setMargins(AbstractC2383pv.A0H, 0, 0, AbstractC2383pv.A0y);
        textView.setLayoutParams(layoutParams);
        addView(textView);
    }

    private final void A08() {
        C0781Am c0781Am = this.A09;
        if (c0781Am == null) {
            return;
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, A0N);
        if (this.A02 != null) {
            TextView textView = this.A02;
            C1h.A06(textView);
            layoutParams.addRule(2, textView.getId());
        } else if (this.A05 != null) {
            C2566ss c2566ss = this.A05;
            C1h.A06(c2566ss);
            layoutParams.addRule(2, c2566ss.getId());
        } else {
            layoutParams.addRule(12);
        }
        layoutParams.addRule(14);
        layoutParams.setMargins(AbstractC2383pv.A0H, AbstractC2383pv.A00, AbstractC2383pv.A0H, AbstractC2383pv.A0y);
        c0781Am.setLayoutParams(layoutParams);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0084  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A09() {
        ObjectAnimator objectAnimator = this.A00;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
        this.A00 = null;
        C0781Am c0781Am = this.A09;
        if (c0781Am == null) {
            int iA05 = super.A08.A31().A01().A05(false);
            C0958Hi c0958Hi = super.A09;
            int accentColor = this.A0B;
            C0781Am c0781Am2 = new C0781Am(c0958Hi, accentColor);
            c0781Am2.A0A(iA05, AbstractC1841gx.A02(iA05, 128), true);
            this.A09 = c0781Am2;
            AbstractC2426qc.A0L(c0781Am2);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, A0N);
            if (this.A02 == null) {
                TextView textView = this.A02;
                C1h.A06(textView);
                int accentColor2 = textView.getId();
                layoutParams.addRule(2, accentColor2);
            } else if (this.A05 != null) {
                C2566ss c2566ss = this.A05;
                if (A0H[1].length() != 27) {
                    A0H[2] = "8dGf";
                    C1h.A06(c2566ss);
                    int accentColor3 = c2566ss.getId();
                    layoutParams.addRule(2, accentColor3);
                }
            } else {
                layoutParams.addRule(12);
            }
            layoutParams.addRule(14);
            int i5 = AbstractC2383pv.A0H;
            int i11 = AbstractC2383pv.A00;
            int i12 = AbstractC2383pv.A0H;
            int accentColor4 = AbstractC2383pv.A0y;
            layoutParams.setMargins(i5, i11, i12, accentColor4);
            addView(c0781Am2, layoutParams);
            return;
        }
        if (A0H[5].charAt(29) != 81) {
            A0H[2] = "4QEX";
            AbstractC2426qc.A0K(c0781Am);
            int iA052 = super.A08.A31().A01().A05(false);
            C0958Hi c0958Hi2 = super.A09;
            int accentColor5 = this.A0B;
            C0781Am c0781Am22 = new C0781Am(c0958Hi2, accentColor5);
            c0781Am22.A0A(iA052, AbstractC1841gx.A02(iA052, 128), true);
            this.A09 = c0781Am22;
            AbstractC2426qc.A0L(c0781Am22);
            RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, A0N);
            if (this.A02 == null) {
            }
            layoutParams2.addRule(14);
            int i52 = AbstractC2383pv.A0H;
            int i112 = AbstractC2383pv.A00;
            int i122 = AbstractC2383pv.A0H;
            int accentColor42 = AbstractC2383pv.A0y;
            layoutParams2.setMargins(i52, i112, i122, accentColor42);
            addView(c0781Am22, layoutParams2);
            return;
        }
        throw new RuntimeException();
    }

    private final void A0A() {
        A09();
        this.A03 = new C2370pi(this.A0B, 100.0f, 100L, new Handler(Looper.getMainLooper()), new C0849Dc(this));
        C2370pi c2370pi = this.A03;
        if (c2370pi != null) {
            c2370pi.A07();
        }
        A0B();
    }

    private final void A0B() {
        C0781Am bar = this.A09;
        if (bar == null) {
            return;
        }
        View childAt = bar.getChildAt(0);
        ProgressBar progressBar = childAt instanceof ProgressBar ? (ProgressBar) childAt : null;
        if (progressBar == null) {
            return;
        }
        ObjectAnimator objectAnimatorOfInt = ObjectAnimator.ofInt(progressBar, A04(245, 8, 77), 0, 10000);
        objectAnimatorOfInt.setDuration(this.A0B);
        objectAnimatorOfInt.setInterpolator(new LinearInterpolator());
        objectAnimatorOfInt.start();
        this.A00 = objectAnimatorOfInt;
    }

    private final void A0C(List<? extends C2314ol> list) throws IllegalStateException {
        C1744fN c1744fNA01;
        new C7P().A0G(this.A04);
        C0823Cc c0823Cc = this.A08;
        if (c0823Cc != null) {
            c0823Cc.A0i(new C0851De(this));
        }
        LA la2 = super.A08;
        String[] strArr = A0H;
        if (strArr[3].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0H;
        strArr2[3] = "TqbC5b2qVKwkDoKqqzqncjqgTvQF0";
        strArr2[7] = "ufQKY2Tjn3hzKO7QKIX5GLCCT1MVk";
        C1731fA c1731fAA31 = la2.A31();
        if (c1731fAA31 == null || (c1744fNA01 = c1731fAA31.A01()) == null) {
            return;
        }
        C2660uO $this$configPortrait_u24lambda_u2410 = new C2660uO(super.A09, c1744fNA01, list.size());
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, A0L);
        layoutParams.setMargins(0, A0M, 0, 0);
        $this$configPortrait_u24lambda_u2410.setLayoutParams(layoutParams);
        this.A07 = $this$configPortrait_u24lambda_u2410;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final EnumC1698ec A1a(String str) {
        EnumC1698ec enumC1698ecA0E;
        C1h.A09(str, A04(253, 6, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        C06243u c06243u = this.A04;
        if (c06243u == null) {
            return EnumC1698ec.A08;
        }
        AbstractC1978jE abstractC1978jEA1I = c06243u.A1I(c06243u.getLayoutManager().A38());
        CQ cq2 = abstractC1978jEA1I instanceof CQ ? (CQ) abstractC1978jEA1I : null;
        if (cq2 == null) {
            return EnumC1698ec.A08;
        }
        ViewOnClickListenerC0884El viewOnClickListenerC0884ElA0w = cq2.A0w();
        return (viewOnClickListenerC0884ElA0w == null || (enumC1698ecA0E = viewOnClickListenerC0884ElA0w.A0E(str)) == null) ? EnumC1698ec.A08 : enumC1698ecA0E;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1b() {
        super.A1b();
        C2370pi c2370pi = this.A03;
        if (c2370pi != null) {
            c2370pi.A06();
        }
        ObjectAnimator objectAnimator = this.A00;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
        this.A00 = null;
        C0823Cc c0823Cc = this.A08;
        if (c0823Cc != null) {
            c0823Cc.A0U();
        }
        super.A0F.A0V();
        C2566ss c2566ss = this.A05;
        if (c2566ss != null) {
            c2566ss.A0O();
        }
        C0781Am c0781Am = this.A09;
        if (c0781Am != null) {
            AbstractC2426qc.A0K(c0781Am);
        }
        this.A09 = null;
        C06243u $this$onDestroy_u24lambda_u2416 = this.A04;
        if ($this$onDestroy_u24lambda_u2416 != null) {
            $this$onDestroy_u24lambda_u2416.removeAllViews();
            $this$onDestroy_u24lambda_u2416.A1U();
        }
        LinearLayout linearLayout = this.A01;
        if (linearLayout != null) {
            linearLayout.removeAllViews();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1g() {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1h() {
        if (this.A0B > 0) {
            A0A();
            C1738fH c1738fHA0I = super.A08.A32().A0I();
            if (A0H[6].charAt(7) == 'p') {
                throw new RuntimeException();
            }
            String[] strArr = A0H;
            strArr[4] = "OqCTLN5PmavFXPyqEYGvVvlA0g0S9AhN";
            strArr[0] = "3nGN5LM01ATvfmDfPiFT5uvQnRQeu3P2";
            int iA02 = c1738fHA0I.A02();
            if (iA02 >= 0) {
                AbstractC2452r2 abstractC2452r2 = this.A0E;
                String[] strArr2 = A0H;
                String str = strArr2[3];
                String str2 = strArr2[7];
                int length = str.length();
                int secondsForNextCta = str2.length();
                if (length != secondsForNextCta) {
                    throw new RuntimeException();
                }
                A0H[2] = "m5zg";
                abstractC2452r2.setProgressSpinnerInvisible(true);
            }
            if (iA02 == 0 || iA02 >= this.A0B) {
                this.A0E.setToolbarActionMode(8);
            } else if (iA02 > 0) {
                new C2370pi(iA02, new C0850Dd(this)).A07();
            }
        } else {
            this.A0F.AHT();
            this.A0F.AH3(false);
        }
        A1f();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1j(boolean z11) {
        C0823Cc c0823Cc = this.A08;
        if (c0823Cc != null) {
            c0823Cc.A0U();
        }
        C2370pi c2370pi = this.A03;
        if (c2370pi != null && c2370pi.A05()) {
            c2370pi.A06();
        }
        ObjectAnimator objectAnimator = this.A00;
        if (objectAnimator != null) {
            objectAnimator.pause();
        }
        if (!z11) {
            C2566ss c2566ss = this.A05;
            if (A0H[6].charAt(7) == 'p') {
                throw new RuntimeException();
            }
            A0H[1] = "JuYWyewUmON3M";
            if (c2566ss != null) {
                c2566ss.A0P();
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1k(boolean z11) {
        C0823Cc c0823Cc = this.A08;
        if (c0823Cc != null) {
            c0823Cc.A0W();
        }
        C2370pi c2370pi = this.A03;
        if (c2370pi != null && !c2370pi.A04()) {
            c2370pi.A07();
        }
        ObjectAnimator objectAnimator = this.A00;
        if (objectAnimator != null) {
            objectAnimator.resume();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1o() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1p() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1q() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public C2597tN getFullScreenAdStyle() {
        C1744fN c1744fNA01 = super.A08.A31().A01();
        C1h.A08(c1744fNA01, A04(Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, 25, 52));
        return new C2597tN(false, C2597tN.A07, c1744fNA01, ViewOnClickListenerC0884El.A05(super.A08), c1744fNA01.A08(false), null);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do, android.view.View
    public final void onConfigurationChanged(Configuration configuration) throws IllegalStateException {
        C1h.A09(configuration, A04(88, 6, 55));
        super.onConfigurationChanged(configuration);
        removeView(this.A01);
        setUpLayout(configuration.orientation);
    }

    private final void setUpCreditLine(int i5) {
        C2566ss view = this.A05;
        if (view != null) {
            view.A0O();
            AbstractC2426qc.A0K(view);
        }
        this.A05 = null;
        C2570sw c2570sw = this.A06;
        if (A0H[6].charAt(7) == 'p') {
            throw new RuntimeException();
        }
        String[] strArr = A0H;
        strArr[4] = "WcoRPF5vTc3cekJUqnn8GRZBufuhUodG";
        strArr[0] = "gQfZyAO4l38W7boUZ3cn8kLe5AFwWHEO";
        if (c2570sw != null) {
            AbstractC2426qc.A0K(c2570sw);
        }
        this.A06 = null;
        if (super.A08.A3S() || super.A08.A3O()) {
            C2566ss creditLine = AbstractC2571sx.A01(super.A09, true, super.A08, this.A0D, super.A0D, EnumC2569sv.A03, AbstractC2568su.A00(super.A08));
            C1h.A08(creditLine, A04(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 37, 29));
            this.A05 = creditLine;
            AbstractC2426qc.A0H(1116, creditLine);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(12);
            layoutParams.addRule(11);
            layoutParams.setMargins(AbstractC2383pv.A00, AbstractC2383pv.A00, AbstractC2383pv.A0H, AbstractC2383pv.A0A);
            creditLine.setLayoutParams(layoutParams);
            addView(creditLine);
        }
        if (super.A08.A3U()) {
            C2570sw staticCreditLine = AbstractC2571sx.A02(super.A09, EnumC2569sv.A03, super.A08);
            C1h.A08(staticCreditLine, A04(94, 43, 0));
            this.A06 = staticCreditLine;
            staticCreditLine.setBackgroundColor(-2145637581);
            AbstractC2426qc.A0H(1117, staticCreditLine);
            RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams2.addRule(12);
            layoutParams2.addRule(9);
            layoutParams2.setMargins(AbstractC2383pv.A0H, AbstractC2383pv.A00, AbstractC2383pv.A00, AbstractC2383pv.A0A);
            staticCreditLine.setLayoutParams(layoutParams2);
            addView(staticCreditLine);
        }
        A06();
        A08();
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final void setUpLayout(int width) throws IllegalStateException {
        String strA37;
        int iMin;
        int i5;
        int childWidth;
        List<? extends C2314ol> list;
        int extraSpacing;
        int i11;
        LinearLayout linearLayout;
        LinearLayout linearLayout2 = this.A01;
        if (linearLayout2 != null) {
            linearLayout2.removeAllViews();
        }
        C06243u c06243u = this.A04;
        if (c06243u != null) {
            c06243u.removeAllViews();
            c06243u.A1U();
        }
        C2660uO c2660uO = this.A07;
        String[] strArr = A0H;
        if (strArr[4].charAt(16) == strArr[0].charAt(16)) {
            throw new RuntimeException();
        }
        A0H[1] = "0wi3zLaxSJ";
        if (c2660uO != null) {
            c2660uO.removeAllViews();
        }
        this.A01 = null;
        this.A04 = null;
        this.A07 = null;
        List<? extends C2314ol> list2 = this.A0A;
        if (list2 == null || (strA37 = super.A08.A37()) == null) {
            return;
        }
        LinearLayout linearLayout3 = new LinearLayout(getContext());
        linearLayout3.setGravity(width == 1 ? 17 : 48);
        linearLayout3.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        linearLayout3.setOrientation(1);
        this.A01 = linearLayout3;
        int extraSpacing2 = AbstractC2385px.A04.widthPixels;
        int i12 = AbstractC2385px.A04.heightPixels;
        if (width == 1) {
            int childWidth2 = A0K;
            int childSpacing = extraSpacing2 - (childWidth2 * 4);
            int childWidth3 = i12 / 2;
            iMin = Math.min(childSpacing, childWidth3);
            i5 = (extraSpacing2 - iMin) / 8;
            childWidth = i5 * 4;
        } else {
            int childSpacing2 = A0O;
            iMin = i12 - ((childSpacing2 + A0J) + (A0K * 4));
            i5 = A0K;
            childWidth = i5 * 2;
        }
        C06243u c06243u2 = new C06243u(super.A09);
        c06243u2.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        this.A04 = c06243u2;
        C0823Cc c0823Cc = new C0823Cc(this.A04, width, list2.size(), super.A0F, null, false);
        c0823Cc.A0k(list2);
        this.A08 = c0823Cc;
        C06243u c06243u3 = this.A04;
        if (c06243u3 != null) {
            i11 = 1;
            list = list2;
            extraSpacing = width;
            c06243u3.setAdapter(new CX(super.A09, list, super.A08, super.A0A, this.A0C, super.A0F, super.A0C, super.A0D, strA37, iMin, i5, childWidth, extraSpacing, this.A08, this.A0E));
        } else {
            list = list2;
            extraSpacing = width;
            i11 = 1;
        }
        C06243u c06243u4 = this.A04;
        if (c06243u4 != null) {
            C06243u c06243u5 = this.A04;
            C1h.A06(c06243u5);
            c06243u4.A1o(c06243u5.getOnScrollListener());
        }
        if (extraSpacing == i11) {
            A0C(list);
        }
        LinearLayout linearLayout4 = this.A01;
        if (linearLayout4 != null) {
            linearLayout4.addView(this.A04);
        }
        C2660uO c2660uO2 = this.A07;
        if (c2660uO2 != null && (linearLayout = this.A01) != null) {
            linearLayout.addView(c2660uO2);
        }
        addView(this.A01, A0P);
        String[] strArr2 = A0H;
        if (strArr2[4].charAt(16) != strArr2[0].charAt(16)) {
            A0H[2] = "OOqn";
            setUpCreditLine(extraSpacing);
        } else {
            String[] strArr3 = A0H;
            strArr3[4] = "RKd4gweRPXeSLFl8w39op5SDIHtTG87v";
            strArr3[0] = "wjAYtwDVHCn8FYZfL0TBm0im3A4Jztqh";
            setUpCreditLine(extraSpacing);
        }
    }
}
