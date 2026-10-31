package com.facebook.ads.redexgen.X;

import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewGroup;

/* renamed from: com.facebook.ads.redexgen.X.Ai, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0777Ai implements InterfaceC1636db {
    public int A00;
    public ValueAnimator A01;
    public EnumC1637dc A02 = EnumC1637dc.A05;
    public final int A03;
    public final int A04;
    public final View A05;

    public C0777Ai(View view, int i5, int i11, int i12) {
        this.A05 = view;
        this.A03 = i5;
        this.A00 = i11;
        this.A04 = i12;
    }

    private ValueAnimator A00(int i5, int i11, View view) {
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(i5, i11);
        valueAnimatorOfInt.setDuration(this.A03);
        valueAnimatorOfInt.addUpdateListener(new C1616dH(this, view));
        return valueAnimatorOfInt;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07(boolean z11) {
        if (z11) {
            this.A02 = EnumC1637dc.A06;
            this.A01 = A00(this.A00, this.A04, this.A05);
            this.A01.addListener(new C1617dI(this));
            this.A01.start();
            return;
        }
        ViewGroup.LayoutParams layoutParams = this.A05.getLayoutParams();
        layoutParams.height = this.A04;
        this.A05.setLayoutParams(layoutParams);
        AbstractC2426qc.A0I(this.A05);
        this.A02 = EnumC1637dc.A05;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A08(boolean z11) {
        AbstractC2426qc.A0M(this.A05);
        if (z11) {
            this.A02 = EnumC1637dc.A04;
            this.A01 = A00(this.A04, this.A00, this.A05);
            this.A01.addListener(new C1628dT(this));
            this.A01.start();
            return;
        }
        ViewGroup.LayoutParams layoutParams = this.A05.getLayoutParams();
        layoutParams.height = this.A00;
        this.A05.setLayoutParams(layoutParams);
        this.A02 = EnumC1637dc.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void A4b(boolean z11, boolean z12) {
        if (z12) {
            A07(z11);
        } else {
            A08(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final EnumC1637dc A9o() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void cancel() {
        if (this.A01 != null) {
            this.A01.cancel();
        }
    }
}
