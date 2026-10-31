package com.facebook.ads.redexgen.X;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class EE extends AbstractC2685un {
    public static byte[] A0s;
    public static String[] A0t = {"AGVXtoh3PkDg4VtFRQ7w4ReU2FOJicuR", "v8V5ecUC4l7kvDLo3rWsBZoAUutoteNa", "BtHwen6022bPNq4rTxmHqw2vuEHtomcU", "1of3HBBGlynbeNwJ1wwiGbGhsyDooZsY", "ZrgLH6d44t4h6QrX8eKj7lebmfk1erxm", "uJPSNn81F3ctUoFhbWsXbIhzFAHlVYMh", "1UyHo7P4Umw18OYGXdYDuWYaVQvDYn3T", "cofNkukcWIMmqS3zndFXQsomQAp6TDfi"};
    public static final int A0u;
    public static final int[] A0v;
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public View A04;
    public View A05;
    public ImageView A06;
    public LinearLayout A07;
    public RelativeLayout A08;
    public RelativeLayout A09;
    public C2370pi A0A;
    public F8 A0B;
    public C2590tG A0C;
    public F4 A0D;
    public C2642u6 A0E;
    public C2659uN A0F;
    public C2701v3 A0G;
    public C2735vb A0H;
    public C2250ng A0I;
    public C2190mi A0J;
    public boolean A0K;
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
    public boolean A0a;
    public boolean A0b;
    public boolean A0c;
    public final float A0d;
    public final Handler A0e;
    public final Handler A0f;
    public final View A0g;
    public final View A0h;
    public final InputMethodManager A0i;
    public final AbstractC1701ef A0j;
    public final LA A0k;
    public final C2232nO A0l;
    public final AbstractC0891Es A0m;
    public final InterfaceC2643u7 A0n;
    public final C2689ur A0o;
    public final C2736vc A0p;
    public final Runnable A0q;
    public final boolean A0r;

    public static String A0M(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0s, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 16);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0f() {
        A0s = new byte[]{77, 94, 94, 94, 94, 94, 94, 94, 94, 0, 17, 21, 19, 19, 19, 19, 19, 19, 68, 81, 81, 87, 87, 87, 87, 87, 87, 43, 49, 49, 56, 56, 56, 56, 56, 56, 46, 57, 42, 42, 41, 62, 41, 40, 19, 34, 56, 40, 89, 86, 83, 89, 81, 101, 73, 85, 79, 72, 89, 95, 59, 50, 47, 62, 56, 57, 2, 51, 41, 57, 2, 57, 47, 50, 45, 45, 56, 57, 36, 35, 61, 56, 57, 18, 32, 40, 57, 37, 34, 41, 15, 24, 10, 28, 15, 25, 24, 25, 34, 11, 20, 25, 24, 18, 16, 2, 13, 16, 78, 16, 6, 17, 10, 5, 78, 14, 6, 7, 10, 22, 14, 27, 29, 11, 28, 13, 2, 7, 13, 5, 49, 8, 7, 2, 26, 11, 28, 11, 10, 0};
    }

    static {
        A0f();
        A0u = AbstractC2383pv.A0K;
        A0v = new int[]{Color.parseColor(A0M(0, 9, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE)), Color.parseColor(A0M(9, 9, 51)), Color.parseColor(A0M(18, 9, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE)), Color.parseColor(A0M(27, 9, 24))};
    }

    public EE(C2689ur c2689ur) {
        super(c2689ur, true);
        this.A0U = false;
        this.A0X = false;
        this.A0Y = false;
        this.A0W = false;
        this.A0b = false;
        this.A0Z = false;
        this.A0O = false;
        this.A0Q = false;
        this.A0P = false;
        this.A0N = false;
        this.A03 = 0;
        this.A02 = 0;
        this.A0T = false;
        this.A01 = 0;
        this.A0R = false;
        this.A0a = false;
        this.A0M = false;
        this.A0V = false;
        this.A0f = new Handler(Looper.getMainLooper());
        this.A0K = true;
        this.A0c = false;
        this.A0p = new C2736vc();
        this.A0S = false;
        this.A00 = 1;
        this.A0q = new RunnableC2741vh(this);
        this.A0n = new EG(this);
        this.A0e = new Handler(Looper.getMainLooper());
        this.A0i = (InputMethodManager) c2689ur.A06().getSystemService(A0M(78, 12, 93));
        this.A0o = c2689ur;
        this.A0k = this.A0o.A05();
        this.A0l = new C2232nO(c2689ur.A05().A37(), c2689ur.A07());
        this.A0d = A00(c2689ur);
        this.A0h = this.A0o.A03();
        this.A0j = C1702eg.A01(c2689ur.A06(), c2689ur.A07(), c2689ur.A05().A37(), AbstractC2351pP.A00(c2689ur.A05().A32().A0K().A06()), new HashMap(), false, true, this.A0k.A33());
        String strA08 = c2689ur.A05().A32().A0I().A08();
        if (strA08 != null) {
            AbstractC2668uW.A00(c2689ur.A06(), this, strA08);
        }
        this.A0L = false;
        this.A0g = this.A0o.A02();
        this.A0m = A0F(this.A0o);
        addView(this.A0m);
        AbstractC2426qc.A0L(this.A0m);
        if (A14()) {
            if (Build.VERSION.SDK_INT >= 28) {
                this.A0m.getCTAButton().setTypeface(Typeface.create(Typeface.SANS_SERIF, 600, false));
            } else {
                this.A0m.getCTAButton().setTypeface(Typeface.create(A0M(104, 17, 115), 0));
            }
        }
        this.A0m.getProgressBarAnimation().setShouldClearAnimationWhenVideoCompleted(false);
        A0Z();
        A0W();
        A0X();
        A0d();
        if (this.A0g != null && A17()) {
            this.A0F = A0I((C0799Be) this.A0g);
        }
        this.A0r = c2689ur.A05().A2Y();
        getAdContextWrapper().A0F().AD8(this.A0r, true, c2689ur.A05().A3E());
        if (!(this.A0g instanceof C0799Be)) {
            A0T();
        }
        A0R();
        if (A14() || A19()) {
            A0N();
            this.A0m.bringToFront();
        }
        A0Y();
    }

    private float A00(C2689ur c2689ur) {
        if (this.A0o.A02() instanceof C0799Be) {
            float mAspectRatio = (float) c2689ur.A05().A1F();
            return mAspectRatio;
        }
        String strA08 = this.A0k.A32().A0I().A08();
        if (strA08 != null) {
            float mAspectRatio2 = new C2086kz(c2689ur.A06()).A0M(strA08);
            return mAspectRatio2;
        }
        return -1.0f;
    }

    public static /* synthetic */ int A02(EE ee2) {
        int i5 = ee2.A02;
        ee2.A02 = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int A04(EE ee2) {
        int i5 = ee2.A03;
        ee2.A03 = i5 + 1;
        return i5;
    }

    private AbstractC0891Es A0F(C2689ur c2689ur) {
        AbstractC0891Es abstractC0891EsA03 = new C2669uX(this.A0d, c2689ur.A05().A1X(), c2689ur.A06(), getColors(), c2689ur.A05(), c2689ur.A0C(), getCtaButton(), AbstractC0878Ef.A0H, true, c2689ur.A07(), c2689ur.A0F(), c2689ur.A0A(), c2689ur.A0E(), c2689ur.A08(), true).A03();
        RelativeLayout.LayoutParams adDetailsParams = new RelativeLayout.LayoutParams(-1, -1);
        adDetailsParams.addRule(12);
        abstractC0891EsA03.setVisibility(8);
        abstractC0891EsA03.setLayoutParams(adDetailsParams);
        if (c2689ur.A0G() != null) {
            abstractC0891EsA03.setChainedAdInfo(c2689ur.A0G());
        }
        return abstractC0891EsA03;
    }

    private C2659uN A0I(C0799Be c0799Be) {
        return new C2659uN(this.A0o, this.A0k, c0799Be, this.A0o.A0C(), new EI(this), this.A0h, this.A0m, this.A07);
    }

    private void A0N() {
        this.A05 = AbstractC2426qc.A0B(getContext(), A0v);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-1, (int) (getHeightPixels() * 0.4f));
        params.addRule(12);
        addView(this.A05, params);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0O() {
        if (this.A0c && this.A0H != null) {
            this.A0H.A0C();
            C2735vb c2735vb = this.A0H;
            String[] strArr = A0t;
            if (strArr[4].charAt(22) != strArr[0].charAt(22)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0t;
            strArr2[4] = "3jR24EieCyhXKVAt3xW1B8eKuSm7u5QJ";
            strArr2[0] = "ru8fYMuE5mZ8rwAAJZ1yXHeZOhOPLiFY";
            c2735vb.A0B();
            this.A0H = null;
            this.A0c = false;
            return;
        }
        if (this.A0D != null) {
            this.A0D.destroy();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0P() {
        if (!this.A0M) {
            return;
        }
        this.A0M = false;
        if (this.A0V) {
            this.A0V = false;
            A0v(A0M(36, 12, 92));
        } else {
            A0v(A0M(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 18, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        }
    }

    private void A0Q() {
        if (!this.A0M) {
            return;
        }
        this.A0M = false;
        if (this.A0V) {
            this.A0V = false;
            A0v(A0M(60, 18, 77));
        } else {
            if (!this.A0k.A2O()) {
                return;
            }
            Map<String, String> mapA07 = new C2618ti().A05(null).A04(null).A07();
            mapA07.put(A0M(48, 12, 42), A0M(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 18, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
            getAdEventManager().ABr(this.A0k.A37(), mapA07);
        }
    }

    private void A0R() {
        if (A19() || !A1A()) {
            return;
        }
        EnumC2275o7 enumC2275o7A00 = EnumC2275o7.A00(this.A0k.A1a());
        EnumC2275o7 endCardType = EnumC2275o7.A07;
        if (enumC2275o7A00 == endCardType) {
            return;
        }
        this.A06 = new ImageView(this.A0o.A06());
        addView(this.A06);
        this.A06.setVisibility(4);
        String strA08 = this.A0k.A32().A0I().A08();
        if (strA08 != null) {
            new AsyncTaskC0892Et(this.A06, this.A0o.A06()).A04().A06(new EH(this)).A07(strA08);
        }
    }

    private void A0S() {
        AbstractC2452r2 abstractC2452r2A0B = this.A0o.A0B();
        if (abstractC2452r2A0B == null) {
            return;
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10);
        layoutParams.setMargins(AbstractC2383pv.A0V, AbstractC2383pv.A0P, 0, 0);
        addView(abstractC2452r2A0B, layoutParams);
        abstractC2452r2A0B.bringToFront();
        if (this.A0k.A1P() > 0) {
            abstractC2452r2A0B.setToolbarActionMode(2);
        }
    }

    private void A0T() {
        this.A0o.A06().A0F().AM1(AbstractC2361pZ.A00(this.A0d), getResources().getConfiguration().orientation, false, this.A0o.A0G() != null, AbstractC1701ef.A0C());
        this.A09 = new RelativeLayout(this.A0o.A06());
        this.A08 = new RelativeLayout(this.A0o.A06());
        if (this.A0g != null) {
            AbstractC2426qc.A0e(this.A0g);
            this.A08.addView(this.A0g);
        }
        this.A09.addView(this.A08, new RelativeLayout.LayoutParams(-2, -2));
        AbstractC2426qc.A0L(this.A08);
        addView(this.A09, new RelativeLayout.LayoutParams(-1, -1));
        AbstractC2426qc.A0L(this.A09);
        A0g(getResources().getConfiguration().orientation);
        this.A0m.setVisibility(0);
        A11(this.A0L, false);
        this.A0m.A0u(getResources().getConfiguration().orientation);
        this.A0m.bringToFront();
    }

    private void A0U() {
        AbstractC2452r2 abstractC2452r2A0B;
        if (!this.A0c) {
            return;
        }
        this.A0p.A01(this.A0g);
        this.A0o.A06().A0F().A5E(EnumC2299oW.A03.name());
        this.A0L = false;
        AbstractC2426qc.A0K(this.A04);
        this.A04 = null;
        this.A0e.removeCallbacksAndMessages(null);
        if (this.A0g != null) {
            this.A0g.setY(0.0f);
            this.A0g.getLayoutParams().height = getHeightPixels();
            this.A0g.requestLayout();
        }
        A11(false, true);
        A0O();
        if (!this.A0T && (abstractC2452r2A0B = this.A0o.A0B()) != null) {
            abstractC2452r2A0B.setPageDetailsVisible(true ^ abstractC2452r2A0B.A0E());
            abstractC2452r2A0B.setToolbarActionMode(getCloseButtonStyle());
        }
    }

    private void A0V() {
        AbstractC2452r2 abstractC2452r2A0B;
        if (this.A0o.A05().A2p() && (abstractC2452r2A0B = this.A0o.A0B()) != null) {
            abstractC2452r2A0B.setProgressSpinnerInvisible(false);
        }
    }

    private void A0W() {
        AbstractC2426qc.A0K(this.A07);
        this.A07 = new LinearLayout(this.A0o.A06());
        this.A07.setOrientation(1);
        AbstractC2426qc.A0L(this.A07);
        A11(this.A0L, false);
        this.A07.setBackgroundColor(-1);
        addView(this.A07);
    }

    private void A0X() {
        if (this.A0o.A05().A2E() && this.A0j != null && AbstractC2361pZ.A03(this.A0d)) {
            this.A0E = new C2642u6(this.A0o.A06(), this.A0o.A0C(), this.A0o.A05().A1G(), this.A0j, this.A0m.getCTAButton(), this.A0m);
            addView(this.A0E.getBrowserPeekView());
            this.A0f.postDelayed(new RunnableC2740vg(this), 5900L);
        }
    }

    private void A0Y() {
        if (A14() && this.A0o.A0B() != null) {
            this.A0J = new C2190mi(this.A0o.A06(), this.A0k, this.A0o.A07(), this.A0o.A0F(), this.A0o.A0A(), this.A0o.A0C(), this.A0o.A0B(), this.A0l);
            this.A0J.A0q(getRegularCtaForEndCard());
        }
    }

    private void A0Z() {
        if (this.A0g != null && this.A0k.A2O()) {
            this.A0g.setOnClickListener(new ViewOnClickListenerC2743vj(this));
        }
        AbstractC2426qc.A0K(this.A0g);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        if (this.A0g != null) {
            addView(this.A0g, layoutParams);
            AbstractC2426qc.A0L(this.A0g);
        }
        if (C2203mv.A16(this.A0o.A06())) {
            View.OnClickListener onClickListener = new ViewOnClickListenerC2744vk(this);
            this.A0m.setCTAClickListener(onClickListener);
            if (this.A0o.A0B() != null) {
                View.OnClickListener onClickListener2 = new ViewOnClickListenerC2745vl(this);
                this.A0o.A0B().setCTAClickListener(onClickListener2);
            }
        }
        if (this.A0g != null) {
            if (C2203mv.A1L(getAdContextWrapper())) {
                AbstractC2621tl.A00(this.A0g, C2203mv.A1M(getAdContextWrapper()), new ViewOnClickListenerC2746vm(this));
            } else {
                if (!C2203mv.A1J(getAdContextWrapper())) {
                    return;
                }
                AbstractC2621tl.A00(this.A0g, C2203mv.A1K(getAdContextWrapper()), new ViewOnClickListenerC2747vn(this));
            }
        }
    }

    private void A0a() {
        if (this.A0h != null) {
            AbstractC2426qc.A0K(this.A0h);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(AbstractC2685un.A0B, AbstractC2685un.A0B);
            layoutParams.setMargins(AbstractC2383pv.A0A, AbstractC2383pv.A0P, AbstractC2383pv.A0A, AbstractC2383pv.A06);
            layoutParams.addRule(9);
            layoutParams.addRule(10);
            addView(this.A0h, layoutParams);
        }
    }

    private void A0b() {
        AbstractC2452r2 abstractC2452r2A0B = this.A0o.A0B();
        if (abstractC2452r2A0B == null) {
            return;
        }
        abstractC2452r2A0B.setPageDetailsVisible((this.A0L || abstractC2452r2A0B.A0E()) ? false : true);
    }

    private void A0c() {
        if (this.A0L) {
            A0O();
        }
        this.A0m.A0o();
        AbstractC2426qc.A0e(this.A0F, this.A0B, this.A07, this.A0h, this.A0m, this.A0g, this.A0o.A0E(), this.A09, this.A08, this.A0o.A0B(), this.A05);
        if (this.A0g != null && A17()) {
            C0799Be c0799Be = (C0799Be) this.A0g;
            Iterator<InterfaceC1663e3> it = c0799Be.getPlugins().iterator();
            while (true) {
                boolean zHasNext = it.hasNext();
                String[] strArr = A0t;
                if (strArr[4].charAt(22) == strArr[0].charAt(22)) {
                    String[] strArr2 = A0t;
                    strArr2[7] = "yZ10c6Yac1T0rkhwJfck3t4MdeCujGfA";
                    strArr2[3] = "4c1aFxUqZNmND3bGTYZM7gtJulQZgWfT";
                    if (!zHasNext) {
                        break;
                    }
                    InterfaceC1663e3 next = it.next();
                    if (next instanceof AnonymousClass51) {
                        c0799Be.A0h(next);
                        break;
                    }
                } else {
                    throw new RuntimeException();
                }
            }
        }
        if (this.A0J != null && this.A0J.A0d() != null) {
            this.A0J.A0s(true);
            this.A0J.A0i();
            this.A0J.A0p(getRegularCtaForEndCard());
            this.A0J.A0j();
            this.A0J.A0h();
            if (this.A0k.A1P() > 0) {
                this.A0J.A0n(this.A0k.A1P(), new InterfaceC2140lt() { // from class: com.facebook.ads.redexgen.X.EN
                    @Override // com.facebook.ads.redexgen.X.InterfaceC2140lt
                    public final void AEy() {
                        this.A00.A1j();
                    }
                });
            }
            this.A00 = 2;
            addView(this.A0J.A0d());
        }
        A0S();
    }

    private void A0d() {
        if (!this.A0W) {
            A0a();
        }
        A0b();
    }

    private void A0e() {
        C0781Am c0781AmA0E = this.A0o.A0E();
        if (c0781AmA0E == null) {
            return;
        }
        int videoDuration = this.A0g != null ? ((C0799Be) this.A0g).getDuration() : 0;
        if (c0781AmA0E.getCustomDuration() > videoDuration) {
            c0781AmA0E.setCustomDuration(videoDuration);
        }
    }

    private void A0g(int i5) {
        ViewGroup viewGroup;
        RelativeLayout adjacentView;
        if ((this.A0J != null && this.A0J.A0u()) || this.A0g == null) {
            return;
        }
        if (A17()) {
            viewGroup = (ViewGroup) this.A0g;
            adjacentView = (RelativeLayout) ((C0799Be) this.A0g).getVideoView();
            ((C0799Be) this.A0g).A0a(i5);
        } else {
            A0h(i5);
            viewGroup = this.A09;
            adjacentView = this.A08;
        }
        if (viewGroup != null) {
            A0j(i5, viewGroup, adjacentView);
        }
    }

    private void A0h(int i5) {
        if (this.A0g == null || this.A08 == null) {
            return;
        }
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.A0g.getLayoutParams();
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
            if (AbstractC2361pZ.A05(this.A0d)) {
                layoutParams.addRule(13);
                layoutParams.addRule(14);
                RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.A08.getLayoutParams();
                layoutParams2.addRule(14);
                this.A08.setLayoutParams(layoutParams2);
            } else {
                layoutParams.addRule(9);
            }
        }
        this.A0g.setLayoutParams(layoutParams);
    }

    private void A0i(int i5) {
        if (this.A0h != null) {
            RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.A0h.getLayoutParams();
            layoutParams.setMargins(AbstractC2383pv.A0A, i5, AbstractC2383pv.A0A, AbstractC2383pv.A06);
            this.A0h.setLayoutParams(layoutParams);
        }
    }

    private final void A0j(int i5, ViewGroup viewGroup, RelativeLayout relativeLayout) {
        ImageView iconView;
        if (relativeLayout == null) {
            return;
        }
        AbstractC2426qc.A0K(this.A0m);
        if ((this.A0m instanceof C06986q) || (this.A0m instanceof C06976p)) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
            if (getResources().getConfiguration().orientation == 2) {
                layoutParams.addRule(1, relativeLayout.getId());
                this.A0m.setLayoutParams(layoutParams);
                viewGroup.addView(this.A0m);
            } else {
                addView(this.A0m, layoutParams);
            }
        } else if (this.A0m instanceof C06966o) {
            RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
            layoutParams2.addRule(12);
            this.A0m.setLayoutParams(layoutParams2);
            addView(this.A0m, layoutParams2);
        }
        this.A0m.A0l(i5);
        this.A0m.A0y(viewGroup, relativeLayout, i5);
        if (A14() && (iconView = this.A0m.getIconView()) != null) {
            int iconSize = AbstractC2383pv.A04;
            ViewGroup.LayoutParams layoutParams3 = iconView.getLayoutParams();
            layoutParams3.width = iconSize;
            layoutParams3.height = iconSize;
            iconView.setLayoutParams(layoutParams3);
        }
    }

    private void A0k(ViewGroup viewGroup, View view, int i5) {
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) viewGroup.getLayoutParams();
        RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) view.getLayoutParams();
        layoutParams.width = -1;
        layoutParams.height = -1;
        if (i5 == 1) {
            layoutParams2.width = -1;
            layoutParams2.height = -2;
        } else {
            layoutParams2.width = -2;
            layoutParams2.height = -1;
        }
        layoutParams2.removeRule(14);
        viewGroup.setLayoutParams(layoutParams);
        view.setLayoutParams(layoutParams2);
        A0g(i5);
    }

    private void A0l(ViewGroup viewGroup, View view, AbstractC2452r2 abstractC2452r2, int i5) {
        AbstractC2426qc.A0e(this.A07);
        AbstractC2426qc.A0K(abstractC2452r2);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10);
        layoutParams.setMargins(AbstractC2383pv.A0V, AbstractC2383pv.A0P, 0, 0);
        RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) viewGroup.getLayoutParams();
        RelativeLayout.LayoutParams toolbarParams = (RelativeLayout.LayoutParams) view.getLayoutParams();
        layoutParams2.width = -1;
        layoutParams2.height = -1;
        if (i5 == 1) {
            toolbarParams.width = -1;
            toolbarParams.height = -2;
        } else {
            toolbarParams.width = -2;
            toolbarParams.height = -1;
        }
        toolbarParams.removeRule(14);
        viewGroup.setLayoutParams(layoutParams2);
        view.setLayoutParams(toolbarParams);
        this.A0m.A0z(viewGroup, false, false, this.A07.getId());
        A0g(i5);
        viewGroup.addView(abstractC2452r2, layoutParams);
    }

    private void A0m(ViewGroup viewGroup, View view, AbstractC2452r2 abstractC2452r2, int i5) {
        AbstractC2426qc.A0K(this.A07);
        AbstractC2426qc.A0K(abstractC2452r2);
        AbstractC2426qc.A0K(this.A0m);
        boolean zA05 = AbstractC2361pZ.A05(this.A0d);
        boolean z11 = i5 == 1;
        RelativeLayout.LayoutParams browserLayoutParam = new RelativeLayout.LayoutParams(-1, -2);
        browserLayoutParam.addRule(10);
        if (!this.A0k.A3S() || i5 != 2 || !zA05) {
            A0i(AbstractC2383pv.A0P);
            browserLayoutParam.setMargins(AbstractC2383pv.A0V, AbstractC2383pv.A0P, 0, 0);
        } else {
            browserLayoutParam.setMargins(AbstractC2383pv.A0V, AbstractC2383pv.A0C, 0, 0);
            A0i(AbstractC2383pv.A0C);
        }
        RelativeLayout.LayoutParams parentLayoutParam = (RelativeLayout.LayoutParams) viewGroup.getLayoutParams();
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) view.getLayoutParams();
        layoutParams.removeRule(14);
        layoutParams.removeRule(9);
        RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.A07.getLayoutParams();
        layoutParams2.removeRule(3);
        layoutParams2.removeRule(1);
        boolean isBrowserBelowMediaView = z11 || zA05;
        if (isBrowserBelowMediaView) {
            parentLayoutParam.height = getHeightPixels() / 4;
            String[] strArr = A0t;
            if (strArr[7].charAt(4) == strArr[3].charAt(4)) {
                throw new RuntimeException();
            }
            A0t[5] = "GcR10gYvjJufHK8wE9xT2fhTQ5wAwmNO";
            layoutParams.height = getHeightPixels() / 4;
            layoutParams.addRule(14);
            layoutParams2.addRule(3, viewGroup.getId());
        } else {
            if (this.A0g != null && A17()) {
                ((C0799Be) this.A0g).A0a(i5);
            } else {
                A0h(i5);
            }
            parentLayoutParam.height = -1;
            layoutParams.height = -1;
            layoutParams.addRule(9);
            layoutParams2.addRule(1, view.getId());
        }
        parentLayoutParam.addRule(9);
        parentLayoutParam.addRule(10);
        viewGroup.setLayoutParams(parentLayoutParam);
        layoutParams.width = -2;
        view.setLayoutParams(layoutParams);
        layoutParams2.width = -1;
        layoutParams2.height = -1;
        layoutParams2.setMargins(0, 0, 0, 0);
        this.A07.setLayoutParams(layoutParams2);
        int id2 = this.A07.getId();
        if (isBrowserBelowMediaView) {
            addView(this.A07);
            addView(abstractC2452r2, browserLayoutParam);
        } else if (!this.A0c) {
            viewGroup.addView(this.A07);
            browserLayoutParam.addRule(0, this.A07.getId());
            viewGroup.addView(abstractC2452r2, browserLayoutParam);
        } else {
            AbstractC2426qc.A0K(this.A04);
            this.A04 = new View(this.A0o.A06());
            AbstractC2426qc.A0L(this.A04);
            RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(0, -1);
            layoutParams3.addRule(1, view.getId());
            viewGroup.addView(this.A04, layoutParams3);
            id2 = this.A04.getId();
            browserLayoutParam.addRule(0, id2);
            viewGroup.addView(abstractC2452r2, browserLayoutParam);
        }
        this.A0m.A0z(viewGroup, true, zA05, id2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00d1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void A0u(String str) {
        F4 f42;
        EnumC2303oa enumC2303oaA00 = EnumC2303oa.A00(this.A0k.A1V());
        EnumC2299oW enumC2299oWA00 = C2301oY.A00(enumC2303oaA00, this.A0o.A06());
        this.A0o.A06().A0F().A5G(enumC2303oaA00.name(), enumC2299oWA00.name());
        if (enumC2299oWA00 == EnumC2299oW.A03 && A1O(str)) {
            this.A0o.A06().A0F().A5F(EnumC2299oW.A03.name());
            return;
        }
        this.A0o.A06().A0F().A5F(EnumC2299oW.A05.name());
        AbstractC2426qc.A0K(this.A0D);
        EM em2 = new EM(this);
        if (this.A0o.A06().A0E() == null) {
            this.A0o.A06().A0F().AAZ();
        }
        C0958Hi c0958HiA06 = this.A0o.A06();
        String[] strArr = A0t;
        if (strArr[6].charAt(28) != strArr[1].charAt(28)) {
            String[] strArr2 = A0t;
            strArr2[6] = "duHWU7g9CrFUqxmNylrFowoIalCh8Cee";
            strArr2[1] = "ABLb8J6gJ7WVfHK98jLXiyYXstqYXhDQ";
            if (!AbstractC2204mw.A02(c0958HiA06)) {
                Activity activityA0E = this.A0o.A06().A0E();
                if (A0t[2].charAt(10) != 'b') {
                    throw new RuntimeException();
                }
                A0t[2] = "SLTjDG00RRbdKM7keZgMM2SDWloAMvHz";
                if (activityA0E == null) {
                    f42 = new F4(this.A0o.A06(), em2);
                } else {
                    f42 = new F4(this.A0o.A06(), this.A0o.A06().A0E(), em2);
                }
            }
            this.A0D = f42;
            this.A0D.setOnTouchListener(new ViewOnTouchListenerC2737vd(this));
            setUpBrowserControls(this.A0D);
            this.A07.addView(this.A0D, new LinearLayout.LayoutParams(-1, -1));
            this.A0D.loadUrl(str);
            return;
        }
        throw new RuntimeException();
    }

    private void A0v(String str) {
        Map<String, String> mapA07 = new C2618ti().A05(null).A04(null).A02(this.A0o.A06(), this.A0j).A07();
        mapA07.put(A0M(48, 12, 42), str);
        this.A0l.A04(EnumC2231nN.A0J, mapA07);
        this.A0o.A0C().A5C(this.A0k.A1X());
        getAdEventManager().ACA(this.A0k.A37(), mapA07);
        if (C2203mv.A2W(this.A0o.A06())) {
            HashMap map = new HashMap();
            map.put(MH.A04, Boolean.TRUE.toString());
            map.put(MH.A05, Boolean.TRUE.toString());
            map.put(MH.A06, Boolean.TRUE.toString());
            getAdEventManager().ACb(this.A0k.A37(), map);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0w(String str) {
        if (this.A0k.A2x() > 0) {
            if (this.A0k.A3I() && this.A0N) {
                return;
            }
            this.A0N = true;
            A0v(str);
            return;
        }
        if (this.A0k.A2N() || this.A0M) {
            A0P();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0x(String str) {
        if (!this.A0L) {
            this.A0m.getCTAButton().A0E(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0y(boolean z11) {
        if (!z11 && A18()) {
            return;
        }
        this.A0L = z11;
        if (z11) {
            this.A02 = 0;
            this.A03 = 0;
            this.A0O = false;
            this.A0P = false;
            this.A0Q = false;
            this.A0N = false;
            A10(!A18(), 0);
            A0V();
        } else {
            this.A0e.removeCallbacksAndMessages(null);
        }
        if (!this.A0T) {
            postDelayed(new EK(this, z11), 250L);
        }
        LinearLayout linearLayout = this.A07;
        float y11 = this.A07.getY();
        float heightPixels = getHeightPixels();
        if (z11) {
            heightPixels /= 4.0f;
        }
        String strA0M = A0M(139, 1, 105);
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(linearLayout, strA0M, y11, heightPixels);
        objectAnimatorOfFloat.setDuration(500L);
        if (this.A0g != null) {
            ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.A0g, strA0M, this.A0g.getY(), 0.0f);
            objectAnimatorOfFloat2.setDuration(500L);
            int height = this.A0g.getHeight();
            int heightPixels2 = getHeightPixels();
            if (z11) {
                heightPixels2 /= 4;
            }
            ValueAnimator duration = ValueAnimator.ofInt(height, heightPixels2).setDuration(500L);
            duration.addUpdateListener(new C2738ve(this));
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.setInterpolator(new AccelerateDecelerateInterpolator());
            animatorSet.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat2, duration);
            animatorSet.addListener(new C2739vf(this, z11));
            if (this.A0g instanceof C0799Be) {
                ((C0799Be) this.A0g).A0d(animatorSet, z11);
            }
        }
        A11(this.A0L, true);
        if (!z11) {
            A0O();
        }
    }

    private void A0z(boolean z11) {
        RelativeLayout relativeLayoutA0d;
        Iterator<InterfaceC1663e3> it;
        this.A0W = true;
        if (this.A0L) {
            A0O();
        }
        this.A0m.A0o();
        View[] viewArr = new View[11];
        viewArr[0] = this.A0F;
        viewArr[1] = this.A0B;
        viewArr[2] = this.A07;
        viewArr[3] = this.A0h;
        viewArr[4] = this.A0m;
        viewArr[5] = this.A0g;
        viewArr[6] = this.A0o.A0E();
        viewArr[7] = this.A09;
        String[] strArr = A0t;
        if (strArr[4].charAt(22) != strArr[0].charAt(22)) {
            throw new RuntimeException();
        }
        A0t[5] = "gUBPHpCanlmtDCDShoTlGSh09vi81A2Z";
        viewArr[8] = this.A08;
        viewArr[9] = this.A0o.A0B();
        if (this.A0J != null) {
            relativeLayoutA0d = this.A0J.A0d();
        } else {
            relativeLayoutA0d = null;
        }
        viewArr[10] = relativeLayoutA0d;
        AbstractC2426qc.A0e(viewArr);
        if (this.A0E != null) {
            this.A0E.A0B();
        }
        AbstractC2426qc.A0X(this);
        if (this.A06 != null) {
            this.A06.setVisibility(0);
        }
        if (Build.VERSION.SDK_INT >= 35) {
            Object parent = getParent();
            if (parent instanceof View) {
                View view = (View) parent;
                view.setFitsSystemWindows(false);
                view.setPadding(0, 0, 0, 0);
            }
        }
        if (this.A0g != null && A17()) {
            C0799Be c0799Be = (C0799Be) this.A0g;
            String[] strArr2 = A0t;
            if (strArr2[7].charAt(4) != strArr2[3].charAt(4)) {
                A0t[2] = "myajPBZLjObeb12Orl0XsPHwEbhrKJnv";
                it = c0799Be.getPlugins().iterator();
            } else {
                it = c0799Be.getPlugins().iterator();
            }
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
        if (A19()) {
            this.A0I = new C2250ng(this.A0o.A06(), this.A0k, this.A0l, this.A0o.A07(), this.A0o.A0F(), this.A0o.A0A(), this.A0o.A0C());
            addView(this.A0I.A0H(getRegularCtaForEndCard()));
        } else {
            this.A0G = new C2701v3(this.A0o.A06(), this.A0k, this.A0l, this.A0f, this.A0o.A0C());
            this.A0G.A0K(z11);
            addView(this.A0G.A0E(getRegularCtaForEndCard()));
        }
        if (!z11) {
            if (this.A0o.A0B() != null) {
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
                layoutParams.addRule(10);
                layoutParams.setMargins(AbstractC2383pv.A0V, AbstractC2383pv.A0P, 0, 0);
                addView(this.A0o.A0B(), layoutParams);
                this.A0o.A0B().bringToFront();
            }
            this.A0K = true;
            if (this.A0o.A0D() != null) {
                this.A0o.A0D().AH3(true);
                if (this.A0o.A0B() != null && this.A0o.A05().A32().A0L().A00() > 0) {
                    this.A0K = false;
                    if (this.A0o.A05().A3N()) {
                        this.A0o.A0B().setToolbarActionMode(8);
                    } else {
                        this.A0o.A0B().setToolbarActionMode(2);
                    }
                    new Handler(Looper.getMainLooper()).postDelayed(new RunnableC2742vi(this), this.A0o.A05().A32().A0L().A00());
                }
            }
        }
    }

    private void A10(boolean z11, int i5) {
        if (this.A0B != null && this.A0r) {
            this.A0B.setCloseButtonVisibility(4);
            getAdContextWrapper().A0F().AD6(!z11, i5);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A11(boolean z11, boolean z12) {
        AbstractC2452r2 abstractC2452r2A0B;
        if (A16() || (abstractC2452r2A0B = this.A0o.A0B()) == null) {
            return;
        }
        ViewGroup parentView = getParentView();
        View containerView = getContainerView();
        if (parentView == null || containerView == null) {
            return;
        }
        int i5 = getResources().getConfiguration().orientation;
        if (z11) {
            A0m(parentView, containerView, abstractC2452r2A0B, i5);
        } else if (z12) {
            A0l(parentView, containerView, abstractC2452r2A0B, i5);
        } else {
            A0k(parentView, containerView, i5);
        }
    }

    private boolean A12() {
        return this.A0k.A32().A0I().A0B() && this.A0Y && !this.A0Z && !this.A0X;
    }

    private boolean A13() {
        return A1f() && this.A00 == 1;
    }

    private boolean A14() {
        return !this.A0k.A1g().isEmpty();
    }

    private boolean A15() {
        return this.A0J != null && this.A0J.A0t();
    }

    private boolean A16() {
        if (this.A0g != null) {
            if (A17()) {
                boolean z11 = this.A0a;
                if (A0t[5].charAt(22) != 'h') {
                    throw new RuntimeException();
                }
                String[] strArr = A0t;
                strArr[6] = "RkFhA24zVBAjVRFGxpN6PiMSqalISAFk";
                strArr[1] = "m7GjILWYOwLzdBXJfFmG74Yvfe255Hki";
                if (!z11) {
                }
            }
            return false;
        }
        return true;
    }

    private boolean A17() {
        return this.A0g != null && (this.A0g instanceof C0799Be);
    }

    private boolean A18() {
        return this.A0r;
    }

    private boolean A19() {
        return EnumC2275o7.A00(this.A0k.A1a()) == EnumC2275o7.A06;
    }

    private boolean A1A() {
        if (A14() && this.A00 == 2 && (A1l() || this.A0S)) {
            return false;
        }
        return (this.A0k.A32().A0W() && this.A0k.A32().A0L().A05()) || this.A0k.A2H() || A19();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean A1O(String str) throws SecurityException {
        boolean z11;
        int i5;
        boolean isPortrait = getResources().getConfiguration().orientation == 1;
        if (!isPortrait) {
            boolean isPortrait2 = AbstractC2361pZ.A05(this.A0d);
            z11 = isPortrait2;
        }
        if (z11) {
            int heightPixels = getHeightPixels() * 3;
            if (A0t[5].charAt(22) != 'h') {
                throw new RuntimeException();
            }
            String[] strArr = A0t;
            strArr[7] = "Crgd0dU5LumHlE8IXQgh7W2Xhdhb9e2B";
            strArr[3] = "Nt1dZrrFQSL9RQOat5k1fLtygIJp3z4T";
            i5 = heightPixels / 4;
        } else {
            i5 = 0;
        }
        int browserWidthPx = 0;
        String[] strArr2 = A0t;
        if (strArr2[4].charAt(22) != strArr2[0].charAt(22)) {
            if (!z11) {
                browserWidthPx = getResources().getDisplayMetrics().widthPixels - ((int) (r2.heightPixels * this.A0d));
            }
        } else {
            String[] strArr3 = A0t;
            strArr3[4] = "gwm2uejQdnNQppIN21A8o0ea47NUoYct";
            strArr3[0] = "bCng9I7ViRLXIMDVVIDLOuemaTLSx4Wj";
            if (!z11) {
            }
        }
        C2735vb c2735vb = new C2735vb(this.A0o.A06(), new EL(this));
        boolean isPortrait3 = c2735vb.A0D(str, i5, browserWidthPx);
        if (!isPortrait3) {
            return false;
        }
        this.A0c = true;
        boolean isPortrait4 = this.A0S;
        if (!isPortrait4) {
            this.A0S = true;
        }
        this.A0H = c2735vb;
        this.A07.setVisibility(8);
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final EnumC1698ec A1P(String str) {
        EnumC1698ec enumC1698ec = EnumC1698ec.A08;
        if (!A1l()) {
            if (this.A0I != null && this.A0I.A0I() != null) {
                return this.A0I.A0I().A0E(str);
            }
            if (this.A0G != null && this.A0G.A0G() != null) {
                return this.A0G.A0G().A0E(str);
            }
            return getCtaButton().A0E(str);
        }
        return enumC1698ec;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() {
        A0O();
        A0Q();
        if (this.A0A != null) {
            C2370pi c2370pi = this.A0A;
            if (A0t[5].charAt(22) != 'h') {
                throw new RuntimeException();
            }
            String[] strArr = A0t;
            strArr[7] = "52i9e8WETLkhgF5KIajKbsjk1ZrFL9ol";
            strArr[3] = "ALVaF5qKspwcwo7KpGqq8CqLS8STRwIj";
            c2370pi.A06();
        }
        this.A0f.removeCallbacksAndMessages(null);
        this.A0m.A0j();
        if (this.A0G != null) {
            this.A0G.A0H();
        }
        if (this.A0I != null) {
            this.A0I.A0J();
        }
        if (this.A0E != null) {
            this.A0E.A0B();
            this.A0E = null;
        }
        if (this.A0J != null) {
            this.A0J.A0e();
        }
        super.A1Q();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1R() {
        AbstractC2452r2 abstractC2452r2A0B = this.A0o.A0B();
        if (abstractC2452r2A0B != null) {
            abstractC2452r2A0B.setPageDetailsVisible((A1l() || abstractC2452r2A0B.A0E()) ? false : true);
        }
        this.A0Y = false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1S() {
        if (this.A0o.A0B() != null) {
            this.A0o.A0B().setPageDetailsVisible(false);
        }
        String[] strArr = A0t;
        if (strArr[4].charAt(22) != strArr[0].charAt(22)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0t;
        strArr2[6] = "pWoqUfOIG2HtinuKZOs1EcJfzQMTaK7r";
        strArr2[1] = "zjDaVmJy4rpH5tBYAZ81TYkepPBNxFtJ";
        this.A0Y = true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1T() {
        this.A0X = false;
        if (this.A0k.A3G() && !A17()) {
            int persistentForcedNtdPlays = this.A0k.A32().A0I().A04();
            int unskippableSeconds = this.A0k.A30();
            this.A0R = true;
            this.A0A = new C2370pi(persistentForcedNtdPlays * unskippableSeconds, new EJ(this));
            this.A0A.A07();
        }
        A10(true, 3);
        this.A0m.A0n();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1U() {
        this.A0X = this.A0k.A32().A0I().A04() > 0;
        A10(false, 2);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1V() {
        this.A0M = true;
        this.A0V = true;
        if (!this.A0L && this.A0j != null) {
            A0u(((C07297v) this.A0j).A0O().toString());
            A0y(true);
        }
        InterfaceC2684um ntdHideCallback = getNtdHideCallback();
        if (A0t[5].charAt(22) != 'h') {
            throw new RuntimeException();
        }
        A0t[5] = "xAQkdeCOSEKwr3lN6vkAoAhJxWpMRcOM";
        if (ntdHideCallback != null) {
            getNtdHideCallback().AEO(this.A0g);
        }
        if (this.A0k.A1N() >= 0) {
            this.A0e.postDelayed(this.A0q, this.A0k.A1N());
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1W(int i5) {
        if (this.A0k.A1c().equals(A0M(90, 14, 109))) {
            this.A0m.A0s(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1X(C1735fE c1735fE, String str, double d5, Bundle bundle) {
        super.A1X(c1735fE, str, d5, bundle);
        this.A0m.setInfo(c1735fE.A0J(), c1735fE.A0K(), str, this.A0k.A35().A01(), this.A0o.A09(), this.A0n);
        this.A0m.getCTAButton().setIsInAppBrowser(true);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Y(C5Y c5y) {
        super.A1Y(c5y);
        if (A13()) {
            A0c();
        } else if (A1A() && !A1l()) {
            A0z(true);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Z(BD bd2) {
        super.A1Z(bd2);
        this.A0o.A06().A0F().AM1(AbstractC2361pZ.A00(this.A0d), getResources().getConfiguration().orientation, true, false, AbstractC1701ef.A0C());
        this.A0a = true;
        A0g(getResources().getConfiguration().orientation);
        this.A0m.setVisibility(0);
        A11(this.A0L, false);
        this.A0m.A0u(getResources().getConfiguration().orientation);
        this.A0m.bringToFront();
        A0e();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1a(C5V c5v, int i5) {
        super.A1a(c5v, i5);
        this.A01 = i5;
        int duration = this.A0g != null ? ((C0799Be) this.A0g).getDuration() : 0;
        int videoDuration = c5v.A00();
        this.A0m.A0s(((duration * i5) + videoDuration) / 1000);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1b(boolean z11) {
        super.A1b(z11);
        if (this.A0A != null) {
            this.A0A.A06();
        }
        this.A0m.A0m(z11);
        if (this.A0G != null) {
            this.A0G.A0J(z11);
        }
        if (this.A0I != null) {
            this.A0I.A0K(z11);
        }
        C2642u6 c2642u6 = this.A0E;
        String[] strArr = A0t;
        if (strArr[6].charAt(28) == strArr[1].charAt(28)) {
            throw new RuntimeException();
        }
        A0t[2] = "rLKzGG5l7KbHxUsHVHIdLiRc7TCAtTAo";
        if (c2642u6 != null && getResources().getConfiguration().orientation == 1) {
            C2642u6 c2642u62 = this.A0E;
            String[] strArr2 = A0t;
            if (strArr2[6].charAt(28) == strArr2[1].charAt(28)) {
                throw new RuntimeException();
            }
            String[] strArr3 = A0t;
            strArr3[4] = "fsAYZDZshJSrgABpxEQTCWeaOuw8LFzd";
            strArr3[0] = "ZAGVldjcvrMy6LHmcNTH7vedx8MwbbFW";
            c2642u62.A0C();
        }
        if (this.A0J != null) {
            this.A0J.A0f();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1c(boolean z11) {
        super.A1c(z11);
        if (this.A0A != null) {
            this.A0A.A07();
        }
        if (this.A0J != null) {
            this.A0J.A0g();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1d() {
        return A1A();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1e() {
        return !A1l();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1f() {
        return A14();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1h(int i5, int i11, Intent intent) {
        if (i5 == C2735vb.A09 && this.A0c) {
            A0U();
            return true;
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1i(boolean z11) {
        if (A13()) {
            A0c();
            return true;
        }
        if (A15()) {
            return true;
        }
        if (A12()) {
            getAdContextWrapper().A0F().AD9();
            if (this.A0F != null) {
                this.A0F.A07(this);
            }
            return true;
        }
        if (A1A()) {
            C0958Hi adContextWrapper = getAdContextWrapper();
            if (A0t[5].charAt(22) != 'h') {
                throw new RuntimeException();
            }
            String[] strArr = A0t;
            strArr[6] = "UU5V430OEucIXOzz09fXY2jqTsmaQQmd";
            strArr[1] = "7gxBj73w6R3yQwCjOMqcudQaR8uM9tkU";
            adContextWrapper.A0F().ADA();
            if (this.A0g instanceof C0799Be) {
                C0799Be simpleVideoView = (C0799Be) this.A0g;
                simpleVideoView.A0i(true);
            }
            A0z(true);
            return true;
        }
        getAdContextWrapper().A0F().AD7();
        return false;
    }

    public final /* synthetic */ void A1j() {
        if (this.A0o.A0B() != null) {
            this.A0o.A0B().setToolbarActionMode(getCloseButtonStyle());
        }
    }

    public final void A1k(boolean z11) {
        A0z(z11);
    }

    public final boolean A1l() {
        return this.A0L;
    }

    public final boolean A1m() {
        return this.A0W;
    }

    public final boolean A1n() {
        return this.A0K;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public int getCloseButtonStyle() {
        if (this.A0k.A32().A0I().A02() >= 0 && A1e()) {
            if (this.A0k.A3G() && this.A01 < this.A0k.A30() && A17()) {
                return 8;
            }
            if ((this.A0k.A3G() && this.A0R && !A17()) || this.A0X || this.A0Y) {
                return 8;
            }
        }
        if (this.A0X) {
            return 2;
        }
        if (this.A0k.A32().A0I().A0B()) {
            return 1;
        }
        if (this.A0Y) {
            String[] strArr = A0t;
            if (strArr[6].charAt(28) != strArr[1].charAt(28)) {
                A0t[2] = "lO62xE2wBKbpT5YeAQznNt85o8q3UObG";
                return 4;
            }
        } else {
            if (A13()) {
                return 1;
            }
            boolean zA1A = A1A();
            if (A0t[2].charAt(10) == 'b') {
                A0t[2] = "PavIlbPm3dbRtnUrnwOq8fSdfk9XFuG0";
                if (zA1A) {
                    return 1;
                }
                if (!this.A0b) {
                    boolean z11 = this.A0c;
                    String[] strArr2 = A0t;
                    if (strArr2[7].charAt(4) != strArr2[3].charAt(4)) {
                        String[] strArr3 = A0t;
                        strArr3[4] = "1gqLJGPiNyxZ3RpZ4Gub3ZekzXipIRvT";
                        strArr3[0] = "YVpYgXka4o8c2a3l0aVJrleEZzGXbFS8";
                        if (!z11 || TextUtils.isEmpty(this.A0k.A36().A05())) {
                            return super.getCloseButtonStyle();
                        }
                    }
                }
                this.A0b = true;
                return 9;
            }
        }
        throw new RuntimeException();
    }

    private View getContainerView() {
        if (this.A0g != null && A17()) {
            return ((C0799Be) this.A0g).getVideoView();
        }
        return this.A08;
    }

    private int getHeightPixels() {
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        return displayMetrics.heightPixels;
    }

    private ViewGroup getParentView() {
        if (A17()) {
            return (ViewGroup) this.A0g;
        }
        return this.A09;
    }

    private ViewOnClickListenerC0884El getRegularCtaForEndCard() {
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = new ViewOnClickListenerC0884El(getAdContextWrapper(), this.A0o.A05().A1X(), this.A0k.A31().A01(), getAdEventManager(), this.A0o.A0C(), (C1539c2) null, this.A0o.A0A(), this.A0k.A33());
        viewOnClickListenerC0884El.setViewShowsOverMedia(true);
        AbstractC2426qc.A0L(viewOnClickListenerC0884El);
        viewOnClickListenerC0884El.setText(this.A0k.A32().A0K().A05());
        AbstractC2426qc.A0H(1001, viewOnClickListenerC0884El);
        viewOnClickListenerC0884El.setCta(this.A0k.A32().A0K(), this.A0k.A37(), new HashMap(), null);
        return viewOnClickListenerC0884El;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.A0W) {
            if (Build.VERSION.SDK_INT >= 35) {
                Object parent = getParent();
                if (parent instanceof View) {
                    View view = (View) parent;
                    view.setFitsSystemWindows(false);
                    view.setPadding(0, 0, 0, 0);
                    return;
                }
                return;
            }
            return;
        }
        A11(this.A0L, false);
        if (this.A0E != null) {
            this.A0E.A0D(configuration.orientation);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public void setChainedWatchAndBrowseSkippableStatus(boolean z11) {
        A10(z11, 4);
    }

    public void setChildChainedAd(boolean z11) {
        this.A0T = z11;
    }

    private void setUpBrowserControls(F4 f42) {
        AbstractC2426qc.A0K(this.A0B);
        this.A0B = new F8(this.A0o.A06(), f42, true);
        if (this.A0r) {
            A10(false, 1);
        }
        f42.setBrowserNavigationListener(this.A0B.getBrowserNavigationListener());
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(AbstractC2383pv.A0X, AbstractC2383pv.A0X, AbstractC2383pv.A0X, AbstractC2383pv.A0X);
        this.A0B.setListener(new EF(this));
        this.A07.addView(this.A0B, layoutParams);
        AbstractC2426qc.A0K(this.A0C);
        this.A0C = new C2590tG(this.A0o.A06(), null, 16842872);
        this.A07.addView(this.A0C, new LinearLayout.LayoutParams(-1, A0u));
    }
}
