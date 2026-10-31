package com.facebook.ads.redexgen.X;

import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

/* renamed from: com.facebook.ads.redexgen.X.sA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2522sA extends RelativeLayout {
    public final int A00;
    public final int A01;
    public final C1819ga A02;
    public final C0958Hi A03;
    public final InterfaceC2526sE A04;
    public final boolean A05;
    public static final int A09 = (int) (AbstractC2385px.A02 * 16.0f);
    public static final int A0A = (int) (AbstractC2385px.A02 * 8.0f);
    public static final int A0D = (int) (AbstractC2385px.A02 * 44.0f);
    public static final int A08 = (int) (AbstractC2385px.A02 * 10.0f);
    public static final int A07 = A09 - A08;
    public static final int A0E = (int) (AbstractC2385px.A02 * 75.0f);
    public static final int A0B = (int) (AbstractC2385px.A02 * 25.0f);
    public static final int A0F = (int) (AbstractC2385px.A02 * 45.0f);
    public static final int A0C = (int) (AbstractC2385px.A02 * 15.0f);
    public static final int A06 = (int) (AbstractC2385px.A02 * 16.0f);

    public C2522sA(C2521s9 c2521s9) {
        super(c2521s9.A0B);
        this.A03 = c2521s9.A0B;
        this.A02 = AbstractC1820gb.A00(this.A03.A02());
        this.A04 = c2521s9.A02;
        this.A01 = c2521s9.A0A ? A0E : A0F;
        this.A00 = c2521s9.A0A ? A0B : A0C;
        this.A05 = c2521s9.A07;
        setFocusable(true);
        View viewA01 = A01(c2521s9);
        View viewA00 = A00(c2521s9);
        View footerView = getFooterView();
        AbstractC2426qc.A0L(viewA01);
        AbstractC2426qc.A0L(viewA00);
        AbstractC2426qc.A0L(footerView);
        RelativeLayout.LayoutParams contentParams = new RelativeLayout.LayoutParams(-1, -2);
        contentParams.addRule(10);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(13);
        layoutParams.addRule(3, viewA01.getId());
        layoutParams.addRule(2, footerView.getId());
        RelativeLayout.LayoutParams footerParams = new RelativeLayout.LayoutParams(-1, -2);
        footerParams.addRule(12);
        footerParams.setMargins(A09, 0, A09, A09);
        addView(viewA01, contentParams);
        addView(viewA00, layoutParams);
        addView(footerView, footerParams);
        footerView.setVisibility(0);
    }

    public /* synthetic */ C2522sA(C2521s9 c2521s9, ViewOnClickListenerC2519s7 viewOnClickListenerC2519s7) {
        this(c2521s9);
    }

    private View A00(C2521s9 c2521s9) {
        ImageView imageView = new ImageView(getContext());
        imageView.setPadding(this.A00, this.A00, this.A00, this.A00);
        imageView.setImageBitmap(AbstractC2438qo.A01(c2521s9.A01));
        imageView.setColorFilter(-1);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(this.A01, this.A01);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(c2521s9.A00);
        AbstractC2426qc.A0W(imageView, gradientDrawable);
        layoutParams.gravity = 17;
        layoutParams.setMargins(A09, 0, A09, A09);
        TextView subtitleView = new TextView(getContext());
        AbstractC2426qc.A0b(subtitleView, true, 20);
        subtitleView.setTextColor(-14934495);
        subtitleView.setText(c2521s9.A06);
        subtitleView.setGravity(17);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.setMargins(A09, 0, A09, A09);
        TextView titleView = new TextView(getContext());
        AbstractC2426qc.A0b(titleView, false, 16);
        titleView.setTextColor(-10459280);
        titleView.setText(c2521s9.A05);
        titleView.setGravity(17);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams3.setMargins(A09, 0, A09, A09);
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(1);
        linearLayout.setGravity(17);
        linearLayout.addView(imageView, layoutParams);
        linearLayout.addView(subtitleView, layoutParams2);
        linearLayout.addView(titleView, layoutParams3);
        if (c2521s9.A08) {
            LinearLayout linearLayout2 = new LinearLayout(getContext());
            linearLayout2.setOrientation(0);
            linearLayout2.setGravity(17);
            if (!TextUtils.isEmpty(c2521s9.A04)) {
                C2661uP c2661uP = new C2661uP(this.A03);
                LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(A0F, A0F);
                iconParams.setMargins(0, 0, A0A, 0);
                c2661uP.setFullCircleCorners(true);
                new AsyncTaskC0892Et(c2661uP, this.A03).A05(A0F, A0F).A07(c2521s9.A04);
                linearLayout2.addView(c2661uP, iconParams);
            }
            C2528sG c2528sG = new C2528sG(this.A03);
            c2528sG.setData(c2521s9.A03, EnumC2437qn.CHECKMARK);
            c2528sG.setSelected(true);
            linearLayout2.addView(c2528sG, new LinearLayout.LayoutParams(-2, -2));
            linearLayout.addView(linearLayout2);
        }
        return linearLayout;
    }

    private View A01(C2521s9 c2521s9) {
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(0);
        if (c2521s9.A09) {
            ImageView imageView = new ImageView(getContext());
            imageView.setPadding(A08, A08, A08, A08);
            imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            imageView.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.CROSS));
            imageView.setOnClickListener(new ViewOnClickListenerC2519s7(this));
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(A0D, A0D);
            layoutParams.setMargins(A07, A07, A07, A07);
            linearLayout.addView(imageView, layoutParams);
        }
        return linearLayout;
    }

    private View getFooterView() {
        ImageView imageView = new ImageView(getContext());
        imageView.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.SETTINGS));
        imageView.setColorFilter(-13272859);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(A06, A06);
        layoutParams.gravity = 17;
        TextView textView = new TextView(getContext());
        AbstractC2426qc.A0b(textView, false, 16);
        textView.setTextColor(-13272859);
        textView.setPadding(A0A, A0A, A0A, A0A);
        textView.setText(this.A02.A0J());
        LinearLayout.LayoutParams settingsIconParams = new LinearLayout.LayoutParams(-2, -2);
        settingsIconParams.gravity = 17;
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(0);
        linearLayout.setGravity(17);
        linearLayout.setOnClickListener(new ViewOnClickListenerC2520s8(this));
        linearLayout.addView(imageView, layoutParams);
        linearLayout.addView(textView, settingsIconParams);
        return linearLayout;
    }
}
