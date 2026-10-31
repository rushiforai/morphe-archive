package com.bytedance.sdk.openadsdk.core.lt;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RotateDrawable;
import android.graphics.drawable.ScaleDrawable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class lt extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private Drawable f25578dj;
    private ValueAnimator fby;

    /* renamed from: jw, reason: collision with root package name */
    private long f25579jw;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f25580lt;
    private Drawable lud;
    private Drawable sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f25581ul;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f25582zb;

    public lt(Context context) {
        super(context);
        this.ycx = 100;
    }

    private boolean sya() {
        return com.bytedance.sdk.openadsdk.utils.zb.lt();
    }

    private void ycx() {
        if (this.fby != null) {
            return;
        }
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(0, 10000);
        this.fby = valueAnimatorOfInt;
        valueAnimatorOfInt.setDuration(2000L);
        this.fby.setRepeatCount(-1);
        this.fby.setInterpolator(new LinearInterpolator());
        this.fby.setRepeatMode(1);
        this.fby.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.openadsdk.core.lt.lt.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                lt.this.setProgress(((Integer) valueAnimator.getAnimatedValue()).intValue());
            }
        });
        this.fby.start();
        setMax(10000);
    }

    private void zb() {
        ValueAnimator valueAnimator = this.fby;
        if (valueAnimator != null) {
            valueAnimator.cancel();
            this.fby.removeAllUpdateListeners();
            this.fby = null;
        }
        this.f25579jw = 0L;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f25580lt = true;
        if (this.lud != null) {
            ycx();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f25580lt = false;
        this.f25581ul = false;
        zb();
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
    }

    @Override // android.view.View
    public void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        if (i5 != 0) {
            ValueAnimator valueAnimator = this.fby;
            if (valueAnimator == null || this.f25581ul) {
                return;
            }
            this.f25581ul = true;
            valueAnimator.pause();
            return;
        }
        if (this.f25581ul) {
            this.f25581ul = false;
            ValueAnimator valueAnimator2 = this.fby;
            if (valueAnimator2 != null) {
                valueAnimator2.resume();
            } else {
                ycx();
            }
        }
    }

    public void setIndeterminateDrawable(Drawable drawable) {
        this.lud = drawable;
        setProgressDrawable(drawable);
        if (this.f25580lt && this.fby == null) {
            ycx();
        }
    }

    @Override // android.view.View
    public void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        super.setLayoutParams(jw.ycx(this, layoutParams));
    }

    public void setMax(int i5) {
        this.ycx = i5;
    }

    @Override // android.view.View
    public void setPadding(int i5, int i11, int i12, int i13) {
        super.setPaddingRelative(i5, i11, i12, i13);
    }

    public void setProgress(int i5) {
        if (ycx(i5) && this.f25582zb != i5) {
            this.f25582zb = i5;
            Drawable drawable = this.sya;
            if (drawable != null) {
                drawable.setLevel((int) ((i5 * 10000.0f) / this.ycx));
            }
        }
    }

    public void setProgressDrawable(Drawable drawable) {
        this.f25578dj = drawable;
        setBackground(drawable);
        this.sya = null;
        this.f25579jw = 0L;
        this.f25582zb = -1;
        Drawable drawable2 = this.f25578dj;
        if (drawable2 instanceof LayerDrawable) {
            int numberOfLayers = ((LayerDrawable) drawable2).getNumberOfLayers();
            for (int i5 = 0; i5 < numberOfLayers; i5++) {
                Drawable drawable3 = ((LayerDrawable) this.f25578dj).getDrawable(i5);
                if ((drawable3 instanceof ScaleDrawable) || (drawable3 instanceof ClipDrawable)) {
                    this.sya = drawable3;
                }
            }
        }
        Drawable drawable4 = this.f25578dj;
        if (drawable4 instanceof RotateDrawable) {
            this.sya = drawable4;
        }
    }

    public lt(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.ycx = 100;
    }

    private boolean ycx(int i5) {
        if (sya() && (this.sya instanceof RotateDrawable) && i5 != 0 && i5 < this.ycx) {
            long jUptimeMillis = SystemClock.uptimeMillis();
            if (jUptimeMillis - this.f25579jw < 48) {
                return false;
            }
            this.f25579jw = jUptimeMillis;
        }
        return true;
    }
}
