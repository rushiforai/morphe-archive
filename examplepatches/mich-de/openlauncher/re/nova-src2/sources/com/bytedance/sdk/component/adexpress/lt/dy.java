package com.bytedance.sdk.component.adexpress.lt;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import com.bytedance.sdk.openadsdk.TTAdConstant;

/* loaded from: classes2.dex */
public class dy extends View {

    /* renamed from: dj, reason: collision with root package name */
    private float f23543dj;

    /* renamed from: lt, reason: collision with root package name */
    private int f23544lt;
    private ValueAnimator lud;
    private RectF sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f23545ul;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Paint f23546zb;

    public dy(Context context) {
        super(context);
        this.f23544lt = TTAdConstant.STYLE_SIZE_RADIO_3_2;
        this.ycx = context;
        Paint paint = new Paint();
        this.f23546zb = paint;
        paint.setAntiAlias(true);
        this.f23546zb.setStyle(Paint.Style.STROKE);
        this.f23546zb.setStrokeWidth(10.0f);
        this.f23546zb.setColor(Color.parseColor("#80FFFFFF"));
        this.sya = new RectF();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.f23545ul) {
            return;
        }
        canvas.drawArc(this.sya, 270.0f, this.f23543dj, false, this.f23546zb);
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        setMeasuredDimension(Math.min(size, size2), Math.min(size, size2));
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        this.sya.set(5.0f, 5.0f, i5 - 5, i11 - 5);
    }

    public void setDuration(int i5) {
        this.f23544lt = i5;
    }

    public void sya() {
        this.f23545ul = true;
        invalidate();
    }

    public void zb() {
        ValueAnimator valueAnimator = this.lud;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
    }

    public void ycx() {
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 360.0f);
        this.lud = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(this.f23544lt);
        this.lud.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.component.adexpress.lt.dy.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                dy.this.f23543dj = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                dy.this.requestLayout();
            }
        });
        this.lud.start();
    }
}
