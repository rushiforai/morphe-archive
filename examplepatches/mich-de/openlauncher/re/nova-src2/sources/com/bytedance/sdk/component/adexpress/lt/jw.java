package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;

/* loaded from: classes2.dex */
public class jw extends View {

    /* renamed from: dj, reason: collision with root package name */
    private Paint f23561dj;
    private int fby;

    /* renamed from: lt, reason: collision with root package name */
    private int f23562lt;
    private Paint lud;
    private final RectF sya;

    /* renamed from: ul, reason: collision with root package name */
    private Paint f23563ul;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23564zb;

    public jw(Context context) {
        super(context);
        this.sya = new RectF();
        ycx();
    }

    private void ycx() {
        Paint paint = new Paint();
        this.f23561dj = paint;
        paint.setAntiAlias(true);
        Paint paint2 = new Paint();
        this.f23563ul = paint2;
        paint2.setAntiAlias(true);
        Paint paint3 = new Paint();
        this.lud = paint3;
        paint3.setAntiAlias(true);
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        RectF rectF = this.sya;
        int i5 = this.f23562lt;
        canvas.drawRoundRect(rectF, i5, i5, this.lud);
        RectF rectF2 = this.sya;
        int i11 = this.f23562lt;
        canvas.drawRoundRect(rectF2, i11, i11, this.f23561dj);
        int i12 = this.ycx;
        int i13 = this.f23564zb;
        canvas.drawLine(i12 * 0.3f, i13 * 0.3f, i12 * 0.7f, i13 * 0.7f, this.f23563ul);
        int i14 = this.ycx;
        int i15 = this.f23564zb;
        canvas.drawLine(i14 * 0.7f, i15 * 0.3f, i14 * 0.3f, i15 * 0.7f, this.f23563ul);
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        this.ycx = i5;
        this.f23564zb = i11;
        RectF rectF = this.sya;
        int i14 = this.fby;
        rectF.set(i14, i14, i5 - i14, i11 - i14);
    }

    public void setBgColor(int i5) {
        this.lud.setStyle(Paint.Style.FILL);
        this.lud.setColor(i5);
    }

    public void setDislikeColor(int i5) {
        this.f23563ul.setColor(i5);
    }

    public void setDislikeWidth(int i5) {
        this.f23563ul.setStrokeWidth(i5);
    }

    public void setRadius(int i5) {
        this.f23562lt = i5;
    }

    public void setStrokeColor(int i5) {
        this.f23561dj.setStyle(Paint.Style.STROKE);
        this.f23561dj.setColor(i5);
    }

    public void setStrokeWidth(int i5) {
        this.f23561dj.setStrokeWidth(i5);
        this.fby = i5;
    }
}
