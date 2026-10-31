package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public class uh extends Drawable {

    /* renamed from: dj, reason: collision with root package name */
    private RectF f23425dj;
    private int sya;
    private Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23426zb;

    public uh(int i5, int i11) {
        this.sya = i5;
        this.f23426zb = i11;
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setColor(0);
        this.ycx.setAntiAlias(true);
        this.ycx.setShadowLayer(i11, 0.0f, 0.0f, -16777216);
        this.ycx.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_ATOP));
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        RectF rectF = this.f23425dj;
        int i5 = this.sya;
        canvas.drawRoundRect(rectF, i5, i5, this.ycx);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i5) {
        this.ycx.setAlpha(i5);
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(int i5, int i11, int i12, int i13) {
        super.setBounds(i5, i11, i12, i13);
        int i14 = this.f23426zb;
        this.f23425dj = new RectF(i5 + i14, i11 + i14, i12 - i14, i13 - i14);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.ycx.setColorFilter(colorFilter);
    }
}
