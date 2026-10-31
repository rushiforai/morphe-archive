package com.facebook.ads.redexgen.X;

import android.graphics.drawable.GradientDrawable;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.r0, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2450r0 extends LinearLayout {
    public static byte[] A04;
    public static final int A05;
    public static final int A06;
    public static final int A07;
    public static final int A08;
    public static final int A09;
    public final ImageView A00;
    public final ImageView A01;
    public final C1819ga A02;
    public final C0958Hi A03;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 91);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A04 = new byte[]{118, 83};
    }

    static {
        A03();
        A08 = (int) (AbstractC2385px.A02 * 50.0f);
        A05 = (int) (AbstractC2385px.A02 * 10.0f);
        A06 = (int) (AbstractC2385px.A02 * 20.0f);
        A09 = (int) (AbstractC2385px.A02 * 4.0f);
        A07 = (int) (AbstractC2385px.A02 * 12.0f);
    }

    public C2450r0(C0958Hi c0958Hi, int i5) {
        super(c0958Hi);
        this.A03 = c0958Hi;
        this.A02 = AbstractC1820gb.A00(c0958Hi.A02());
        setOrientation(0);
        this.A00 = new ImageView(c0958Hi);
        this.A01 = new ImageView(c0958Hi);
        A04(i5);
    }

    private void A04(int i5) {
        EnumC2437qn enumC2437qn;
        A05(this.A00, EnumC2437qn.AD_CHOICES_ICON);
        if (i5 == 2) {
            setPadding(A05, A05 / 3, A05, A05 / 3);
            TextView textView = new TextView(this.A03);
            textView.setText(A02(0, 2, 108));
            textView.setTextColor(-1);
            textView.setPadding(0, A05 / 2, A05 / 2, A05 / 2);
            AbstractC2426qc.A0b(textView, true, 13);
            LinearLayout.LayoutParams textViewParams = new LinearLayout.LayoutParams(-2, -2);
            textViewParams.gravity = 16;
            addView(textView, textViewParams);
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(A07, A07);
            layoutParams.gravity = 16;
            addView(this.A00, layoutParams);
            return;
        }
        setPadding(A05, A05, A05, A05);
        if (i5 == 1) {
            enumC2437qn = EnumC2437qn.AN_INFO_ICON;
        } else {
            enumC2437qn = EnumC2437qn.DEFAULT_INFO_ICON;
        }
        A05(this.A01, enumC2437qn);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(A06, A06);
        layoutParams2.gravity = 17;
        addView(this.A01, layoutParams2);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(A06, A06);
        layoutParams3.setMargins(A09, 0, 0, 0);
        layoutParams3.gravity = 17;
        addView(this.A00, layoutParams3);
    }

    public static void A05(ImageView imageView, EnumC2437qn enumC2437qn) {
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setImageBitmap(AbstractC2438qo.A01(enumC2437qn));
        imageView.setColorFilter(-1);
    }

    public void setAdDetails(C1756fZ c1756fZ, String str, C2232nO c2232nO, InterfaceC2459r9 interfaceC2459r9) {
        setOnClickListener(new ViewOnClickListenerC2449qz(this, c2232nO, interfaceC2459r9, str, c1756fZ));
    }

    @Override // android.view.View
    public void setBackgroundColor(int i5) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setCornerRadius(A08);
        gradientDrawable.setColor(i5);
        AbstractC2426qc.A0W(this, gradientDrawable);
    }

    public void setIconColors(int i5) {
        this.A00.setColorFilter(i5);
        this.A01.setColorFilter(i5);
    }
}
