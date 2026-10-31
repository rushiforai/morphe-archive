package com.facebook.ads.redexgen.X;

import android.widget.ImageView;
import android.widget.LinearLayout;

/* renamed from: com.facebook.ads.redexgen.X.rk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2496rk extends LinearLayout {
    public static final int A03 = (int) (AbstractC2385px.A02 * 10.0f);
    public static final int A04 = (int) (AbstractC2385px.A02 * 24.0f);
    public final ImageView A00;
    public final C1819ga A01;
    public final C0958Hi A02;

    public C2496rk(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A02 = c0958Hi;
        this.A01 = AbstractC1820gb.A00(c0958Hi.A02());
        this.A00 = new ImageView(c0958Hi);
        A02();
    }

    private void A02() {
        A03(this.A00, EnumC2437qn.REDESIGN_INFO_ICON);
        setPadding(A03, A03 / 3, A03, A03 / 3);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(A04, A04);
        layoutParams.gravity = 16;
        addView(this.A00, layoutParams);
    }

    public static void A03(ImageView imageView, EnumC2437qn enumC2437qn) {
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setImageBitmap(AbstractC2438qo.A01(enumC2437qn));
        imageView.setColorFilter(-1);
    }

    public void setAdDetails(C1756fZ c1756fZ, String str, C2232nO c2232nO, InterfaceC2459r9 interfaceC2459r9) {
        setOnClickListener(new ViewOnClickListenerC2495rj(this, c2232nO, interfaceC2459r9, str, c1756fZ));
    }

    public void setIconColors(int i5) {
        this.A00.setColorFilter(i5);
    }
}
