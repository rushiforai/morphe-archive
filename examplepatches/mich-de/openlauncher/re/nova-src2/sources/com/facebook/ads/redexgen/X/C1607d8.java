package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* renamed from: com.facebook.ads.redexgen.X.d8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1607d8 extends AnimatorListenerAdapter {
    public final /* synthetic */ C0776Ah A00;

    public C1607d8(C0776Ah c0776Ah) {
        this.A00 = c0776Ah;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        if (this.A00.A04) {
            AbstractC2426qc.A0M(this.A00.A03);
        }
        this.A00.A03.setAlpha(1.0f);
        this.A00.A01 = EnumC1637dc.A03;
        if (this.A00.A00 != null) {
            this.A00.A00.setListener(null);
            this.A00.A00 = null;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        if (this.A00.A04) {
            AbstractC2426qc.A0I(this.A00.A03);
        }
        this.A00.A01 = EnumC1637dc.A05;
        if (this.A00.A00 != null) {
            this.A00.A00.setListener(null);
            this.A00.A00 = null;
        }
    }
}
