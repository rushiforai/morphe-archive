package com.facebook.ads.redexgen.X;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.graphics.Typeface;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Es, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC0891Es extends AbstractC2624to {
    public static byte[] A0d;
    public static String[] A0e = {"YZ7mqjMCQ4ZVS7HIRuPKvqVzJvYDJjdD", "lf7WQpUcEjqKCnwGgiKUdASR4zq", "78RW0uF9JjhamCOT1k0B6fMdCwhsJ6j0", "lwjyCH5IXGWzF7Np2iOjyUwAY4Xv8s6d", "rGH3h8SRsM9Uii0yiVX16M", "22wTTyXUf6EH4LTYMfLJxIQ4ktQKPU0x", "B763Zxo7MnxWTyFcqWboTePk3FDt9EU0", "ld5blse1oDiYMYeftQDrypWljETt4iPj"};
    public static final int A0f;
    public static final int A0g;
    public static final int A0h;
    public static final int A0i;
    public static final int A0j;
    public static final int A0k;
    public static final int A0l;
    public static final int A0m;
    public static final int A0n;
    public static final int A0o;
    public static final int A0p;
    public AnimatorSet A00;
    public int A01;
    public int A02;
    public int A03;
    public TextView A04;
    public C2566ss A05;
    public C2570sw A06;
    public C0774Af A07;
    public final int A08;
    public final C1756fZ A09;
    public final C1819ga A0A;
    public final C2232nO A0B;
    public final InterfaceC2459r9 A0C;
    public final Runnable A0D;
    public final Runnable A0E;
    public final String A0F;
    public final Handler A0G;
    public final View A0H;
    public final ImageView A0I;
    public final ImageView A0J;
    public final ImageView A0K;
    public final LinearLayout A0L;
    public final LinearLayout A0M;
    public final RelativeLayout A0N;
    public final RelativeLayout A0O;
    public final RelativeLayout A0P;
    public final TextView A0Q;
    public final TextView A0R;
    public final LA A0S;
    public final C1742fL A0T;
    public final C1744fN A0U;
    public final C0958Hi A0V;
    public final C2566ss A0W;
    public final C0781Am A0X;
    public final Runnable A0Y;
    public final AtomicBoolean A0Z;
    public final AtomicBoolean A0a;
    public final boolean A0b;
    public final boolean A0c;

    public static String A0T(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0d, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0a() {
        A0d = new byte[]{63, 23, 1, 7, 23, 57, 80, 91, 86, 69, 65, 92, 93, 108, 70, 67, 44, 45, 59, 43, 58, 33, 56, 60, 33, 39, 38, 1, 11, 7, 6, 119, 107, 102, 100, 98, 88, 111, 104, 107, 99, 98, 117, 88, 115, 98, AbstractJsonLexerKt.TC_INVALID, 115, 109, 111, 114, 122, 111, 120, 110, 110, 66, AbstractJsonLexerKt.TC_INVALID, 124, 111, 27, 12, 30, 8, 27, 13, 12, 13, 54, 31, 0, 13, 12, 6, 44, 62, 49, 44, 114, 44, 58, 45, 54, 57, 114, 50, 58, 59, 54, 42, 50, 52, 41, 52, 44, 37, 69, 67, 80, 95, 66, 93, 80, 69, 88, 94, 95, 104};
    }

    public abstract void A0u(int i5);

    public abstract void A0y(ViewGroup viewGroup, RelativeLayout relativeLayout, int i5);

    static {
        A0a();
        A0o = AbstractC2383pv.A0O;
        A0j = AbstractC2383pv.A0S;
        A0l = AbstractC2383pv.A0P;
        A0m = AbstractC2383pv.A03;
        A0n = AbstractC2383pv.A04;
        A0k = AbstractC2383pv.A0A;
        A0g = AbstractC1841gx.A02(-1, 255);
        A0f = AbstractC1841gx.A02(-1, 20);
        A0p = AbstractC2383pv.A0U;
        A0h = AbstractC2383pv.A0N;
        A0i = AbstractC2383pv.A0a;
    }

    public AbstractC0891Es(C0958Hi c0958Hi, ViewOnClickListenerC0884El viewOnClickListenerC0884El, int i5, boolean z11, C1744fN c1744fN, boolean z12, String str, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, LA la2, C0781Am c0781Am, C2232nO c2232nO, boolean z13) {
        View viewA02;
        super(c0958Hi, viewOnClickListenerC0884El, i5, c1744fN, z12, str, interfaceC2224nG, interfaceC2459r9, c1539c2, c2417qT, la2.A33(), la2.A2W(), la2.A1f());
        this.A0Z = new AtomicBoolean(true);
        this.A0a = new AtomicBoolean(false);
        this.A0Y = new RunnableC2625tp(this);
        this.A0E = new RunnableC2626tq(this);
        this.A0D = new RunnableC2627tr(this);
        this.A0B = c2232nO;
        this.A0S = la2;
        this.A0A = AbstractC1820gb.A00(c0958Hi.A02());
        this.A0C = interfaceC2459r9;
        this.A0F = la2.A37();
        this.A09 = la2.A35();
        this.A0U = c1744fN;
        this.A0T = la2.A32().A0J();
        this.A0V = c0958Hi;
        this.A0b = z11;
        this.A0c = z13;
        this.A0G = new Handler(Looper.getMainLooper());
        this.A0I = new ImageView(this.A0V);
        this.A0J = new ImageView(this.A0V);
        AbstractC2426qc.A0H(1104, this.A0I);
        AbstractC2426qc.A0H(1105, this.A0J);
        this.A0W = AbstractC2571sx.A01(this.A0V, true, this.A0S, this.A0B, this.A0C, EnumC2569sv.A03, AbstractC2568su.A00(this.A0S));
        AbstractC2426qc.A0H(1116, this.A0W);
        this.A01 = -1;
        this.A03 = -16777216;
        this.A0P = A0O();
        this.A0N = A0M();
        this.A0O = A0N();
        A0V();
        A0U();
        this.A0M = new LinearLayout(this.A0V);
        this.A0M.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
        AbstractC2426qc.A0L(this.A0M);
        this.A0K = A0K();
        AbstractC2426qc.A0L(this.A0K);
        if (this.A0c) {
            this.A0K.setVisibility(0);
            this.A0K.setOnClickListener(AbstractC2675ud.A03(super.A08, A0T(6, 10, 69)));
        } else {
            this.A0K.setVisibility(8);
        }
        if (super.A08.getParent() != null) {
            ((ViewGroup) super.A08.getParent()).removeView(super.A08);
        }
        this.A0R = A0R();
        AbstractC2426qc.A0H(1107, this.A0R);
        this.A0Q = A0P();
        AbstractC2426qc.A0H(1108, this.A0Q);
        this.A0X = A0S(c0781Am);
        AbstractC2426qc.A0H(1109, this.A0X);
        if (this.A0S.A2i()) {
            viewA02 = C1652ds.A02(this.A0V, this.A0X, A0g, A0f, A0p);
        } else {
            viewA02 = this.A0X;
        }
        this.A0H = viewA02;
        if (this.A0S.A2U()) {
            this.A0H.setVisibility(8);
        }
        this.A0L = A0L();
        AbstractC2426qc.A0H(1103, this.A0L);
        this.A0L.setOnClickListener(new ViewOnClickListenerC2628ts(this));
        A0t(8);
        setUpAdReportingInitiateView(la2);
        setUpCreditLineV2(la2);
        this.A08 = this.A0S.A32().A0I().A03();
        if (this.A0S.A1c().equals(A0T(60, 14, 31)) && !la2.A2T() && this.A08 > 0) {
            this.A04 = A0Q();
            AbstractC2426qc.A0H(1110, this.A04);
        }
        this.A0G.postDelayed(this.A0E, 2000L);
    }

    public static int A0I(int i5) {
        if (AbstractC1841gx.A01(i5, -1) >= 4.5d) {
            return -1;
        }
        return -16777216;
    }

    private ImageView A0K() {
        ImageView imageView = new ImageView(this.A0V);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A0k, A0k);
        layoutParams.addRule(14);
        layoutParams.setMargins(0, 0, 0, AbstractC2383pv.A0y);
        imageView.setLayoutParams(layoutParams);
        imageView.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.CHEVRON_UP));
        return imageView;
    }

    private LinearLayout A0L() {
        LinearLayout linearLayout = new LinearLayout(this.A0V);
        linearLayout.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
        this.A0I.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        this.A0I.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.AD_CHOICE_V2_COLLAPSE));
        linearLayout.addView(this.A0I);
        this.A0J.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        this.A0J.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.AD_CHOICE_V2_EXPAND));
        linearLayout.addView(this.A0J);
        return linearLayout;
    }

    private RelativeLayout A0M() {
        RelativeLayout relativeLayout = new RelativeLayout(this.A0V);
        relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        relativeLayout.setClipChildren(false);
        relativeLayout.setClipToPadding(false);
        AbstractC2426qc.A0L(relativeLayout);
        return relativeLayout;
    }

    private RelativeLayout A0N() {
        RelativeLayout relativeLayout = new RelativeLayout(this.A0V);
        RelativeLayout.LayoutParams childLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
        childLayoutParams.addRule(16);
        AbstractC2426qc.A0L(relativeLayout);
        return relativeLayout;
    }

    private RelativeLayout A0O() {
        RelativeLayout relativeLayout = new RelativeLayout(this.A0V);
        relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        return relativeLayout;
    }

    private TextView A0P() {
        String strA0G;
        TextView textView = new TextView(this.A0V);
        if (this.A0c) {
            strA0G = this.A0T.A0H();
        } else {
            strA0G = this.A0T.A0G();
        }
        textView.setText(strA0G);
        textView.setTextColor(-1);
        textView.setMaxLines(4);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        textView.setTextAlignment(4);
        textView.setTypeface(Typeface.DEFAULT);
        textView.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
        return textView;
    }

    private TextView A0Q() {
        TextView textView = new TextView(this.A0V);
        textView.setTextColor(-855638017);
        textView.setMaxLines(1);
        textView.setTypeface(Typeface.DEFAULT);
        textView.setTextSize(14.0f);
        textView.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
        AbstractC2426qc.A0L(textView);
        return textView;
    }

    private TextView A0R() {
        String strA0H;
        TextView textView = new TextView(this.A0V);
        if (this.A0c) {
            strA0H = this.A0T.A0G();
        } else {
            strA0H = this.A0T.A0H();
        }
        textView.setText(strA0H);
        textView.setTextColor(-1);
        textView.setMaxLines(2);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setTextSize(30.0f);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        textView.setTextAlignment(4);
        textView.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
        return textView;
    }

    private C0781Am A0S(C0781Am c0781Am) {
        if (c0781Am == null) {
            c0781Am = new C0781Am(this.A0V, -1);
            c0781Am.setVisibility(8);
        }
        c0781Am.A0A(A0g, A0f, true);
        c0781Am.setPadding(0, 0, 0, 0);
        RelativeLayout.LayoutParams progressBarLayoutParams = new RelativeLayout.LayoutParams(-1, A0p);
        c0781Am.setLayoutParams(progressBarLayoutParams);
        return c0781Am;
    }

    private void A0U() {
        this.A02 = 30;
        super.A08.setIncludeFontPadding(false);
        super.A08.setTextSize(18.0f);
        super.A08.setTextColor(this.A03);
        super.A08.setOutlineProvider(null);
        AbstractC2426qc.A0W(super.A08, AbstractC2426qc.A06(this.A01, this.A02));
        super.A08.setLayoutParams(new RelativeLayout.LayoutParams(-2, A0j));
        AbstractC2426qc.A0H(1001, super.A08);
        if (!this.A0S.A1g().isEmpty() || EnumC2275o7.A00(this.A0S.A1a()) == EnumC2275o7.A06) {
            if (Build.VERSION.SDK_INT >= 28) {
                super.A08.setTypeface(Typeface.create(Typeface.SANS_SERIF, 600, false));
            } else {
                super.A08.setTypeface(Typeface.create(A0T(74, 17, 41), 0));
            }
        }
    }

    private void A0V() {
        if (this.A0b) {
            super.A09.setFullCircleCorners(true);
        } else {
            super.A09.setRadius(15);
        }
        AbstractC2426qc.A0O(super.A09, 0);
        super.A09.setLayoutParams(new RelativeLayout.LayoutParams(A0l, A0l));
        AbstractC2426qc.A0L(super.A09);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0W() {
        if (this.A0B != null) {
            this.A0B.A04(EnumC2231nN.A0A, null);
        }
        C1819ga c1819ga = this.A0A;
        C0957Hh c0957HhA02 = this.A0V.A02();
        if (A0e[1].length() == 18) {
            throw new RuntimeException();
        }
        String[] strArr = A0e;
        strArr[5] = "21oPnUFpyuOPK2fB009ubeUcH8EMAvZw";
        strArr[7] = "KnNEyrKNEpVmEzjcBxoivzciYA3Ii2PI";
        if (c1819ga.A0O(c0957HhA02, true)) {
            this.A0C.ABW(this.A0F, this.A09);
        } else {
            if (TextUtils.isEmpty(this.A09.A00())) {
                return;
            }
            C2347pK.A0P(new C2347pK(), this.A0V, AbstractC2351pP.A00(this.A09.A00()), this.A0F);
        }
    }

    private void A0X() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(AbstractC2383pv.A0e, 0, 0, 0);
        layoutParams.addRule(12);
        layoutParams.addRule(9);
        this.A0L.setLayoutParams(layoutParams);
    }

    private void A0Y() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        if (this.A0S.A3S()) {
            layoutParams.setMargins(0, 0, AbstractC2383pv.A0h, AbstractC2383pv.A0y);
            layoutParams.addRule(12);
            layoutParams.addRule(11);
        } else {
            layoutParams.setMargins(AbstractC2383pv.A0c, 0, 0, 0);
            layoutParams.addRule(8, this.A0H.getId());
            layoutParams.addRule(1, this.A0H.getId());
        }
        this.A0W.setLayoutParams(layoutParams);
    }

    private void A0Z() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, A0p);
        layoutParams.width = (int) (getResources().getDisplayMetrics().widthPixels * 0.42f);
        layoutParams.addRule(14);
        layoutParams.addRule(12);
        layoutParams.setMargins(0, 0, 0, AbstractC2383pv.A0y);
        this.A0H.setLayoutParams(layoutParams);
    }

    private void A0b(int i5, int i11) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, 0, AbstractC2383pv.A0e, 0);
        if (i11 == 1) {
            layoutParams.addRule(11);
        } else {
            layoutParams.addRule(0, i5);
        }
        layoutParams.addRule(12);
        this.A0L.setLayoutParams(layoutParams);
    }

    private void A0c(int i5, int i11) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.removeRule(7);
        layoutParams.removeRule(2);
        layoutParams.removeRule(12);
        layoutParams.removeRule(0);
        if (i11 == 1) {
            if (this.A0H.getVisibility() == 8) {
                layoutParams.setMargins(0, 0, AbstractC2383pv.A0e, AbstractC2383pv.A0y);
                layoutParams.addRule(12);
                layoutParams.addRule(11);
            } else {
                if (!this.A0S.A3S()) {
                    layoutParams.addRule(2, this.A0H.getId());
                    layoutParams.addRule(7, this.A0H.getId());
                } else {
                    layoutParams.addRule(12);
                    layoutParams.addRule(7, this.A0H.getId());
                }
                layoutParams.setMargins(0, 0, 0, AbstractC2383pv.A0y);
            }
        } else {
            if (this.A0S.A3S()) {
                layoutParams.setMargins(0, 0, AbstractC2383pv.A0e, AbstractC2383pv.A0h);
            } else {
                layoutParams.setMargins(0, 0, AbstractC2383pv.A0e, AbstractC2383pv.A0y);
            }
            layoutParams.addRule(0, i5);
            layoutParams.addRule(12);
        }
        this.A0W.setLayoutParams(layoutParams);
    }

    private void A0d(int i5, int i11) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, A0p);
        if (i11 == 1) {
            layoutParams.addRule(12);
            if (this.A0W.getVisibility() == 8) {
                layoutParams.setMargins(AbstractC2383pv.A0e, 0, AbstractC2383pv.A0y, AbstractC2383pv.A0y);
                layoutParams.addRule(0, this.A0L.getId());
            } else if (this.A0S.A3S()) {
                layoutParams.setMargins(AbstractC2383pv.A0e, 0, AbstractC2383pv.A0e, AbstractC2383pv.A0m);
            } else {
                layoutParams.setMargins(AbstractC2383pv.A0e, 0, AbstractC2383pv.A0e, AbstractC2383pv.A0y);
            }
        } else {
            if (this.A0W.getVisibility() == 8) {
                layoutParams.setMargins(AbstractC2383pv.A0e, 0, AbstractC2383pv.A0e, AbstractC2383pv.A0y);
                layoutParams.addRule(2, this.A0L.getId());
            } else {
                layoutParams.setMargins(AbstractC2383pv.A0e, 0, AbstractC2383pv.A0e, AbstractC2383pv.A0r);
                layoutParams.addRule(2, this.A0W.getId());
            }
            layoutParams.addRule(0, i5);
        }
        layoutParams.addRule(14);
        this.A0H.setLayoutParams(layoutParams);
    }

    private void A0e(View view) {
        if (view != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.setMargins(AbstractC2383pv.A0h, 0, 0, AbstractC2383pv.A0y);
            layoutParams.addRule(12);
            layoutParams.addRule(9);
            view.setLayoutParams(layoutParams);
        }
    }

    private void A0f(View view, int i5) {
        if (view != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.removeRule(5);
            layoutParams.removeRule(12);
            layoutParams.removeRule(1);
            if (i5 != 1) {
                layoutParams.setMargins(0, 0, 0, AbstractC2383pv.A0h);
                layoutParams.addRule(5, this.A0H.getId());
                layoutParams.addRule(12);
            } else if (this.A0H.getVisibility() == 8) {
                layoutParams.setMargins(AbstractC2383pv.A0e, 0, 0, AbstractC2383pv.A0y);
                layoutParams.addRule(12);
                layoutParams.addRule(9);
            } else {
                layoutParams.setMargins(0, 0, 0, AbstractC2383pv.A0y);
                layoutParams.addRule(12);
                layoutParams.addRule(5, this.A0H.getId());
            }
            view.setLayoutParams(layoutParams);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public final void A0j() {
        this.A0G.removeCallbacksAndMessages(null);
        AbstractC2426qc.A0e(this.A0P, this.A0O, super.A09, this.A0R, super.A08, this.A0X, this.A0H, this.A04, this.A0Q, this.A0L, this.A0W, this.A06, this.A05, this.A0K, this.A0N);
        removeAllViews();
        this.A0W.A0O();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public final void A0k() {
        super.A09.setOnClickListener(AbstractC2675ud.A03(super.A08, A0T(27, 4, 30)));
        this.A0R.setOnClickListener(AbstractC2675ud.A03(super.A08, A0T(91, 5, 54)));
        this.A0Q.setOnClickListener(AbstractC2675ud.A03(super.A08, A0T(16, 11, 62)));
        this.A0X.setOnClickListener(AbstractC2675ud.A03(super.A08, A0T(48, 12, 107)));
        if (this.A04 != null) {
            TextView textView = this.A04;
            ViewOnClickListenerC0884El viewOnClickListenerC0884El = super.A08;
            if (A0e[0].charAt(10) == 'E') {
                throw new RuntimeException();
            }
            A0e[0] = "yvH0iGYeyfHnJzYK2LpOtn5mOMwEyg0X";
            textView.setOnClickListener(AbstractC2675ud.A03(viewOnClickListenerC0884El, A0T(31, 17, 113)));
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public void A0l(int i5) {
        A0o();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public final void A0m(boolean z11) {
        super.A0m(z11);
        if (!z11) {
            this.A0W.A0P();
        }
    }

    public final void A0n() {
        if (this.A04 != null) {
            this.A04.setVisibility(8);
        }
    }

    public final void A0o() {
        if (this.A00 != null) {
            this.A00.cancel();
            this.A0G.removeCallbacks(this.A0D);
        }
    }

    public final void A0p() {
        super.A08.setIncludeFontPadding(false);
        super.A08.setTextSize(18.0f);
        super.A08.setTextColor(this.A03);
        AbstractC2426qc.A0W(super.A08, AbstractC2426qc.A06(this.A01, this.A02));
        super.A08.A0D();
    }

    public final void A0q() {
        super.A08.A0D();
    }

    public final void A0r() {
        if (this.A00 != null) {
            int height = super.A08.getHeight();
            float f11 = height * 0.1f;
            String strA0T = A0T(96, 12, 71);
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(super.A08, strA0T, -f11, 0.0f);
            float bounceHeight = -f11;
            ObjectAnimator animator1 = ObjectAnimator.ofFloat(this.A0K, strA0T, bounceHeight, 0.0f);
            objectAnimatorOfFloat.setInterpolator(new LinearInterpolator());
            animator1.setInterpolator(new LinearInterpolator());
            this.A00.playTogether(objectAnimatorOfFloat, animator1);
            this.A00.setDuration(600L);
            this.A00.start();
        }
    }

    public final void A0s(int i5) {
        if (this.A04 != null) {
            int iMax = Math.max(0, this.A08 - i5);
            if (iMax > 0) {
                String rewardMessage = this.A0S.A36().A07().replace(A0T(0, 6, 18), String.valueOf(iMax));
                this.A04.setText(rewardMessage);
                return;
            }
            this.A04.setVisibility(8);
        }
    }

    public final void A0t(int i5) {
        if (i5 == 0) {
            this.A0J.setVisibility(i5);
            this.A0I.setVisibility(8);
        } else {
            this.A0J.setVisibility(i5);
            this.A0I.setVisibility(0);
        }
    }

    public final void A0v(long j11) {
        this.A00 = new AnimatorSet();
        this.A0G.postDelayed(this.A0D, j11);
    }

    public void A0w(View view, int i5, float[] fArr) {
        RoundRectShape roundRectShape = new RoundRectShape(fArr, null, null);
        ShapeDrawable shapeDrawable = new ShapeDrawable(roundRectShape);
        shapeDrawable.getPaint().setColor(i5);
        view.setBackground(shapeDrawable);
    }

    public final void A0x(ViewGroup viewGroup, View view) {
        if (view != null) {
            viewGroup.addView(view);
        }
    }

    public final void A0z(ViewGroup viewGroup, boolean z11, boolean z12, int i5) {
        AbstractC2426qc.A0e(this.A0L, this.A0W, this.A06, this.A0H, super.A09, this.A0R, this.A0Q, this.A04, this.A05);
        AbstractC2426qc.A0K(this);
        int i11 = getResources().getConfiguration().orientation;
        if (z11) {
            if (i11 == 2 && z12) {
                A0X();
                viewGroup.addView(this.A0L);
                A0Z();
                viewGroup.addView(this.A0H);
                A0Y();
                viewGroup.addView(this.A0W);
                A0e(this.A06);
                A0e(this.A05);
                A0x(viewGroup, this.A06);
                A0x(viewGroup, this.A05);
            } else {
                A0b(i5, i11);
                viewGroup.addView(this.A0L);
                A0d(i5, i11);
                viewGroup.addView(this.A0H);
                A0c(i5, i11);
                viewGroup.addView(this.A0W);
                A0f(this.A06, i11);
                A0f(this.A05, i11);
                A0x(viewGroup, this.A06);
                A0x(viewGroup, this.A05);
            }
            if (this.A04 != null) {
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
                if (this.A0H.getVisibility() == 8) {
                    layoutParams.addRule(12);
                    layoutParams.addRule(9);
                    int orientation = AbstractC2383pv.A0e;
                    layoutParams.setMargins(orientation, 0, 0, AbstractC2383pv.A0m);
                } else {
                    layoutParams.addRule(2, this.A0H.getId());
                    layoutParams.addRule(5, this.A0H.getId());
                    layoutParams.setMargins(0, 0, 0, AbstractC2383pv.A0y);
                }
                this.A04.setLayoutParams(layoutParams);
                viewGroup.addView(this.A04);
                return;
            }
            return;
        }
        this.A0H.setLayoutParams(new RelativeLayout.LayoutParams(-1, A0p));
        if (this.A04 == null) {
            return;
        }
        this.A04.setLayoutParams(new RelativeLayout.LayoutParams(-2, -2));
    }

    public final void A10(RelativeLayout relativeLayout) {
        if (this.A04 != null && this.A04.getVisibility() == 0) {
            relativeLayout.addView(this.A04);
        }
    }

    public final boolean A11() {
        return this.A04 != null && this.A04.getVisibility() == 0;
    }

    public C0781Am getProgressBarAnimation() {
        return this.A0X;
    }

    public void setCTAClickListener(View.OnClickListener onClickListener) {
        super.A09.setOnClickListener(onClickListener);
        this.A0R.setOnClickListener(onClickListener);
        this.A0Q.setOnClickListener(onClickListener);
        this.A0X.setOnClickListener(onClickListener);
        if (this.A04 != null) {
            this.A04.setOnClickListener(onClickListener);
        }
    }

    public void setChainedAdInfo(String str) {
        this.A04 = A0Q();
        AbstractC2426qc.A0L(this.A04);
        this.A04.setText(str);
    }

    public void setPlaceHolderTextForRewardsConversion(String str) {
        if (this.A04 != null) {
            this.A04.setText(str);
            this.A04.setOnClickListener(AbstractC2675ud.A03(super.A08, A0T(31, 17, 113)));
        }
    }

    private void setUpAdReportingInitiateView(LA la2) {
        if (la2.A3O() || la2.A3S()) {
            this.A0L.setVisibility(8);
            String[] strArr = A0e;
            if (strArr[3].charAt(23) == strArr[2].charAt(23)) {
                throw new RuntimeException();
            }
            A0e[6] = "0FcdVCAcjavFmKr8FtV8pQfbpWB7inim";
            this.A0I.setVisibility(8);
            this.A0J.setVisibility(8);
            return;
        }
        this.A0W.setVisibility(8);
    }

    private void setUpCreditLineV2(LA la2) {
        if (la2.A3U()) {
            this.A06 = AbstractC2571sx.A02(this.A0V, EnumC2569sv.A03, la2);
            AbstractC2426qc.A0H(1117, this.A06);
        } else {
            if (!la2.A3T()) {
                return;
            }
            this.A05 = AbstractC2571sx.A01(this.A0V, true, this.A0S, this.A0B, this.A0C, EnumC2569sv.A03, EnumC2572sy.A04);
            AbstractC2426qc.A0L(this.A05);
        }
    }
}
