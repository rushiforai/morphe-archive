package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import b.u4;

/* loaded from: classes2.dex */
public class dy extends com.bytedance.sdk.openadsdk.core.lt.fby {
    private int sya;
    private Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private RectF f26292zb;

    public dy(Context context) {
        this(context, null);
    }

    private void ycx() {
        setTextColor(-1);
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setStyle(Paint.Style.FILL_AND_STROKE);
        this.ycx.setColor(Color.parseColor("#99333333"));
        this.ycx.setAntiAlias(true);
        this.ycx.setStrokeWidth(0.0f);
        this.f26292zb = new RectF();
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        RectF rectF = this.f26292zb;
        float f11 = rectF.bottom;
        canvas.drawRoundRect(rectF, f11 / 2.0f, f11 / 2.0f, this.ycx);
        canvas.translate((this.f26292zb.right / 2.0f) - (getPaint().measureText(getText().toString()) / 2.0f), 0.0f);
        super.onDraw(canvas);
    }

    @Override // com.bytedance.sdk.openadsdk.core.lt.fby, android.widget.TextView, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        int measuredWidth = getMeasuredWidth();
        int measuredHeight = getMeasuredHeight();
        if (measuredWidth <= 0 || measuredHeight <= 0) {
            this.f26292zb.set(0.0f, 0.0f, 0.0f, 0.0f);
            return;
        }
        int iMeasureText = (int) getPaint().measureText("00");
        this.sya = iMeasureText;
        if (measuredWidth < iMeasureText) {
            measuredWidth = iMeasureText;
        }
        int iB = u4.b(measuredHeight, 2, 2, measuredWidth);
        setMeasuredDimension(iB, measuredHeight);
        this.f26292zb.set(0.0f, 0.0f, iB, measuredHeight);
    }

    public dy(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public dy(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.sya = 0;
        ycx();
    }
}
