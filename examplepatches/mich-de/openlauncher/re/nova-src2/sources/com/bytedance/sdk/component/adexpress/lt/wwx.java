package com.bytedance.sdk.component.adexpress.lt;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.PathInterpolator;

/* loaded from: classes2.dex */
public class wwx extends View {
    private static int sya = 50;

    /* renamed from: dj, reason: collision with root package name */
    private ObjectAnimator f23618dj;
    private Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23619zb;

    public wwx(Context context) {
        this(context, null);
    }

    private void sya() {
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setAntiAlias(true);
        this.ycx.setColor(Color.parseColor("#FFFFFFFF"));
        this.ycx.setStyle(Paint.Style.STROKE);
        this.ycx.setStrokeWidth(18.0f);
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, "alpha", 1.0f, 0.0f);
        this.f23618dj = objectAnimatorOfFloat;
        objectAnimatorOfFloat.setDuration(200L);
    }

    @Override // android.view.View
    public void invalidate() {
        if (hasWindowFocus()) {
            super.invalidate();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        this.ycx.setShader(new LinearGradient(getMeasuredWidth() / 2, 0.0f, getMeasuredWidth() / 2, getMeasuredHeight(), -1, 16777215, Shader.TileMode.CLAMP));
        canvas.drawCircle(getMeasuredWidth() / 2.0f, getMeasuredHeight() / 2.0f, this.f23619zb, this.ycx);
    }

    public void zb() {
        clearAnimation();
    }

    public wwx(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, -1);
    }

    public wwx(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.f23619zb = 10;
        sya();
    }

    public void ycx() {
        int iMin = ((int) Math.min(getMeasuredWidth() / 2.0f, getMeasuredHeight() / 2.0f)) - 18;
        sya = iMin;
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(10, iMin);
        valueAnimatorOfInt.setInterpolator(new PathInterpolator(0.0f, 0.2f, 0.3f, 1.0f));
        valueAnimatorOfInt.setDuration(800L);
        valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.component.adexpress.lt.wwx.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                wwx.this.f23619zb = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                wwx.this.invalidate();
            }
        });
        valueAnimatorOfInt.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.lt.wwx.2
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                wwx.this.f23618dj.start();
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
                wwx.this.setVisibility(0);
                wwx.this.setAlpha(1.0f);
            }
        });
        valueAnimatorOfInt.start();
    }
}
