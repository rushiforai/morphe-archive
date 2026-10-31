package com.bytedance.sdk.component.adexpress.lt;

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
import android.widget.ImageView;

/* loaded from: classes2.dex */
public class dv extends ImageView {

    /* renamed from: dj, reason: collision with root package name */
    private Matrix f23541dj;
    private int sya;
    private Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23542zb;

    public dv(Context context) {
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
        Drawable drawable = getDrawable();
        if (Build.VERSION.SDK_INT >= 28 && k.u(drawable)) {
            super.onDraw(canvas);
            return;
        }
        if (drawable == null) {
            super.onDraw(canvas);
            return;
        }
        Bitmap bitmapYcx = ycx(drawable);
        if (bitmapYcx == null) {
            super.onDraw(canvas);
            return;
        }
        Shader.TileMode tileMode = Shader.TileMode.REPEAT;
        BitmapShader bitmapShader = new BitmapShader(bitmapYcx, tileMode, tileMode);
        float fMax = (bitmapYcx.getWidth() == getWidth() && bitmapYcx.getHeight() == getHeight()) ? 1.0f : Math.max((getWidth() * 1.0f) / bitmapYcx.getWidth(), (getHeight() * 1.0f) / bitmapYcx.getHeight());
        this.f23541dj.setScale(fMax, fMax);
        bitmapShader.setLocalMatrix(this.f23541dj);
        this.ycx.setShader(bitmapShader);
        canvas.drawRoundRect(new RectF(0.0f, 0.0f, getWidth(), getHeight()), this.f23542zb, this.sya, this.ycx);
    }

    public void setXRound(int i5) {
        this.f23542zb = i5;
        postInvalidate();
    }

    public void setYRound(int i5) {
        this.sya = i5;
        postInvalidate();
    }

    public dv(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public dv(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.f23542zb = 25;
        this.sya = 25;
        Paint paint = new Paint();
        this.ycx = paint;
        paint.setAntiAlias(true);
        this.ycx.setFilterBitmap(true);
        this.f23541dj = new Matrix();
    }
}
