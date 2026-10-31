package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Typeface;
import android.widget.LinearLayout;
import android.widget.TextView;

/* renamed from: com.facebook.ads.redexgen.X.gq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1834gq extends LinearLayout {
    public int A00;
    public int A01;
    public int A02;
    public final int A03;
    public final TextView A04;
    public final TextView A05;

    public C1834gq(Context context) {
        super(context);
        this.A01 = 30;
        this.A02 = 45;
        this.A00 = 8;
        setOrientation(1);
        setGravity(17);
        this.A05 = new TextView(getContext());
        this.A05.setTextSize(17.0f);
        this.A05.setTextColor(-1);
        this.A05.setTypeface(Typeface.DEFAULT_BOLD);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, this.A00, 0, 0);
        this.A05.setLayoutParams(layoutParams);
        addView(this.A05);
        this.A04 = new TextView(getContext());
        this.A04.setTextSize(11.0f);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(-2, -2);
        subtitleParams.setMargins(0, 0, 0, 0);
        this.A04.setLayoutParams(subtitleParams);
        addView(this.A04);
        this.A03 = (int) AbstractC2385px.A02;
        A00();
    }

    private void A00() {
        this.A01 *= this.A03;
        this.A02 *= this.A03;
        this.A00 *= this.A03;
    }

    public final C1834gq A01(C2651uF c2651uF) {
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(this.A01, this.A01);
        layoutParams.setMargins(this.A02, 0, this.A02, 0);
        c2651uF.setLayoutParams(layoutParams);
        addView(c2651uF, 0);
        return this;
    }

    public final C1834gq A02(String str) {
        this.A04.setText(str);
        return this;
    }

    public final C1834gq A03(String str) {
        this.A05.setText(str);
        return this;
    }
}
