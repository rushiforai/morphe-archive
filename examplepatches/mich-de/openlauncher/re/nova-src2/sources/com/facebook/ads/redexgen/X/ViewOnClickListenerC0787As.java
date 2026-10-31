package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.As, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC0787As extends RelativeLayout implements InterfaceC1663e3, View.OnClickListener {
    public C0799Be A00;
    public final BM A01;
    public final BG A02;
    public final BE A03;
    public final BC A04;
    public final C1639de A05;
    public static final int A07 = (int) (AbstractC2385px.A02 * 16.0f);
    public static final int A06 = (int) (AbstractC2385px.A02 * 6.0f);

    public ViewOnClickListenerC0787As(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A04 = new BC() { // from class: com.facebook.ads.redexgen.X.5H
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BD bd2) {
                this.A00.setVisibility(0);
            }
        };
        this.A02 = new BG() { // from class: com.facebook.ads.redexgen.X.5G
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                this.A00.A05.setChecked(true);
            }
        };
        this.A03 = new BE() { // from class: com.facebook.ads.redexgen.X.5F
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                this.A00.A05.setChecked(false);
            }
        };
        this.A01 = new BM() { // from class: com.facebook.ads.redexgen.X.5E
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                this.A00.A05.setChecked(true);
            }
        };
        AbstractC2426qc.A0W(this, AbstractC2426qc.A06(855638016, A06));
        this.A05 = new C1639de(c0958Hi, true);
        this.A05.setChecked(true);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(A07, A07);
        layoutParams.addRule(13);
        setVisibility(8);
        addView(this.A05, layoutParams);
        setClickable(true);
        setFocusable(true);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ABd(C0799Be c0799Be) {
        this.A00 = c0799Be;
        setOnClickListener(this);
        this.A05.setOnClickListener(this);
        if (this.A00 != null) {
            this.A00.getEventBus().A03(this.A04, this.A01, this.A02, this.A03);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ALp(C0799Be c0799Be) {
        if (this.A00 != null) {
            this.A00.getEventBus().A04(this.A03, this.A02, this.A01, this.A04);
        }
        setOnClickListener(null);
        this.A05.setOnClickListener(null);
        this.A00 = null;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00 == null) {
                return;
            }
            if (this.A00.getState() == EnumC1549cC.A07 || this.A00.getState() == EnumC1549cC.A05 || this.A00.getState() == EnumC1549cC.A06) {
                this.A00.A0f(EnumC1664e4.A05, 11);
            } else if (this.A00.getState() == EnumC1549cC.A0A) {
                this.A00.A0j(true, 7);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }

    public void setPauseAccessibilityLabel(String str) {
        this.A05.setPauseAccessibilityLabel(str);
    }

    public void setPlayAccessibilityLabel(String str) {
        this.A05.setPlayAccessibilityLabel(str);
    }
}
