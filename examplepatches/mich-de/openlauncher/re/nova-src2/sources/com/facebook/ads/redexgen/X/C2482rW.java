package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.text.TextUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

/* renamed from: com.facebook.ads.redexgen.X.rW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2482rW extends RelativeLayout {
    public TextView A00;
    public final Button A01;
    public final Button A02;
    public final ImageView A03;
    public final LinearLayout A04;
    public final TextView A05;
    public static final int A08 = (int) (AbstractC2385px.A02 * 60.0f);
    public static final int A07 = (int) (AbstractC2385px.A02 * 8.0f);
    public static final int A09 = (int) (AbstractC2385px.A02 * 16.0f);
    public static final int A0A = (int) (AbstractC2385px.A02 * 24.0f);
    public static final int A06 = (int) (AbstractC2385px.A02 * 12.0f);

    public C2482rW(C0958Hi c0958Hi, int i5, int i11, String str, String str2, String str3, String str4, Bitmap bitmap) {
        super(c0958Hi);
        this.A05 = new TextView(c0958Hi);
        this.A02 = new Button(c0958Hi);
        this.A01 = new Button(c0958Hi);
        this.A03 = new ImageView(c0958Hi);
        this.A04 = new LinearLayout(c0958Hi);
        if (!TextUtils.isEmpty(str2)) {
            this.A00 = new TextView(c0958Hi);
        }
        this.A05.setText(str);
        this.A05.setTextColor(i5);
        AbstractC2426qc.A0b(this.A05, true, 20);
        if (this.A00 != null) {
            this.A00.setText(str2);
            this.A00.setTextColor(i5);
            AbstractC2426qc.A0b(this.A00, false, 18);
        }
        this.A03.setImageBitmap(bitmap);
        this.A03.setColorFilter(i5);
        this.A02.setText(str3);
        AbstractC2426qc.A0b(this.A02, true, 18);
        this.A02.setAllCaps(true);
        this.A02.setTextColor(i11);
        this.A02.setPadding(A06, A06, A06, A06);
        this.A01.setText(str4);
        AbstractC2426qc.A0b(this.A01, true, 18);
        this.A01.setAllCaps(true);
        this.A01.setTextColor(i5);
        this.A01.setPadding(A06, A06, A06, A06);
        int iA02 = AbstractC1841gx.A02(i11, 20);
        AbstractC2426qc.A0R(this.A02, i5, A07);
        AbstractC2426qc.A0R(this.A01, iA02, A07);
        A00();
        setGravity(17);
    }

    private void A00() {
        setPadding(A0A, A0A, A0A, A0A);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        this.A04.setOrientation(1);
        this.A04.setGravity(14);
        addView(this.A04, layoutParams);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(A08, A08);
        layoutParams2.setMargins(0, 0, 0, A09);
        layoutParams2.gravity = 1;
        this.A04.addView(this.A03, layoutParams2);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams3.setMargins(0, 0, 0, A09 / 2);
        this.A05.setGravity(17);
        this.A04.addView(this.A05, layoutParams3);
        if (this.A00 != null) {
            LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-1, -2);
            layoutParams4.setMargins(0, 0, 0, A09);
            this.A00.setGravity(17);
            this.A04.addView(this.A00, layoutParams4);
        }
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams5.setMargins(0, 0, 0, A09);
        this.A04.addView(this.A02, layoutParams5);
        this.A04.addView(this.A01, layoutParams5);
    }
}
