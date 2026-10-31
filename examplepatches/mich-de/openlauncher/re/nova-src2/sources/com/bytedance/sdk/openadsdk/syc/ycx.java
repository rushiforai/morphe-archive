package com.bytedance.sdk.openadsdk.syc;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.View;

/* loaded from: classes2.dex */
public class ycx extends View {
    private float sya;
    private final Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f27027zb;

    public ycx(Context context) {
        super(context);
        setBackgroundColor(Color.parseColor("#8A8A8A"));
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setColor(-1);
        paint.setStyle(Paint.Style.FILL);
        paint.setStrokeCap(Paint.Cap.ROUND);
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float f11 = this.sya;
        if (f11 > 0.0f) {
            float f12 = this.f27027zb;
            canvas.drawLine(0.0f, f12, f11, f12, this.ycx);
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        float f11 = i11;
        this.f27027zb = (1.0f * f11) / 2.0f;
        this.ycx.setStrokeWidth(f11);
    }

    public void setProgress(float f11) {
        this.sya = getWidth() * f11;
        invalidate();
    }
}
