package com.facebook.ads.redexgen.X;

import android.view.animation.Animation;

/* renamed from: com.facebook.ads.redexgen.X.rD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class AnimationAnimationListenerC2463rD implements Animation.AnimationListener {
    public static String[] A01 = {"8IdBg76XDQhHV6ZNgAV82dxqr3qopBcC", "K3AFTLmqDFowmgg", "XZlSGCmsNdCxctT7moBMal93216", "PG6TpN9nKZLFCjp", "kR6NUZVGoI5i5PXC7LDbYJdl6waWi21L", "bvxntXqHHz2tX8g5qrh", "604gnkF1ssIoMZbQD5RaZVqtzuTXMB2N", "2qo0FzIQRnGBsqPGYhuqd1YCmSRcvgeS"};
    public final /* synthetic */ AnonymousClass78 A00;

    public AnimationAnimationListenerC2463rD(AnonymousClass78 anonymousClass78) {
        this.A00 = anonymousClass78;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        this.A00.A06();
        if (this.A00.A04 > 0) {
            this.A00.A05.postDelayed(this.A00.A07, this.A00.A04);
        }
        AnonymousClass78 anonymousClass78 = this.A00;
        String[] strArr = A01;
        if (strArr[1].length() != strArr[3].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[2] = "TzgVInfg9PMCqGbIVdWtSgP5Nd1";
        strArr2[5] = "y7EfqeiK2vh3iPeSQ6t";
        anonymousClass78.A0J();
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
    }
}
