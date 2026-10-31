package com.bytedance.sdk.openadsdk.core.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;

@SuppressLint({"AppCompatCustomView"})
/* loaded from: classes2.dex */
public class syc extends com.bytedance.sdk.openadsdk.core.lt.dj {
    private Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private RectF f26331zb;

    public syc(Context context) {
        super(context);
        ycx();
    }

    private void ycx() {
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setStyle(Paint.Style.FILL_AND_STROKE);
        this.ycx.setColor(Color.parseColor("#99333333"));
        this.ycx.setAntiAlias(true);
        this.ycx.setStrokeWidth(0.0f);
        this.f26331zb = new RectF();
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas canvas) {
        RectF rectF = this.f26331zb;
        canvas.drawRoundRect(rectF, rectF.right / 2.0f, rectF.bottom / 2.0f, this.ycx);
        super.onDraw(canvas);
    }

    @Override // com.bytedance.sdk.openadsdk.core.lt.dj, android.widget.ImageView, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (this.f26331zb.right == getMeasuredWidth() && this.f26331zb.bottom == getMeasuredHeight()) {
            return;
        }
        this.f26331zb.set(0.0f, 0.0f, getMeasuredWidth(), getMeasuredHeight());
    }
}
