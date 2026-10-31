package com.facebook.ads.redexgen.X;

import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.vE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2712vE extends RelativeLayout {
    public final View A00;
    public final C2662uQ A01;

    public C2712vE(C0958Hi c0958Hi, View view) {
        super(c0958Hi);
        this.A00 = view;
        this.A01 = new C2662uQ(c0958Hi);
        AbstractC2426qc.A0L(this.A01);
    }

    public final void A00(int i5) {
        this.A00.setLayoutParams(new RelativeLayout.LayoutParams(-1, i5));
    }

    public final void A01(C2667uV c2667uV, boolean z11) {
        this.A01.addView(this.A00, new RelativeLayout.LayoutParams(-1, -2));
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(1);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(8, this.A00.getId());
        if (c2667uV != null) {
            if (z11) {
                LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
                c2667uV.setAlignment(3);
                layoutParams2.setMargins(AbstractC2685un.A09 / 2, AbstractC2685un.A09 / 2, AbstractC2685un.A09 / 2, AbstractC2685un.A09 / 2);
                linearLayout.addView(c2667uV, layoutParams2);
                GradientDrawable gradientDrawable = new GradientDrawable(GradientDrawable.Orientation.BOTTOM_TOP, new int[]{-1778384896, 0});
                gradientDrawable.setCornerRadius(0.0f);
                gradientDrawable.setGradientType(0);
                AbstractC2426qc.A0W(linearLayout, gradientDrawable);
            } else {
                RelativeLayout.LayoutParams insideLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
                insideLayoutParams.addRule(3, this.A01.getId());
                insideLayoutParams.setMargins(0, AbstractC2685un.A09, 0, 0);
                c2667uV.setAlignment(17);
                addView(c2667uV, insideLayoutParams);
            }
        }
        this.A01.addView(linearLayout, layoutParams);
        addView(this.A01, new RelativeLayout.LayoutParams(-1, -2));
    }
}
