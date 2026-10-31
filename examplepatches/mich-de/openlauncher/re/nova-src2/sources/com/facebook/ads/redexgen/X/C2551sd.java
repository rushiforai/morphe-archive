package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.widget.ImageView;
import android.widget.LinearLayout;

/* renamed from: com.facebook.ads.redexgen.X.sd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2551sd extends LinearLayout {
    public final Handler A00;
    public final ImageView A01;
    public final ImageView A02;
    public final C1756fZ A03;
    public final C1819ga A04;
    public final C0958Hi A05;
    public final C2232nO A06;
    public final InterfaceC2459r9 A07;
    public final Runnable A08;
    public final String A09;

    public C2551sd(C0958Hi c0958Hi, LA la2, C2232nO c2232nO, InterfaceC2459r9 interfaceC2459r9) {
        super(c0958Hi);
        this.A00 = new Handler(Looper.getMainLooper());
        this.A08 = new RunnableC2549sb(this);
        this.A05 = c0958Hi;
        this.A09 = la2.A37();
        this.A03 = la2.A35();
        this.A07 = interfaceC2459r9;
        this.A06 = c2232nO;
        this.A04 = AbstractC1820gb.A00(c0958Hi.A02());
        this.A01 = A01(EnumC2437qn.AD_CHOICE_V2_COLLAPSE, 1104);
        addView(this.A01);
        this.A02 = A01(EnumC2437qn.AD_CHOICE_V2_EXPAND, 1105);
        addView(this.A02);
        A07(8);
        setOnClickListener(new ViewOnClickListenerC2550sc(this));
    }

    private final ImageView A01(EnumC2437qn enumC2437qn, int i5) {
        ImageView imageView = new ImageView(this.A05);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        imageView.setImageBitmap(AbstractC2438qo.A01(enumC2437qn));
        AbstractC2426qc.A0H(i5, imageView);
        return imageView;
    }

    public final void A04() {
        this.A00.removeCallbacksAndMessages(null);
    }

    public final void A05() {
        this.A00.removeCallbacks(this.A08);
        A07(8);
    }

    public final void A06() {
        if (this.A06 != null) {
            this.A06.A04(EnumC2231nN.A0A, null);
        }
        if (this.A04.A0O(this.A05.A02(), true)) {
            this.A07.ABW(this.A09, this.A03);
        } else {
            if (TextUtils.isEmpty(this.A03.A00())) {
                return;
            }
            C2347pK.A0P(new C2347pK(), this.A05, AbstractC2351pP.A00(this.A03.A00()), this.A09);
        }
    }

    public final void A07(int i5) {
        if (i5 == 0) {
            this.A02.setVisibility(0);
            this.A01.setVisibility(8);
        } else {
            this.A02.setVisibility(8);
            this.A01.setVisibility(0);
        }
    }
}
