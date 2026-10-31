package com.bytedance.sdk.openadsdk.core.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.NinePatchDrawable;

@SuppressLint({"AppCompatCustomView"})
/* loaded from: classes2.dex */
public class ycx extends com.bytedance.sdk.openadsdk.core.lt.dj {
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f26349zb;

    public ycx(Context context) {
        super(context);
        this.ycx = 0;
        this.f26349zb = 0;
    }

    private Paint getPaint() {
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setFilterBitmap(true);
        paint.setDither(true);
        return paint;
    }

    private int getRadius() {
        if (this.ycx == 0) {
            this.ycx = getWidth();
        }
        if (this.f26349zb == 0) {
            this.f26349zb = getHeight();
        }
        int i5 = this.ycx;
        int i11 = this.f26349zb;
        if (i5 >= i11) {
            i5 = i11;
        }
        return i5 / 2;
    }

    private boolean ycx() {
        return getDrawable() == null || getWidth() == 0 || getHeight() == 0;
    }

    private boolean zb() {
        if (getDrawable().getClass() != NinePatchDrawable.class) {
            return (getDrawable() instanceof BitmapDrawable) && ((BitmapDrawable) getDrawable()).getBitmap() == null;
        }
        return true;
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas canvas) {
        Bitmap bitmapCopy;
        Bitmap bitmapYcx;
        if (ycx()) {
            return;
        }
        measure(0, 0);
        if (zb()) {
            return;
        }
        try {
            bitmapCopy = ((BitmapDrawable) getDrawable()).getBitmap().copy(Bitmap.Config.ARGB_8888, true);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+SSRBLl9", "eOE/mwauQPE=", "VOAJhwKr", 48);
            bitmapCopy = null;
        }
        if (bitmapCopy == null) {
            super.onDraw(canvas);
            return;
        }
        try {
            bitmapYcx = ycx(bitmapCopy, getRadius());
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+SSRBLl9", "eOE/mwauQPE=", "VOAJhwKr", 58);
            bitmapYcx = null;
        }
        if (bitmapYcx == null) {
            super.onDraw(canvas);
        } else {
            canvas.drawBitmap(bitmapYcx, (this.ycx / 2) - r5, (this.f26349zb / 2) - r5, (Paint) null);
        }
    }

    private Bitmap ycx(Bitmap bitmap, int i5) {
        int i11 = i5 * 2;
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Bitmap bitmapCreateBitmap = height > width ? Bitmap.createBitmap(bitmap, 0, (height - width) / 2, width, width) : height < width ? Bitmap.createBitmap(bitmap, (width - height) / 2, 0, height, height) : null;
        if (bitmapCreateBitmap != null) {
            bitmap = bitmapCreateBitmap;
        }
        if (bitmap.getWidth() != i11 || bitmap.getHeight() != i11) {
            bitmap = Bitmap.createScaledBitmap(bitmap, i11, i11, true);
        }
        Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmapCreateBitmap2);
        Paint paint = getPaint();
        Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
        canvas.drawARGB(0, 0, 0, 0);
        canvas.drawCircle(bitmap.getWidth() / 2, bitmap.getHeight() / 2, bitmap.getWidth() / 2, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(bitmap, rect, rect, paint);
        return bitmapCreateBitmap2;
    }
}
