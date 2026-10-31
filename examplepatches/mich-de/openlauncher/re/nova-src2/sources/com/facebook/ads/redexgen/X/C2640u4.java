package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

/* renamed from: com.facebook.ads.redexgen.X.u4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2640u4 extends RelativeLayout {
    public Runnable A00;
    public boolean A01;
    public boolean A02;
    public final int A03;
    public final Handler A04;
    public final RelativeLayout A05;
    public final LA A06;
    public final C0958Hi A07;
    public final ViewOnClickListenerC0884El A08;
    public final boolean A09;
    public static String[] A0A = {"lYBQPt5EeQTEHSulRYN1NTPAhA", "I40MXu5BXigJKikdnS1WHl7AtgGUaraI", "TJkToAPSava3jxgCAxOgc43", "b6jpooN9aaYeT3fbo5zsHax1nICsO86o", "Vz6IqOQgJuZbDA7xp8clHkJW5F", "cIt1n5snpHl069sFth8rIFb5omyjxfUK", "voe6OKdtQWorCLkYsZIwA9C", "4LwD5QbhoU6tgLUYecpineqUtQK"};
    public static final int A0F = AbstractC2383pv.A0L;
    public static final int A0B = AbstractC2383pv.A0V;
    public static final int A0C = AbstractC2383pv.A0A;
    public static final int A0G = AbstractC2383pv.A06;
    public static final int A0E = AbstractC2383pv.A0J;
    public static final int A0D = AbstractC2383pv.A09;

    public C2640u4(C0958Hi c0958Hi, LA la2, ViewOnClickListenerC0884El viewOnClickListenerC0884El, int i5, boolean z11) {
        super(c0958Hi);
        this.A01 = false;
        this.A02 = false;
        this.A04 = new Handler(Looper.getMainLooper());
        this.A07 = c0958Hi;
        this.A06 = la2;
        this.A08 = viewOnClickListenerC0884El;
        this.A03 = i5;
        this.A09 = z11;
        this.A05 = A00();
        A0I(getResources().getConfiguration().orientation);
        this.A05.setTranslationY(A0D);
        addView(this.A05);
        A07();
    }

    private RelativeLayout A00() {
        RelativeLayout relativeLayout = new RelativeLayout(this.A07);
        relativeLayout.setPadding(AbstractC2383pv.A06, AbstractC2383pv.A06, AbstractC2383pv.A06, AbstractC2383pv.A06);
        AbstractC2426qc.A0Q(relativeLayout, -1, A0C);
        relativeLayout.setElevation(AbstractC2383pv.A0K);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(AbstractC2383pv.A0X, AbstractC2383pv.A01, AbstractC2383pv.A00, AbstractC2383pv.A01);
        if (this.A08 != null) {
            RelativeLayout.LayoutParams ctaButtonParams = new RelativeLayout.LayoutParams(-2, A0E);
            ctaButtonParams.addRule(11);
            ctaButtonParams.addRule(15);
            layoutParams.addRule(0, this.A08.getId());
            relativeLayout.addView(this.A08, ctaButtonParams);
        }
        C2661uP appIcon = getAppIcon();
        AbstractC2426qc.A0L(appIcon);
        relativeLayout.addView(appIcon);
        layoutParams.addRule(1, appIcon.getId());
        RelativeLayout bannerOverlayView = getTitleAndRatings();
        relativeLayout.addView(bannerOverlayView, layoutParams);
        return relativeLayout;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A04() {
        this.A07.A0F().AED();
        this.A05.animate().translationY(A0D).setDuration(300L).setListener(new C2639u3(this)).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A05() {
        this.A05.animate().translationY(0.0f).setDuration(300L).setListener(new C2638u2(this)).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A06() {
        if (this.A00 != null) {
            this.A04.removeCallbacks(this.A00);
            this.A00 = null;
        }
        this.A01 = false;
    }

    private void A07() {
        new ViewOnTouchListenerC2434qk(100, 500, this.A07, new C0887Eo(this)).A00(this.A05);
    }

    public final void A0E() {
        this.A00 = new Runnable() { // from class: com.facebook.ads.redexgen.X.u1
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A05();
            }
        };
        this.A01 = true;
        this.A04.postDelayed(this.A00, this.A03);
    }

    public final void A0F() {
        A06();
        this.A04.removeCallbacksAndMessages(null);
        if (this.A05 != null) {
            this.A05.clearAnimation();
        }
    }

    public final void A0G() {
        A06();
        if (!this.A02 && this.A05 != null) {
            this.A05.clearAnimation();
        }
    }

    public final void A0H() {
        if (this.A02 || this.A01) {
            return;
        }
        RelativeLayout relativeLayout = this.A05;
        String[] strArr = A0A;
        if (strArr[1].charAt(17) == strArr[5].charAt(17)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0A;
        strArr2[1] = "DbEY42Y7TGsFdpMEAM5w8qdCwG9i3YwF";
        strArr2[5] = "rrBUvKbhRw1HJJafKnpWZgKFED1V1Sxe";
        if (relativeLayout != null) {
            A0E();
        }
    }

    public final void A0I(int i5) {
        RelativeLayout.LayoutParams bannerOverlayParams;
        if (i5 == 1) {
            bannerOverlayParams = new RelativeLayout.LayoutParams(-1, A0B);
            bannerOverlayParams.setMargins(AbstractC2383pv.A0A, AbstractC2383pv.A00, AbstractC2383pv.A0A, AbstractC2383pv.A00);
        } else {
            int screenWidth = getResources().getDisplayMetrics().widthPixels;
            bannerOverlayParams = new RelativeLayout.LayoutParams((int) (screenWidth * 0.5d), A0B);
        }
        this.A05.setLayoutParams(bannerOverlayParams);
    }

    private C2661uP getAppIcon() {
        C2661uP c2661uP = new C2661uP(this.A07);
        AbstractC2426qc.A0O(c2661uP, 0);
        new AsyncTaskC0892Et(c2661uP, this.A07).A05(A0F, A0F).A07(this.A06.A35().A01());
        RelativeLayout.LayoutParams iconViewParams = new RelativeLayout.LayoutParams(A0F, A0F);
        iconViewParams.addRule(9);
        c2661uP.setLayoutParams(iconViewParams);
        return c2661uP;
    }

    private LinearLayout getRatingCountAndStar() {
        LinearLayout linearLayout = new LinearLayout(this.A07);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        TextView textView = new TextView(this.A07);
        AbstractC2426qc.A0L(textView);
        textView.setTextColor(this.A06.A31().A01().A07(false));
        textView.setText(this.A06.A32().A0J().A0D());
        textView.setTextSize(13.0f);
        linearLayout.addView(textView);
        C2664uS c2664uS = new C2664uS(this.A07, -16777216, -16777216);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A0G, A0G);
        layoutParams.setMargins(AbstractC2383pv.A0K, AbstractC2383pv.A0K, AbstractC2383pv.A0K, AbstractC2383pv.A0K);
        linearLayout.addView(c2664uS, layoutParams);
        return linearLayout;
    }

    private TextView getTitle() {
        TextView textView = new TextView(this.A07);
        textView.setTextColor(this.A06.A31().A01().A07(false));
        textView.setText(this.A06.A32().A0J().A0H());
        textView.setTextSize(15.0f);
        textView.setMaxLines(1);
        return textView;
    }

    private RelativeLayout getTitleAndRatings() {
        RelativeLayout relativeLayout = new RelativeLayout(this.A07);
        relativeLayout.setGravity(16);
        TextView title = getTitle();
        AbstractC2426qc.A0L(title);
        relativeLayout.addView(title);
        LinearLayout ratingCountAndStar = getRatingCountAndStar();
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(3, title.getId());
        layoutParams.addRule(12);
        relativeLayout.addView(ratingCountAndStar, layoutParams);
        return relativeLayout;
    }
}
