package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.Fd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC0902Fd extends RelativeLayout implements InterfaceC2567st {
    public Handler A00;
    public C2570sw A01;
    public boolean A02;
    public C2475rP A03;
    public C2552se A04;
    public C2566ss A05;
    public final View.OnClickListener A06;
    public final LA A07;
    public final C0958Hi A08;
    public final C2232nO A09;
    public static final int A0B = (int) (AbstractC2385px.A02 * 4.0f);
    public static final int A0C = (int) (AbstractC2385px.A02 * 40.0f);
    public static final int A0A = (int) (AbstractC2385px.A02 * 24.0f);

    public abstract int getMediaViewId();

    public AbstractC0902Fd(C0958Hi c0958Hi, View.OnClickListener onClickListener, C2232nO c2232nO, LA la2) {
        super(c0958Hi);
        this.A02 = true;
        this.A08 = c0958Hi;
        this.A06 = onClickListener;
        this.A09 = c2232nO;
        this.A07 = la2;
        A0C();
    }

    public static RelativeLayout.LayoutParams A0B(View view) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        if (view != null) {
            layoutParams.addRule(1, view.getId());
            layoutParams.setMargins(AbstractC2383pv.A0K, AbstractC2383pv.A0X, AbstractC2383pv.A00, AbstractC2383pv.A00);
        } else {
            layoutParams.addRule(20);
            layoutParams.setMargins(AbstractC2383pv.A0X, AbstractC2383pv.A0X, AbstractC2383pv.A00, AbstractC2383pv.A00);
        }
        return layoutParams;
    }

    private void A0C() {
        if (this.A07 != null) {
            if (this.A07.A3O()) {
                this.A00 = new Handler(Looper.getMainLooper());
                this.A05 = AbstractC2571sx.A00(this.A08, true, this.A07, this.A09, null, EnumC2569sv.A04, this, AbstractC2568su.A00(this.A07));
            } else if (this.A07.A3U()) {
                this.A01 = AbstractC2571sx.A02(this.A08, EnumC2569sv.A04, this.A07);
                AbstractC2426qc.A0L(this.A01);
            }
            if (this.A07.A3S()) {
                this.A04 = new C2552se(this.A08, EnumC2569sv.A04);
                AbstractC2426qc.A0L(this.A04);
                this.A04.setOnClickListener(this.A06);
            } else {
                this.A03 = new C2475rP(this.A08);
                this.A03.setOnClickListener(this.A06);
            }
        }
    }

    public final RelativeLayout.LayoutParams A0D(boolean z11, boolean z12) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A0C, A0A);
        layoutParams.setMargins(A0B, A0B, A0B, A0B);
        if (this.A02) {
            layoutParams.addRule(z11 ? 12 : 10);
            layoutParams.addRule(z12 ? 11 : 9);
        } else {
            int mediaViewId = getMediaViewId();
            layoutParams.addRule(z11 ? 8 : 6, mediaViewId);
            layoutParams.addRule(z12 ? 7 : 5, mediaViewId);
        }
        return layoutParams;
    }

    public void A0E() {
        if (this.A00 != null) {
            this.A00.removeCallbacksAndMessages(null);
        }
    }

    public void A0F() {
        if (this.A01 != null) {
            this.A01.A04();
        }
    }

    public void A0G() {
        if (this.A03 != null) {
            AbstractC2426qc.A0K(this.A03);
            this.A03.setLayoutParams(A0D(false, true));
            addView(this.A03);
        }
        if (this.A05 != null) {
            AbstractC2426qc.A0K(this.A05);
            this.A05.setLayoutParams(getCreditLineLayoutParams());
            addView(this.A05);
        }
        if (this.A01 != null) {
            AbstractC2426qc.A0K(this.A01);
            this.A01.setLayoutParams(getCreditLineLayoutParams());
            addView(this.A01);
        }
    }

    public boolean A0H() {
        return true;
    }

    public boolean A0I() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2567st
    public final void AEX(View view) {
        this.A06.onClick(view);
    }

    public static RelativeLayout.LayoutParams getCreditLineLayoutParams() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(AbstractC2383pv.A00, AbstractC2383pv.A0X, AbstractC2383pv.A0X, AbstractC2383pv.A00);
        layoutParams.addRule(10);
        layoutParams.addRule(11);
        return layoutParams;
    }

    @Override // android.widget.RelativeLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        boolean zA0I = A0I();
        boolean newShouldLayoutButtonsRelativeToParent = this.A02;
        if (zA0I != newShouldLayoutButtonsRelativeToParent) {
            this.A02 = zA0I;
            A0G();
        }
    }
}
