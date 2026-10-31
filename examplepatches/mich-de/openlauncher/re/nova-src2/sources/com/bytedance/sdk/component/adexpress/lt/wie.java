package com.bytedance.sdk.component.adexpress.lt;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;
import android.view.animation.LinearInterpolator;

/* loaded from: classes2.dex */
public class wie extends View {

    /* renamed from: dj, reason: collision with root package name */
    private ValueAnimator f23612dj;
    private float fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f23613jc;

    /* renamed from: jw, reason: collision with root package name */
    private Animator.AnimatorListener f23614jw;

    /* renamed from: lt, reason: collision with root package name */
    private long f23615lt;
    private Paint lud;
    private ValueAnimator sya;

    /* renamed from: ul, reason: collision with root package name */
    private float f23616ul;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23617zb;

    public wie(Context context, int i5) {
        super(context);
        this.f23615lt = 300L;
        this.f23616ul = 0.0f;
        this.f23613jc = i5;
        ycx();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawCircle(this.ycx, this.f23617zb, this.f23616ul, this.lud);
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        this.ycx = i5 / 2.0f;
        this.f23617zb = i11 / 2.0f;
        this.fby = (float) (Math.hypot(i5, i11) / 2.0d);
    }

    public void setAnimationListener(Animator.AnimatorListener animatorListener) {
        this.f23614jw = animatorListener;
    }

    public void sya() {
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(this.fby, 0.0f);
        this.f23612dj = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(this.f23615lt);
        this.f23612dj.setInterpolator(new LinearInterpolator());
        this.f23612dj.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.component.adexpress.lt.wie.2
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                wie.this.f23616ul = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                wie.this.invalidate();
            }
        });
        Animator.AnimatorListener animatorListener = this.f23614jw;
        if (animatorListener != null) {
            this.f23612dj.addListener(animatorListener);
        }
        this.f23612dj.start();
    }

    public void zb() {
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, this.fby);
        this.sya = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(this.f23615lt);
        this.sya.setInterpolator(new LinearInterpolator());
        this.sya.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.component.adexpress.lt.wie.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                wie.this.f23616ul = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                wie.this.invalidate();
            }
        });
        this.sya.start();
    }

    public void ycx() {
        Paint paint = new Paint(1);
        this.lud = paint;
        paint.setStyle(Paint.Style.FILL);
        this.lud.setColor(this.f23613jc);
    }
}
