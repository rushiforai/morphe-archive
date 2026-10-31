package com.facebook.ads.redexgen.X;

import android.graphics.Typeface;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import java.util.HashMap;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.vW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2730vW extends FrameLayout {
    public final int A00;
    public final RelativeLayout A01;
    public final ViewOnClickListenerC0884El A02;
    public static final int A05 = (int) (AbstractC2385px.A02 * 36.0f);
    public static final int A06 = (int) (AbstractC2385px.A02 * 36.0f);
    public static final int A03 = (int) (AbstractC2385px.A02 * 23.0f);
    public static final int A04 = (int) (AbstractC2385px.A02 * 3.0f);
    public static final int A07 = (int) (AbstractC2385px.A02 * 4.0f);

    public C2730vW(C0958Hi c0958Hi, ViewOnClickListenerC0884El viewOnClickListenerC0884El, LA la2, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, C1744fN c1744fN, InterfaceC2643u7 interfaceC2643u7) {
        super(c0958Hi);
        this.A00 = c1744fN.A09(true);
        this.A01 = new RelativeLayout(c0958Hi);
        addView(this.A01, new FrameLayout.LayoutParams(-1, -1));
        this.A01.setClickable(false);
        A01(c0958Hi, la2.A32().A0K().A05());
        if (viewOnClickListenerC0884El == null) {
            this.A02 = new ViewOnClickListenerC0884El(c0958Hi, la2.A1X(), (C1744fN) null, interfaceC2224nG, interfaceC2459r9, c1539c2, c2417qT, la2.A33());
        } else {
            this.A02 = viewOnClickListenerC0884El;
        }
        A03();
        this.A02.setCta(la2.A32().A0K(), la2.A37(), new HashMap(), interfaceC2643u7);
        this.A02.setIsInAppBrowser(true);
        FrameLayout.LayoutParams ctaButtonParams = new FrameLayout.LayoutParams(-1, -1);
        addView(this.A02, ctaButtonParams);
    }

    private void A00(C0958Hi c0958Hi, View view) {
        ImageView imageView = new ImageView(c0958Hi);
        imageView.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.MINIMIZE_ARROW));
        imageView.setRotation(180.0f);
        imageView.setClickable(false);
        imageView.setColorFilter(this.A00);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A03, A03);
        imageView.setPadding(A04, A04, A04, A04);
        layoutParams.addRule(2, view.getId());
        layoutParams.addRule(14);
        this.A01.addView(imageView, layoutParams);
    }

    private void A01(C0958Hi c0958Hi, String str) {
        Button button = new Button(c0958Hi);
        AbstractC2426qc.A0L(button);
        button.setPadding(A06, 0, A06, 0);
        button.setText(str.toUpperCase(Locale.getDefault()));
        button.setTextSize(14.0f);
        button.setTypeface(Typeface.defaultFromStyle(1));
        AbstractC2426qc.A0R(button, this.A00, A07);
        button.setTextColor(-16777216);
        RelativeLayout.LayoutParams ctaParams = new RelativeLayout.LayoutParams(-2, A05);
        ctaParams.addRule(12);
        ctaParams.addRule(14);
        this.A01.addView(button, ctaParams);
        A00(c0958Hi, button);
    }

    public final EnumC1698ec A02(String str) {
        return this.A02.A0E(str);
    }

    public final void A03() {
        this.A02.setBackgroundColor(0);
        this.A02.setTextColor(0);
    }

    @Override // android.view.View
    public final boolean performClick() {
        return this.A02.performClick();
    }

    public void setAutoClickTime(LA la2, AbstractC2452r2 abstractC2452r2) {
        this.A02.A0I(la2, abstractC2452r2);
    }

    public void setCta(C1746fP c1746fP, String str, HashMap<String, String> extras, InterfaceC2643u7 interfaceC2643u7) {
        this.A02.setCta(c1746fP, str, extras, interfaceC2643u7);
    }
}
