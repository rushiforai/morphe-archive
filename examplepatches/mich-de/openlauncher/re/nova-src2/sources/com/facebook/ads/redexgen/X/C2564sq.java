package com.facebook.ads.redexgen.X;

import android.animation.Animator;
import android.animation.TimeInterpolator;

/* renamed from: com.facebook.ads.redexgen.X.sq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2564sq extends Animator {
    public final /* synthetic */ int A00;
    public final /* synthetic */ InterfaceC2553sf A01;
    public final /* synthetic */ C2566ss A02;

    public C2564sq(C2566ss c2566ss, int i5, InterfaceC2553sf interfaceC2553sf) {
        this.A02 = c2566ss;
        this.A00 = i5;
        this.A01 = interfaceC2553sf;
    }

    @Override // android.animation.Animator
    public final void addListener(Animator.AnimatorListener animatorListener) {
    }

    @Override // android.animation.Animator
    public final void cancel() {
    }

    @Override // android.animation.Animator
    public final void end() {
    }

    @Override // android.animation.Animator
    public final long getDuration() {
        return this.A00;
    }

    @Override // android.animation.Animator
    public final long getStartDelay() {
        return 0L;
    }

    @Override // android.animation.Animator
    public final boolean isRunning() {
        return this.A02.A04;
    }

    @Override // android.animation.Animator
    public final Animator setDuration(long j11) {
        return null;
    }

    @Override // android.animation.Animator
    public final void setInterpolator(TimeInterpolator timeInterpolator) {
    }

    @Override // android.animation.Animator
    public final void setStartDelay(long j11) {
    }

    @Override // android.animation.Animator
    public final void setTarget(Object obj) {
        this.A01.ALQ(obj, getDuration());
    }

    @Override // android.animation.Animator
    public final void start() {
    }
}
