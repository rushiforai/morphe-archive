package l10;

import android.graphics.Bitmap;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import e10.z2;
import kotlin.jvm.internal.Intrinsics;
import mx.g0;

/* loaded from: classes4.dex */
public final class y extends DrawableWrapper implements a {

    /* renamed from: a, reason: collision with root package name */
    public final int f74490a;

    /* renamed from: b, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f74491b;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f74492c;

    /* renamed from: d, reason: collision with root package name */
    public final Paint f74493d;

    /* renamed from: e, reason: collision with root package name */
    public final Rect f74494e;

    /* renamed from: f, reason: collision with root package name */
    public int f74495f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(Drawable drawable) {
        super(drawable);
        int intrinsicWidth = drawable.getIntrinsicWidth();
        int intrinsicHeight = drawable.getIntrinsicHeight();
        this.f74490a = intrinsicWidth;
        Bitmap bitmapA = z2.A(drawable, intrinsicWidth, intrinsicHeight);
        float f11 = g0.f77092e;
        BlurMaskFilter.Blur blur = BlurMaskFilter.Blur.NORMAL;
        BlurMaskFilter blurMaskFilter = new BlurMaskFilter(0.25f * f11, blur);
        BlurMaskFilter blurMaskFilter2 = new BlurMaskFilter(0.625f * f11, blur);
        Paint paint = new Paint(3);
        Canvas canvas = new Canvas();
        int i5 = (int) (1.25f * f11);
        int i11 = (int) (f11 * 2.0f);
        int i12 = i11 * 2;
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(bitmapA.getWidth() + i12, bitmapA.getHeight() + i12, Bitmap.Config.ARGB_8888);
        canvas.setBitmap(bitmapCreateBitmap);
        canvas.drawBitmap(bitmapA, 0.0f, 0.0f, paint);
        paint.setMaskFilter(blurMaskFilter);
        paint.setAlpha(255);
        Bitmap bitmapExtractAlpha = bitmapCreateBitmap.extractAlpha(paint, new int[2]);
        paint.setMaskFilter(blurMaskFilter2);
        Bitmap bitmapExtractAlpha2 = bitmapCreateBitmap.extractAlpha(paint, new int[2]);
        canvas.drawColor(0, PorterDuff.Mode.CLEAR);
        float f12 = i11;
        canvas.translate(f12, f12);
        int iSave = canvas.save();
        canvas.translate(r11[0], r11[1]);
        paint.setMaskFilter(null);
        paint.setColor(-16777216);
        paint.setAlpha(30);
        canvas.drawBitmap(bitmapExtractAlpha, 0.0f, 0.0f, paint);
        canvas.restoreToCount(iSave);
        bitmapExtractAlpha.recycle();
        int iSave2 = canvas.save();
        canvas.translate(r1[0], r1[1]);
        paint.setMaskFilter(null);
        paint.setColor(-16777216);
        paint.setAlpha(45);
        canvas.drawBitmap(bitmapExtractAlpha2, 0.0f, i5, paint);
        canvas.restoreToCount(iSave2);
        canvas.setBitmap(null);
        bitmapExtractAlpha2.recycle();
        this.f74491b = new com.google.android.gms.internal.consent_sdk.a(bitmapCreateBitmap, i11, i11);
        this.f74492c = new Paint(3);
        Paint paint2 = new Paint(3);
        paint2.setAlpha(0);
        this.f74493d = paint2;
        this.f74494e = new Rect();
    }

    @Override // l10.a
    public final void a(int i5) {
        int iE0 = kotlin.ranges.a.e0(i5, 0, 255);
        this.f74495f = iE0;
        int alpha = (getAlpha() * iE0) / 255;
        Paint paint = this.f74493d;
        if (alpha != paint.getAlpha()) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Canvas canvas2;
        float fWidth = getBounds().width() / this.f74490a;
        Paint paint = this.f74493d;
        if (paint.getAlpha() > 0) {
            canvas2 = canvas;
            this.f74491b.i(canvas2, fWidth, getBounds(), this.f74494e, paint);
            this.f74491b.i(canvas2, fWidth, getBounds(), this.f74494e, paint);
        } else {
            canvas2 = canvas;
        }
        this.f74491b.i(canvas2, fWidth, getBounds(), this.f74494e, this.f74492c);
        super.draw(canvas2);
    }

    @Override // android.graphics.drawable.DrawableWrapper
    public final Drawable getDrawable() {
        Drawable drawable = super.getDrawable();
        Intrinsics.d(drawable);
        return drawable;
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        super.setAlpha(i5);
        this.f74492c.setAlpha(i5);
        this.f74493d.setAlpha((this.f74495f * i5) / 255);
    }
}
