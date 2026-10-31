package com.fyber.inneractive.sdk.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.ProgressBar;

/* loaded from: classes3.dex */
public class IAsmoothProgressBar extends ProgressBar {

    /* renamed from: c, reason: collision with root package name */
    public static final AccelerateDecelerateInterpolator f31136c = new AccelerateDecelerateInterpolator();

    /* renamed from: a, reason: collision with root package name */
    public ValueAnimator f31137a;

    /* renamed from: b, reason: collision with root package name */
    public ValueAnimator f31138b;

    public IAsmoothProgressBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.widget.ProgressBar, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ValueAnimator valueAnimator = this.f31137a;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        ValueAnimator valueAnimator2 = this.f31138b;
        if (valueAnimator2 != null) {
            valueAnimator2.cancel();
        }
    }

    @Override // android.widget.ProgressBar
    public synchronized void setProgress(int i5) {
        try {
            ValueAnimator valueAnimator = this.f31137a;
            if (valueAnimator != null) {
                valueAnimator.cancel();
            }
            ValueAnimator valueAnimator2 = this.f31137a;
            if (valueAnimator2 == null) {
                ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(getProgress(), i5);
                this.f31137a = valueAnimatorOfInt;
                valueAnimatorOfInt.setInterpolator(f31136c);
                this.f31137a.addUpdateListener(new g(this));
            } else {
                valueAnimator2.setIntValues(getProgress(), i5);
            }
            this.f31137a.start();
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // android.widget.ProgressBar
    public synchronized void setSecondaryProgress(int i5) {
        try {
            ValueAnimator valueAnimator = this.f31138b;
            if (valueAnimator != null) {
                valueAnimator.cancel();
            }
            ValueAnimator valueAnimator2 = this.f31138b;
            if (valueAnimator2 == null) {
                ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(getProgress(), i5);
                this.f31138b = valueAnimatorOfInt;
                valueAnimatorOfInt.setInterpolator(f31136c);
                this.f31138b.addUpdateListener(new h(this));
            } else {
                valueAnimator2.setIntValues(getProgress(), i5);
            }
            this.f31138b.start();
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public IAsmoothProgressBar(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
    }
}
