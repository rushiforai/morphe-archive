package com.bytedance.sdk.openadsdk.core.ry.zb.lud;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.text.TextUtils;
import android.view.View;
import android.view.animation.LinearInterpolator;
import com.bytedance.adsdk.ugeno.lud;

/* loaded from: classes2.dex */
public class ycx extends View {

    /* renamed from: dj, reason: collision with root package name */
    private int f26023dj;

    /* renamed from: ea, reason: collision with root package name */
    private lud f26024ea;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f26025jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f26026jw;

    /* renamed from: lt, reason: collision with root package name */
    private float f26027lt;
    private int lud;

    /* renamed from: ok, reason: collision with root package name */
    private ValueAnimator f26028ok;

    /* renamed from: ry, reason: collision with root package name */
    private int f26029ry;
    private RectF sya;

    /* renamed from: ul, reason: collision with root package name */
    private float f26030ul;
    private float xkz;
    private Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Paint f26031zb;

    public ycx(Context context) {
        super(context);
        this.f26023dj = com.bytedance.adsdk.ugeno.fby.ycx.ycx("#FFD813");
        this.lud = com.bytedance.adsdk.ugeno.fby.ycx.ycx("rgba(0, 0, 0, 0.5)");
        this.f26027lt = 3.0f;
        this.f26030ul = 0.0f;
        this.fby = 0;
        this.f26026jw = 100;
        this.f26025jc = "line";
        this.f26029ry = 1000;
        setBackgroundColor(0);
        ycx();
    }

    private void zb(Canvas canvas) {
        Paint paint = this.ycx;
        Paint.Style style = Paint.Style.FILL;
        paint.setStyle(style);
        float width = getWidth();
        float f11 = this.f26027lt;
        float f12 = this.f26030ul;
        canvas.drawRoundRect(0.0f, 0.0f, width, f11, f12, f12, this.ycx);
        float width2 = (getWidth() * this.xkz) / this.f26026jw;
        this.f26031zb.setStyle(style);
        if (!TextUtils.equals(this.f26025jc, "line_reverse")) {
            float f13 = this.f26027lt;
            float f14 = this.f26030ul;
            canvas.drawRoundRect(0.0f, 0.0f, width2, f13, f14, f14, this.f26031zb);
        } else {
            float width3 = getWidth() - width2;
            float width4 = getWidth();
            float f15 = this.f26027lt;
            float f16 = this.f26030ul;
            canvas.drawRoundRect(width3, 0.0f, width4, f15, f16, f16, this.f26031zb);
        }
    }

    public int getMaxProgress() {
        return this.f26026jw;
    }

    public int getProgress() {
        return this.fby;
    }

    @Override // android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ValueAnimator valueAnimator = this.f26028ok;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (TextUtils.equals(this.f26025jc, "ring") || TextUtils.equals(this.f26025jc, "ring_reverse")) {
            ycx(canvas);
        } else {
            zb(canvas);
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        lud ludVar = this.f26024ea;
        if (ludVar != null) {
            int[] iArrYcx = ludVar.ycx(i5, i11);
            super.onMeasure(iArrYcx[0], iArrYcx[1]);
        } else {
            super.onMeasure(i5, i11);
        }
        if (TextUtils.equals(this.f26025jc, "ring") || TextUtils.equals(this.f26025jc, "ring_reverse")) {
            int iMin = Math.min(getMeasuredWidth(), getMeasuredHeight());
            setMeasuredDimension(iMin, iMin);
        } else {
            setMeasuredDimension(getMeasuredWidth(), (int) this.f26027lt);
        }
        lud ludVar2 = this.f26024ea;
        if (ludVar2 != null) {
            ludVar2.lud();
        }
    }

    public void setAnimationDuration(int i5) {
        this.f26029ry = i5;
        this.f26028ok.setDuration(i5);
    }

    public void setMaxProgress(int i5) {
        this.f26026jw = i5;
        invalidate();
    }

    public void setProgress(int i5) {
        int iMin = Math.min(i5, this.f26026jw);
        this.fby = iMin;
        if (iMin < 0) {
            this.fby = 0;
        }
        ValueAnimator valueAnimator = this.f26028ok;
        if (valueAnimator != null) {
            valueAnimator.cancel();
            this.f26028ok.setFloatValues(this.xkz, this.fby);
            this.f26028ok.start();
        }
    }

    private void ycx() {
        Paint paint = new Paint(1);
        this.ycx = paint;
        paint.setColor(this.lud);
        Paint paint2 = this.ycx;
        Paint.Style style = Paint.Style.FILL;
        paint2.setStyle(style);
        Paint paint3 = new Paint(1);
        this.f26031zb = paint3;
        paint3.setColor(this.f26023dj);
        this.f26031zb.setStyle(style);
        this.sya = new RectF();
        this.xkz = this.fby;
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(new float[0]);
        this.f26028ok = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(this.f26029ry);
        this.f26028ok.setInterpolator(new LinearInterpolator());
        this.f26028ok.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                ycx.this.xkz = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                ycx.this.invalidate();
            }
        });
    }

    public ycx zb(int i5) {
        this.ycx.setColor(i5);
        return this;
    }

    public ycx zb(float f11) {
        this.f26030ul = f11;
        return this;
    }

    private void ycx(Canvas canvas) {
        float f11;
        int i5;
        float f12 = this.f26027lt / 2.0f;
        this.sya.set(f12, f12, getWidth() - f12, getHeight() - f12);
        Paint paint = this.ycx;
        Paint.Style style = Paint.Style.STROKE;
        paint.setStyle(style);
        this.ycx.setStrokeWidth(this.f26027lt);
        canvas.drawCircle(getWidth() / 2.0f, getHeight() / 2.0f, (getWidth() / 2.0f) - f12, this.ycx);
        if (TextUtils.equals(this.f26025jc, "ring_reverse")) {
            f11 = this.xkz * (-360.0f);
            i5 = this.f26026jw;
        } else {
            f11 = this.xkz * 360.0f;
            i5 = this.f26026jw;
        }
        float f13 = f11 / i5;
        this.f26031zb.setStyle(style);
        this.f26031zb.setStrokeWidth(this.f26027lt);
        if (this.f26030ul <= 0.0f) {
            this.f26031zb.setStrokeCap(Paint.Cap.SQUARE);
        } else {
            this.f26031zb.setStrokeCap(Paint.Cap.ROUND);
        }
        canvas.drawArc(this.sya, -90.0f, f13, false, this.f26031zb);
    }

    public ycx ycx(int i5) {
        this.f26031zb.setColor(i5);
        return this;
    }

    public ycx ycx(float f11) {
        this.f26027lt = f11;
        invalidate();
        return this;
    }

    public ycx ycx(String str) {
        this.f26025jc = str;
        return this;
    }

    public void ycx(lud ludVar) {
        this.f26024ea = ludVar;
    }
}
