package com.bytedance.sdk.openadsdk.core.widget;

import a5.k;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;

/* loaded from: classes2.dex */
public class pmi extends com.bytedance.sdk.openadsdk.core.lt.dj {

    /* renamed from: dj, reason: collision with root package name */
    private final Matrix f26328dj;

    /* renamed from: lt, reason: collision with root package name */
    private BitmapShader f26329lt;
    private final RectF lud;
    private int sya;
    private final Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f26330zb;

    public pmi(Context context) {
        this(context, null);
    }

    private Bitmap ycx(Drawable drawable) {
        if (drawable == null) {
            return null;
        }
        if (drawable instanceof BitmapDrawable) {
            return ((BitmapDrawable) drawable).getBitmap();
        }
        int width = drawable.getIntrinsicWidth() <= 0 ? getWidth() : drawable.getIntrinsicWidth();
        int height = drawable.getIntrinsicHeight() <= 0 ? getHeight() : drawable.getIntrinsicHeight();
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmapCreateBitmap);
        drawable.setBounds(0, 0, width, height);
        drawable.draw(canvas);
        return bitmapCreateBitmap;
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas canvas) {
        Bitmap bitmapYcx;
        Drawable drawable = getDrawable();
        if (drawable == null) {
            super.onDraw(canvas);
            return;
        }
        if (Build.VERSION.SDK_INT >= 28 && k.u(drawable)) {
            super.onDraw(canvas);
            return;
        }
        if (this.f26329lt == null && (bitmapYcx = ycx(drawable)) != null) {
            Shader.TileMode tileMode = Shader.TileMode.REPEAT;
            this.f26329lt = new BitmapShader(bitmapYcx, tileMode, tileMode);
            float fMax = (bitmapYcx.getWidth() == getWidth() && bitmapYcx.getHeight() == getHeight()) ? 1.0f : Math.max((getWidth() * 1.0f) / bitmapYcx.getWidth(), (getHeight() * 1.0f) / bitmapYcx.getHeight());
            this.f26328dj.setScale(fMax, fMax);
            this.f26329lt.setLocalMatrix(this.f26328dj);
        }
        BitmapShader bitmapShader = this.f26329lt;
        if (bitmapShader == null) {
            super.onDraw(canvas);
        } else {
            this.ycx.setShader(bitmapShader);
            canvas.drawRoundRect(this.lud, this.f26330zb, this.sya, this.ycx);
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        this.lud.set(0.0f, 0.0f, i5, i11);
    }

    public void setXRound(int i5) {
        this.f26330zb = i5;
        postInvalidate();
    }

    public void setYRound(int i5) {
        this.sya = i5;
        postInvalidate();
    }

    @Override // android.view.View
    public void unscheduleDrawable(Drawable drawable) {
        super.unscheduleDrawable(drawable);
        this.f26329lt = null;
    }

    public pmi(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public pmi(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.f26330zb = 25;
        this.sya = 25;
        this.lud = new RectF();
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setAntiAlias(true);
        paint.setFilterBitmap(true);
        this.f26328dj = new Matrix();
    }
}
