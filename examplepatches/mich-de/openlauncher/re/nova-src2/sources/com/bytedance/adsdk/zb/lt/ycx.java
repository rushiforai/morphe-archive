package com.bytedance.adsdk.zb.lt;

import android.animation.Animator;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

/* loaded from: classes2.dex */
public abstract class ycx extends ValueAnimator {
    private final Set<ValueAnimator.AnimatorUpdateListener> ycx = new CopyOnWriteArraySet();

    /* renamed from: zb, reason: collision with root package name */
    private final Set<Animator.AnimatorListener> f22923zb = new CopyOnWriteArraySet();
    private final Set<Animator.AnimatorPauseListener> sya = new CopyOnWriteArraySet();

    @Override // android.animation.Animator
    public void addListener(Animator.AnimatorListener animatorListener) {
        this.f22923zb.add(animatorListener);
    }

    @Override // android.animation.Animator
    public void addPauseListener(Animator.AnimatorPauseListener animatorPauseListener) {
        this.sya.add(animatorPauseListener);
    }

    @Override // android.animation.ValueAnimator
    public void addUpdateListener(ValueAnimator.AnimatorUpdateListener animatorUpdateListener) {
        this.ycx.add(animatorUpdateListener);
    }

    public void dj() {
        Iterator<Animator.AnimatorPauseListener> it = this.sya.iterator();
        while (it.hasNext()) {
            it.next().onAnimationPause(this);
        }
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public long getStartDelay() {
        throw new UnsupportedOperationException("LottieAnimator does not support getStartDelay.");
    }

    public void lud() {
        Iterator<Animator.AnimatorPauseListener> it = this.sya.iterator();
        while (it.hasNext()) {
            it.next().onAnimationResume(this);
        }
    }

    @Override // android.animation.Animator
    public void removeAllListeners() {
        this.f22923zb.clear();
    }

    @Override // android.animation.ValueAnimator
    public void removeAllUpdateListeners() {
        this.ycx.clear();
    }

    @Override // android.animation.Animator
    public void removeListener(Animator.AnimatorListener animatorListener) {
        this.f22923zb.remove(animatorListener);
    }

    @Override // android.animation.Animator
    public void removePauseListener(Animator.AnimatorPauseListener animatorPauseListener) {
        this.sya.remove(animatorPauseListener);
    }

    @Override // android.animation.ValueAnimator
    public void removeUpdateListener(ValueAnimator.AnimatorUpdateListener animatorUpdateListener) {
        this.ycx.remove(animatorUpdateListener);
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public void setInterpolator(TimeInterpolator timeInterpolator) {
        throw new UnsupportedOperationException("LottieAnimator does not support setInterpolator.");
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public void setStartDelay(long j11) {
        throw new UnsupportedOperationException("LottieAnimator does not support setStartDelay.");
    }

    public void sya() {
        Iterator<ValueAnimator.AnimatorUpdateListener> it = this.ycx.iterator();
        while (it.hasNext()) {
            it.next().onAnimationUpdate(this);
        }
    }

    public void ycx(boolean z11) {
        Iterator<Animator.AnimatorListener> it = this.f22923zb.iterator();
        while (it.hasNext()) {
            it.next().onAnimationStart(this, z11);
        }
    }

    public void zb(boolean z11) {
        Iterator<Animator.AnimatorListener> it = this.f22923zb.iterator();
        while (it.hasNext()) {
            it.next().onAnimationEnd(this, z11);
        }
    }

    @Override // android.animation.ValueAnimator, android.animation.Animator
    public ValueAnimator setDuration(long j11) {
        throw new UnsupportedOperationException("LottieAnimator does not support setDuration.");
    }

    public void ycx() {
        Iterator<Animator.AnimatorListener> it = this.f22923zb.iterator();
        while (it.hasNext()) {
            it.next().onAnimationRepeat(this);
        }
    }

    public void zb() {
        Iterator<Animator.AnimatorListener> it = this.f22923zb.iterator();
        while (it.hasNext()) {
            it.next().onAnimationCancel(this);
        }
    }
}
