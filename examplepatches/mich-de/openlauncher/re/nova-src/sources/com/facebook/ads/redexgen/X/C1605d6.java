package com.facebook.ads.redexgen.X;

import android.animation.Animator;

/* renamed from: com.facebook.ads.redexgen.X.d6, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1605d6 implements Animator.AnimatorListener {
    public final /* synthetic */ int A00;
    public final /* synthetic */ int A01;
    public final /* synthetic */ C0775Ag A02;

    public C1605d6(C0775Ag c0775Ag, int i5, int i11) {
        this.A02 = c0775Ag;
        this.A01 = i5;
        this.A00 = i11;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        this.A02.A07(this.A00, this.A01, false);
        if (this.A02.A00 != null) {
            this.A02.A00.removeAllListeners();
            this.A02.A00 = null;
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        EnumC1637dc enumC1637dc;
        C0775Ag c0775Ag = this.A02;
        if (this.A01 == this.A02.A04) {
            enumC1637dc = EnumC1637dc.A03;
        } else {
            enumC1637dc = EnumC1637dc.A05;
        }
        c0775Ag.A01 = enumC1637dc;
        if (this.A02.A00 != null) {
            this.A02.A00.removeAllListeners();
            this.A02.A00 = null;
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
    }
}
