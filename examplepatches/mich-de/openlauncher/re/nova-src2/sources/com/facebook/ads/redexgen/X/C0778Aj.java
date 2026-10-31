package com.facebook.ads.redexgen.X;

import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.Handler;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.Aj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0778Aj implements InterfaceC1636db {
    public TransitionDrawable A00;
    public TransitionDrawable A01;
    public final int A03;
    public final Drawable A04;
    public final Drawable A05;
    public final View A07;
    public final Handler A06 = new Handler();
    public EnumC1637dc A02 = EnumC1637dc.A05;

    public C0778Aj(View view, int i5, Drawable drawable, Drawable drawable2) {
        this.A03 = i5;
        this.A07 = view;
        this.A05 = drawable;
        this.A04 = drawable2;
        this.A01 = new TransitionDrawable(new Drawable[]{drawable, drawable2});
        this.A01.setCrossFadeEnabled(true);
        this.A00 = new TransitionDrawable(new Drawable[]{drawable2, drawable});
        this.A00.setCrossFadeEnabled(true);
        AbstractC2426qc.A0W(this.A07, this.A01);
    }

    private void A04(boolean z11) {
        this.A06.removeCallbacksAndMessages(null);
        if (z11) {
            this.A02 = EnumC1637dc.A06;
            AbstractC2426qc.A0W(this.A07, this.A00);
            this.A00.startTransition(this.A03);
            this.A06.postDelayed(new C0779Ak(this), this.A03);
            return;
        }
        AbstractC2426qc.A0W(this.A07, this.A05);
        this.A02 = EnumC1637dc.A05;
    }

    private void A05(boolean z11) {
        this.A06.removeCallbacksAndMessages(null);
        if (z11) {
            this.A02 = EnumC1637dc.A04;
            AbstractC2426qc.A0W(this.A07, this.A01);
            this.A01.startTransition(this.A03);
            this.A06.postDelayed(new C0780Al(this), this.A03);
            return;
        }
        AbstractC2426qc.A0W(this.A07, this.A04);
        this.A02 = EnumC1637dc.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void A4b(boolean z11, boolean z12) {
        if (z12) {
            A04(z11);
        } else {
            A05(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final EnumC1637dc A9o() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void cancel() {
        EnumC1637dc enumC1637dc;
        this.A06.removeCallbacksAndMessages(null);
        this.A01.resetTransition();
        this.A00.resetTransition();
        if (this.A02 == EnumC1637dc.A04) {
            enumC1637dc = EnumC1637dc.A05;
        } else {
            enumC1637dc = EnumC1637dc.A03;
        }
        this.A02 = enumC1637dc;
    }
}
