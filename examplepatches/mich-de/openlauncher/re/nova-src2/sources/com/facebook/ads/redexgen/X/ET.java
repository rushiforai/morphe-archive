package com.facebook.ads.redexgen.X;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Point;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.view.WindowManager;
import android.view.WindowMetrics;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class ET extends AbstractC2685un {
    public static byte[] A0l;
    public static String[] A0m = {"E7d9V", "HfiTPdnQE6JsOHdYoOA4lRNnbQ3", "7AVXCU5oRbsgBqmorHmAVCwb6r5tuTQ8", "hoWzaZbN7yXesQFa", "a3ZYa3", "EXUfJIeYYGyfdCGOPOS2l0on83CPH94Z", "MYJwByDzw5bCUSkxw6qgTJ7WJbI", "X3l5ZIwYV4"};
    public static final int A0n;
    public static final int A0o;
    public static final int A0p;
    public static final int A0q;
    public static final int A0r;
    public float A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public Handler A08;
    public View A09;
    public InputMethodManager A0A;
    public LinearLayout A0B;
    public LinearLayout A0C;
    public TextView A0D;
    public LA A0E;
    public AbstractRunnableC2319oq A0F;
    public F6 A0G;
    public C2590tG A0H;
    public F4 A0I;
    public C2689ur A0J;
    public C2730vW A0K;
    public boolean A0L;
    public boolean A0M;
    public boolean A0N;
    public boolean A0O;
    public boolean A0P;
    public boolean A0Q;
    public boolean A0R;
    public boolean A0S;
    public boolean A0T;
    public boolean A0U;
    public boolean A0V;
    public boolean A0W;
    public boolean A0X;
    public boolean A0Y;
    public boolean A0Z;
    public final Handler A0a;
    public final View A0b;
    public final AbstractC1701ef A0c;
    public final C2232nO A0d;
    public final InterfaceC2643u7 A0e;
    public final InterfaceC2658uM A0f;
    public final C2659uN A0g;
    public final C0781Am A0h;
    public final Runnable A0i;
    public final boolean A0j;
    public final boolean A0k;

    public static String A0I(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0l, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0W() {
        A0l = new byte[]{62, 49, 52, 62, 54, 2, 46, 50, 40, 47, 62, 56, 0, 7, 25, 28, 29, 54, 4, 12, 29, 1, 6, 13, 25, 31, 9, 30, 15, 0, 5, 15, 7, 51, 10, 5, 0, 24, 9, 30, 9, 8, 114, 108, 107, 97, 106, 114, 1};
    }

    static {
        A0W();
        A0p = AbstractC2383pv.A0F;
        A0n = AbstractC2383pv.A0K;
        A0r = AbstractC2383pv.A0X;
        A0o = AbstractC1841gx.A02(-1, 77);
        A0q = AbstractC2383pv.A06;
    }

    public ET(C2689ur c2689ur) {
        super(c2689ur, true);
        this.A02 = 0;
        this.A0L = false;
        this.A0U = false;
        this.A0W = false;
        this.A0X = false;
        this.A0Y = false;
        this.A0V = false;
        this.A0Z = false;
        this.A0P = false;
        this.A0R = false;
        this.A0Q = false;
        this.A0O = false;
        this.A07 = 0;
        this.A01 = 0;
        this.A0S = false;
        this.A0T = true;
        this.A0a = new Handler(Looper.getMainLooper());
        this.A0i = new RunnableC2706v8(this);
        this.A0N = false;
        this.A08 = new Handler(Looper.getMainLooper());
        this.A0A = (InputMethodManager) c2689ur.A06().getSystemService(A0I(12, 12, 19));
        this.A0J = c2689ur;
        this.A0E = this.A0J.A05();
        this.A0d = new C2232nO(c2689ur.A05().A37(), c2689ur.A07());
        this.A0h = this.A0J.A0E();
        if (this.A0h != null) {
            AbstractC2426qc.A0L(this.A0h);
        }
        this.A0b = this.A0J.A03();
        this.A0c = C1702eg.A01(c2689ur.A06(), c2689ur.A07(), c2689ur.A05().A37(), AbstractC2351pP.A00(c2689ur.A05().A32().A0K().A06()), new HashMap(), false, true, this.A0E.A33());
        this.A0e = new EW(this);
        String strA08 = c2689ur.A05().A32().A0I().A08();
        if (strA08 != null) {
            AbstractC2668uW.A00(c2689ur.A06(), this, strA08);
        }
        setupLayoutConfiguration(false);
        A0R();
        A0N();
        this.A0F = new EV(this);
        postDelayed(this.A0F, 1000L);
        A0V();
        this.A0f = new EU(this);
        C0799Be c0799Be = this.A0J.A02() instanceof C0799Be ? (C0799Be) this.A0J.A02() : null;
        this.A0g = new C2659uN(c2689ur, this.A0E, c0799Be, this.A0J.A0C(), this.A0f, this.A0D, this.A0K, this.A0h, this.A0b);
        if (c0799Be != null && C2203mv.A1L(getAdContextWrapper())) {
            AbstractC2621tl.A00(c0799Be.getVideoImplView(), C2203mv.A1M(getAdContextWrapper()), new ViewOnClickListenerC2707v9(this));
        } else if (c0799Be == null && this.A09 != null && C2203mv.A1J(getAdContextWrapper())) {
            AbstractC2621tl.A00(this.A09, C2203mv.A1K(getAdContextWrapper()), new ViewOnClickListenerC2708vA(this));
        }
        this.A0j = c2689ur.A05().A2Y();
        this.A0k = c2689ur.A05().A2r();
        getAdContextWrapper().A0F().AD8(this.A0j, this.A0k, c2689ur.A05().A3E());
    }

    public static /* synthetic */ int A03(ET et2) {
        int i5 = et2.A01;
        et2.A01 = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int A05(ET et2) {
        int i5 = et2.A07;
        et2.A07 = i5 + 1;
        return i5;
    }

    private void A0J() {
        AbstractC2426qc.A0K(this.A0C);
        this.A0C = new LinearLayout(this.A0J.A06());
        AbstractC2426qc.A0V(this.A0C, getAdContextWrapper());
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, this.A0L ? this.A03 / 4 : this.A03 / 5);
        layoutParams.addRule(12);
        this.A0C.setLayoutParams(layoutParams);
        addView(this.A0C, 2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0K() {
        if (this.A0E.A2O() && this.A0N) {
            this.A0N = false;
            A0g(A0I(24, 18, 22));
        }
    }

    private void A0L() {
        if (this.A0E.A2O() && this.A0N) {
            this.A0N = false;
            Map<String, String> mapA07 = new C2618ti().A05(null).A04(null).A07();
            mapA07.put(A0I(0, 12, 39), A0I(24, 18, 22));
            getAdEventManager().ABr(this.A0E.A37(), mapA07);
        }
    }

    private void A0M() {
        if (this.A0J.A05().A2p()) {
            AbstractC2452r2 abstractC2452r2A0B = this.A0J.A0B();
            String[] strArr = A0m;
            if (strArr[6].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            A0m[5] = "A12Q06T7GUYr42DFZcrpPYwQeNBLUijr";
            if (abstractC2452r2A0B != null) {
                abstractC2452r2A0B.setProgressSpinnerInvisible(false);
            }
        }
    }

    private void A0N() {
        AbstractC2426qc.A0K(this.A0B);
        this.A0B = new LinearLayout(this.A0J.A06());
        this.A0B.setOrientation(1);
        AbstractC2426qc.A0L(this.A0B);
        A0T();
        this.A0B.setBackgroundColor(-1);
        addView(this.A0B);
    }

    private void A0O() {
        if (this.A0b != null) {
            AbstractC2426qc.A0K(this.A0b);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(AbstractC2685un.A0A, AbstractC2685un.A0A);
            layoutParams.addRule(10);
            layoutParams.addRule(11);
            layoutParams.setMargins(AbstractC2685un.A09, this.A06, AbstractC2685un.A09, AbstractC2685un.A09);
            addView(this.A0b, layoutParams);
        }
    }

    private void A0P() {
        if (this.A0h != null) {
            AbstractC2426qc.A0K(this.A0h);
            this.A0h.setPadding(A0q, A0q, A0q, A0q);
            this.A0h.A0A(-1, A0o, false);
            this.A0h.setTranslationY(0.0f);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, A0p);
            layoutParams.addRule(12);
            addView(this.A0h, layoutParams);
        }
    }

    private void A0Q() {
        AbstractC2452r2 abstractC2452r2A0B = this.A0J.A0B();
        if (abstractC2452r2A0B == null) {
            return;
        }
        abstractC2452r2A0B.setPageDetailsVisible((this.A0M || abstractC2452r2A0B.A0E()) ? false : true);
    }

    private void A0R() {
        this.A09 = this.A0J.A02();
        if (this.A09 != null) {
            if (this.A0E.A2O()) {
                this.A09.setOnClickListener(new ViewOnClickListenerC2709vB(this));
            }
            AbstractC2426qc.A0K(this.A09);
            AbstractC2426qc.A0L(this.A09);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
            layoutParams.addRule(15);
            addView(this.A09, 1, layoutParams);
        }
        this.A0D = new TextView(this.A0J.A06());
        AbstractC2426qc.A0L(this.A0D);
        this.A0D.setGravity(17);
        this.A0D.setTextColor(getColors().A06(true));
        this.A0D.setEllipsize(TextUtils.TruncateAt.END);
        this.A0D.setMaxLines(2);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(12);
        layoutParams2.setMargins(A0r, A0r / 2, A0r, this.A0h == null ? A0r : A0p);
        addView(this.A0D, layoutParams2);
        AbstractC2426qc.A0L(this.A0D);
        this.A0K = new C2730vW(this.A0J.A06(), getCtaButton(), this.A0J.A05(), this.A0J.A07(), this.A0J.A0C(), this.A0J.A0F(), this.A0J.A0A(), getColors(), this.A0e);
        this.A0K.setAutoClickTime(this.A0J.A05(), this.A0J.A0B());
        AbstractC2426qc.A0H(TTAdConstant.IMAGE_MODE_1010, this.A0K);
        addView(this.A0K);
        A0U();
        A0J();
        if (C2203mv.A16(this.A0J.A06())) {
            View.OnClickListener onClickListener = new ViewOnClickListenerC2710vC(this);
            this.A0C.setOnClickListener(onClickListener);
            if (this.A0J.A0B() != null) {
                View.OnClickListener onClickListener2 = new ViewOnClickListenerC2711vD(this);
                this.A0J.A0B().setCTAClickListener(onClickListener2);
            }
        }
    }

    private void A0S() {
        this.A0V = true;
        this.A0K.setVisibility(8);
        AbstractC2426qc.A0X(this);
        removeCallbacks(this.A0F);
        AbstractC2426qc.A0e(this.A0K);
        AbstractC2426qc.A0e(this.A0h, this.A0b, this.A0g, this.A0D, this.A0G, this.A0J.A0B(), this.A0B, this.A0H);
        if (Build.VERSION.SDK_INT >= 35) {
            Object parent = getParent();
            if (A0m[2].charAt(2) == 'l') {
                throw new RuntimeException();
            }
            String[] strArr = A0m;
            strArr[7] = "dcmhw8Dv4G";
            strArr[4] = "xWqpnZ";
            if (parent instanceof View) {
                View view = (View) parent;
                view.setFitsSystemWindows(false);
                view.setPadding(0, 0, 0, 0);
            }
        }
        if (this.A09 instanceof C0799Be) {
            View view2 = this.A09;
            String[] strArr2 = A0m;
            if (strArr2[3].length() == strArr2[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr3 = A0m;
            strArr3[3] = "MwIFkAnAcHG80XI9";
            strArr3[0] = "L16qh";
            C0799Be c0799Be = (C0799Be) view2;
            Iterator<InterfaceC1663e3> it = c0799Be.getPlugins().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                InterfaceC1663e3 next = it.next();
                if (next instanceof AnonymousClass51) {
                    c0799Be.A0h(next);
                    break;
                }
            }
        }
        addView(new C2701v3(this.A0J.A06(), this.A0E, this.A0d, this.A0a, this.A0J.A0C()).A0E(getRegularCtaForEndCard()));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0T() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, this.A04);
        if (A1j()) {
            layoutParams.setMargins(0, this.A04 / 5, 0, 0);
            layoutParams.addRule(12);
            String[] strArr = A0m;
            if (strArr[7].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0m;
            strArr2[7] = "mOqhFUC5R4";
            strArr2[4] = "x2rQdK";
            this.A0B.setLayoutParams(layoutParams);
        } else {
            layoutParams.setMargins(0, this.A04 + 1, 0, 0);
        }
        this.A0B.setTranslationY(0.0f);
        this.A0B.setLayoutParams(layoutParams);
    }

    private void A0U() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, this.A0L ? this.A03 / 4 : this.A03 / 5);
        layoutParams.addRule(14);
        layoutParams.addRule(2, this.A0D.getId());
        layoutParams.setMargins(0, 0, 0, 0);
        this.A0K.setLayoutParams(layoutParams);
        this.A0K.A03();
    }

    private void A0V() {
        if (!this.A0V) {
            A0P();
            A0O();
        }
        A0Q();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0f(String str) {
        F4 f42;
        AbstractC2426qc.A0K(this.A0I);
        EY ey2 = new EY(this);
        if (this.A0J.A06().A0E() == null) {
            this.A0J.A06().A0F().AAZ();
        }
        if (AbstractC2204mw.A02(this.A0J.A06()) || this.A0J.A06().A0E() == null) {
            f42 = new F4(this.A0J.A06(), ey2);
        } else {
            f42 = new F4(this.A0J.A06(), this.A0J.A06().A0E(), ey2);
        }
        this.A0I = f42;
        this.A0I.setOnTouchListener(new ViewOnTouchListenerC2703v5(this));
        setUpBrowserControls(this.A0I);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -1);
        layoutParams.weight = 0.9f;
        this.A0B.addView(this.A0I, layoutParams);
        this.A0I.loadUrl(str);
    }

    private void A0g(String str) {
        Map<String, String> mapA07 = new C2618ti().A05(null).A04(null).A02(this.A0J.A06(), this.A0c).A07();
        mapA07.put(A0I(0, 12, 39), str);
        this.A0d.A04(EnumC2231nN.A0J, mapA07);
        this.A0J.A0C().A5C(this.A0E.A1X());
        getAdEventManager().ACA(this.A0E.A37(), mapA07);
        if (C2203mv.A2W(this.A0J.A06())) {
            HashMap map = new HashMap();
            map.put(MH.A04, Boolean.TRUE.toString());
            map.put(MH.A05, Boolean.TRUE.toString());
            map.put(MH.A06, Boolean.TRUE.toString());
            getAdEventManager().ACb(this.A0E.A37(), map);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0h(String str) {
        if (this.A0E.A2x() > 0) {
            if (this.A0E.A3I() && this.A0O) {
                return;
            }
            this.A0O = true;
            A0g(str);
            return;
        }
        if (this.A0E.A2N()) {
            A0K();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0i(boolean z11) {
        if (!z11 && A0m()) {
            return;
        }
        this.A0M = z11;
        ObjectAnimator objectAnimatorOfFloat = null;
        if (!z11) {
            this.A08.removeCallbacksAndMessages(null);
        } else {
            this.A01 = 0;
            this.A07 = 0;
            this.A0P = false;
            this.A0Q = false;
            this.A0R = false;
            this.A0O = false;
            A0k(!A0m(), 0);
            A0M();
        }
        if (!this.A0S) {
            postDelayed(new EX(this, z11), 250L);
        }
        String strA0I = A0I(48, 1, 2);
        if (z11) {
            objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.A0K, strA0I, this.A0K.getY(), this.A04 / 5);
        }
        LinearLayout linearLayout = this.A0B;
        float y11 = this.A0B.getY();
        int i5 = this.A04;
        if (z11) {
            i5 /= 5;
        }
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(linearLayout, strA0I, y11, i5);
        objectAnimatorOfFloat2.setDuration(500L);
        if (this.A09 != null) {
            ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(this.A09, strA0I, this.A09.getY(), 0.0f);
            objectAnimatorOfFloat3.setDuration(500L);
            int height = this.A09.getHeight();
            int i11 = this.A04;
            String[] strArr = A0m;
            if (strArr[3].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0m;
            strArr2[6] = "3HcTndNMKO02itZ1YB9OuMlfPHE";
            strArr2[1] = "rUq8gYLqYGWwvrPw2H7I5hxcdAd";
            if (z11) {
                i11 /= 5;
            }
            ValueAnimator duration = ValueAnimator.ofInt(height, i11).setDuration(500L);
            duration.addUpdateListener(new C2704v6(this));
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.setInterpolator(new AccelerateDecelerateInterpolator());
            animatorSet.playTogether(objectAnimatorOfFloat2, objectAnimatorOfFloat3, duration);
            if (objectAnimatorOfFloat != null) {
                objectAnimatorOfFloat.setDuration(500L);
                animatorSet.playTogether(objectAnimatorOfFloat);
            }
            animatorSet.addListener(new C2705v7(this, z11));
            if (this.A0k && (this.A09 instanceof C0799Be)) {
                ((C0799Be) this.A09).A0d(animatorSet, z11);
            }
            animatorSet.start();
        }
    }

    private void A0j(boolean z11) {
        RelativeLayout.LayoutParams layoutParams;
        setupLayoutConfiguration(z11);
        AbstractC2426qc.A0K(this.A09);
        if (this.A09 == null) {
            this.A09 = this.A0J.A02();
            AbstractC2426qc.A0L(this.A09);
        }
        boolean z12 = this.A0M;
        String[] strArr = A0m;
        if (strArr[3].length() == strArr[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0m;
        strArr2[7] = "FZuJEB1DgE";
        strArr2[4] = "ioAK5D";
        if (z12) {
            layoutParams = new RelativeLayout.LayoutParams(-1, this.A04 / 5);
            layoutParams.addRule(14);
            layoutParams.addRule(10);
        } else {
            layoutParams = new RelativeLayout.LayoutParams(-1, -2);
            if (C2203mv.A1J(getAdContextWrapper()) && getResources().getConfiguration().orientation == 2 && !(this.A09 instanceof C0799Be)) {
                layoutParams = new RelativeLayout.LayoutParams(-2, -1);
            }
            layoutParams.addRule(13);
            A0N();
        }
        if (this.A09 != null) {
            this.A09.setTranslationY(0.0f);
            addView(this.A09, 1, layoutParams);
        }
        A0J();
        if (A0m[2].charAt(2) != 'l') {
            String[] strArr3 = A0m;
            strArr3[6] = "pPe40HbQyCL07tY4s4c8j3Lf22g";
            strArr3[1] = "FpZU0oL4KOaHbXLVjTxOhAl2PJv";
            A0U();
            return;
        }
        A0U();
    }

    private void A0k(boolean z11, int i5) {
        if (this.A0G == null || !this.A0j) {
            return;
        }
        this.A0G.setCloseButtonVisibility(z11 ? 0 : 4);
        getAdContextWrapper().A0F().AD6(!z11, i5);
    }

    private boolean A0l() {
        if (this.A0E.A32().A0I().A0B()) {
            boolean z11 = this.A0Y;
            String[] strArr = A0m;
            if (strArr[3].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0m;
            strArr2[7] = "WvW0Ef6T7c";
            strArr2[4] = "9KXIlI";
            if (z11 && !this.A0Z && !this.A0W) {
                return true;
            }
        }
        return false;
    }

    private boolean A0m() {
        return this.A0j && this.A0X;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final EnumC1698ec A1P(String str) {
        return this.A0K.A02(str);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() {
        this.A0a.removeCallbacksAndMessages(null);
        A0L();
        super.A1Q();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1R() {
        AbstractC2452r2 abstractC2452r2A0B = this.A0J.A0B();
        if (abstractC2452r2A0B != null) {
            abstractC2452r2A0B.setPageDetailsVisible((A1j() || abstractC2452r2A0B.A0E()) ? false : true);
        }
        this.A0Y = false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1S() {
        if (this.A0J.A0B() != null) {
            AbstractC2452r2 abstractC2452r2A0B = this.A0J.A0B();
            String[] strArr = A0m;
            if (strArr[6].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0m;
            strArr2[3] = "MMiJw7TNUivh7iTB";
            strArr2[0] = "GEB80";
            abstractC2452r2A0B.setPageDetailsVisible(false);
        }
        this.A0Y = true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1T() {
        this.A0W = false;
        this.A0X = false;
        A0k(true, 3);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1U() {
        this.A0W = this.A0E.A32().A0I().A04() > 0;
        this.A0X = true;
        A0k(false, 2);
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x0033  */
    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        int i5;
        super.A1X(c1735fE, str, d5, bundle);
        this.A0K.setCta(this.A0E.A32().A0K(), this.A0E.A37(), new HashMap<>(), this.A0e);
        String strA0G = c1735fE.A0J().A0G();
        if (strA0G != null) {
            String description = strA0G.trim();
            if (description.length() == 0) {
                AbstractC2426qc.A0P(this.A0C, 8);
                if (C2203mv.A16(this.A0J.A06())) {
                    this.A0C.setClickable(false);
                }
            } else {
                this.A0D.setText(strA0G);
                if (C2203mv.A16(this.A0J.A06())) {
                    LinearLayout linearLayout = this.A0C;
                    String[] strArr = A0m;
                    String str2 = strArr[3];
                    String description2 = strArr[0];
                    if (str2.length() != description2.length()) {
                        A0m[2] = "Tti1ERh3982vMPWOgwyCGNbTUdK6PILe";
                        linearLayout.setClickable(true);
                    } else {
                        A0m[2] = "fnWnWSkw0ES4UX172ZpEF9XfJQ6oKenC";
                        linearLayout.setClickable(true);
                    }
                }
            }
        }
        if (d5 > 0.0d) {
            this.A02 = (int) (this.A05 / d5);
        }
        boolean z11 = this.A0L;
        String[] strArr2 = A0m;
        String str3 = strArr2[6];
        String description3 = strArr2[1];
        if (str3.length() != description3.length()) {
            throw new RuntimeException();
        }
        A0m[2] = "7Lq3s7aOnX5NGbRVe2GBF9HLZ2EE6fpE";
        if (z11) {
            i5 = this.A03;
        } else {
            i5 = this.A02;
        }
        this.A02 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Y(C5Y c5y) {
        this.A0T = false;
        super.A1Y(c5y);
        if (this.A0E.A32().A0L().A05() && !A1j()) {
            A0S();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1e() {
        return !A1j();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1i(boolean z11) {
        if (A1j()) {
            getAdContextWrapper().A0F().AD5();
            A0i(false);
            return true;
        }
        if (A0l()) {
            getAdContextWrapper().A0F().AD9();
            this.A0g.A07(this);
            return true;
        }
        if (this.A0E.A32().A0L().A05()) {
            getAdContextWrapper().A0F().ADA();
            if (this.A09 instanceof C0799Be) {
                C0799Be simpleVideoView = (C0799Be) this.A09;
                simpleVideoView.A0i(true);
            }
            A0S();
            return true;
        }
        getAdContextWrapper().A0F().AD7();
        return false;
    }

    public final boolean A1j() {
        return this.A0M;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00f6  */
    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int getCloseButtonStyle() {
        if (A1j()) {
            return A0m() ? 2 : 3;
        }
        if (this.A0E.A32().A0I().A02() >= 0 && A1e()) {
            if (this.A0E.A3G()) {
                boolean z11 = this.A0T;
                if (A0m[5].charAt(10) != 'N') {
                    String[] strArr = A0m;
                    strArr[6] = "NhzVRhgvHrOwM64xV2PIAOEbNcq";
                    strArr[1] = "xEzMNY3CkayGfsMDFyAKLsf22gx";
                    if (z11 && (this.A09 instanceof C0799Be)) {
                        return 8;
                    }
                }
            }
            if (this.A0W || this.A0Y) {
                return 8;
            }
            boolean z12 = this.A0W;
            if (A0m[5].charAt(10) != 'N') {
            }
        } else {
            boolean z122 = this.A0W;
            if (A0m[5].charAt(10) != 'N') {
                throw new RuntimeException();
            }
            String[] strArr2 = A0m;
            strArr2[6] = "uLLZ3lMHSUiuIxtDkLrux0PASFR";
            strArr2[1] = "4IavHTvooBAwtjEZ8UrgSKatCFD";
            if (z122) {
                return 2;
            }
            boolean zA0B = this.A0E.A32().A0I().A0B();
            if (A0m[5].charAt(10) != 'N') {
                A0m[2] = "Lj4ZofuCG7Hls3ppNpUzlw5AiL4xlXXC";
                if (zA0B) {
                    return 1;
                }
                boolean z13 = this.A0Y;
                String[] strArr3 = A0m;
                if (strArr3[3].length() != strArr3[0].length()) {
                    String[] strArr4 = A0m;
                    strArr4[6] = "DsnS5lLBdCuGc7xyUx4JFV8KtGv";
                    strArr4[1] = "nlKE3CRcsLi8C9cAVjP9wrVa02r";
                    if (z13) {
                        return 4;
                    }
                } else {
                    String[] strArr5 = A0m;
                    strArr5[7] = "CBNB4sFIZp";
                    strArr5[4] = "cwnmYS";
                    if (z13) {
                        return 4;
                    }
                }
                if (this.A0E.A32().A0L().A05()) {
                    return 1;
                }
                return super.getCloseButtonStyle();
            }
        }
        throw new RuntimeException();
    }

    private ViewOnClickListenerC0884El getRegularCtaForEndCard() {
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = new ViewOnClickListenerC0884El(getAdContextWrapper(), this.A0J.A05().A1X(), this.A0E.A31().A01(), getAdEventManager(), this.A0J.A0C(), (C1539c2) null, this.A0J.A0A(), this.A0E.A33());
        viewOnClickListenerC0884El.setViewShowsOverMedia(true);
        AbstractC2426qc.A0L(viewOnClickListenerC0884El);
        viewOnClickListenerC0884El.setText(this.A0E.A32().A0K().A05());
        AbstractC2426qc.A0H(1001, viewOnClickListenerC0884El);
        viewOnClickListenerC0884El.setCta(this.A0E.A32().A0K(), this.A0E.A37(), new HashMap(), null);
        return viewOnClickListenerC0884El;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        A0j(A1j());
        A0V();
        setupLayoutConfiguration(A1j());
        A0T();
        if (this.A0V && Build.VERSION.SDK_INT >= 35) {
            Object parent = getParent();
            if (parent instanceof View) {
                View parentView = (View) parent;
                parentView.setFitsSystemWindows(false);
                parentView.setPadding(0, 0, 0, 0);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBrowserProgressBarValue(int i5) {
        if (this.A0H != null) {
            this.A0H.setProgress(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public void setChainedWatchAndBrowseSkippableStatus(boolean z11) {
        this.A0X = !z11;
        A0k(z11, 4);
    }

    public void setChildChainedAd(boolean z11) {
        this.A0S = z11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setTitleToBrowser(String str) {
        if (this.A0G != null) {
            this.A0G.setTitle(str);
        }
    }

    private void setUpBrowserControls(F4 f42) {
        AbstractC2426qc.A0K(this.A0G);
        this.A0G = new F6(this.A0J.A06(), f42, true, this.A0k);
        if (this.A0j) {
            A0k(false, 1);
        }
        f42.setBrowserNavigationListener(this.A0G.getBrowserNavigationListener());
        AbstractC2426qc.A0L(this.A0G);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.weight = 0.1f;
        this.A0G.setListener(new EZ(this));
        this.A0G.setOnTouchListener(new ViewOnTouchListenerC2702v4(this));
        this.A0B.addView(this.A0G, layoutParams);
        AbstractC2426qc.A0K(this.A0H);
        this.A0H = new C2590tG(this.A0J.A06(), null, 16842872);
        this.A0B.addView(this.A0H, new LinearLayout.LayoutParams(-1, A0n));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setUrlToBrowser(String str) throws SecurityException {
        if (this.A0G != null) {
            this.A0G.setUrl(str);
        }
    }

    private void setupLayoutConfiguration(boolean z11) {
        this.A0L = getResources().getConfiguration().orientation == 2;
        this.A06 = this.A0J.A0B() != null ? this.A0J.A0B().getToolbarHeight() : 0;
        this.A0M = z11;
        this.A03 = Resources.getSystem().getDisplayMetrics().heightPixels;
        this.A05 = Resources.getSystem().getDisplayMetrics().widthPixels;
        Point point = new Point();
        WindowManager windowManager = (WindowManager) getAdContextWrapper().getSystemService(A0I(42, 6, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
        if (windowManager != null) {
            if (Build.VERSION.SDK_INT >= 30) {
                WindowMetrics windowMetrics = windowManager.getCurrentWindowMetrics();
                point.y = windowMetrics.getBounds().bottom - windowMetrics.getBounds().top;
            } else {
                windowManager.getDefaultDisplay().getRealSize(point);
            }
        }
        this.A04 = point.y > 0 ? point.y : this.A03;
        this.A02 = this.A03;
    }
}
