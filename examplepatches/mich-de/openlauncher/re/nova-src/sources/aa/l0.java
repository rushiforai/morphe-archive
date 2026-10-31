package aa;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;

/* loaded from: classes.dex */
public final class l0 {

    /* renamed from: i, reason: collision with root package name */
    public static final PorterDuffXfermode f606i = new PorterDuffXfermode(PorterDuff.Mode.CLEAR);

    /* renamed from: c, reason: collision with root package name */
    public float f609c;

    /* renamed from: d, reason: collision with root package name */
    public float f610d;

    /* renamed from: f, reason: collision with root package name */
    public float f612f;

    /* renamed from: a, reason: collision with root package name */
    public final RectF f607a = new RectF();

    /* renamed from: b, reason: collision with root package name */
    public int f608b = 25;

    /* renamed from: e, reason: collision with root package name */
    public int f611e = 7;

    /* renamed from: g, reason: collision with root package name */
    public final Paint f613g = new Paint(3);

    /* renamed from: h, reason: collision with root package name */
    public final Canvas f614h = new Canvas();

    public final Bitmap a(int i5, int i11, float f11, int i12, Bitmap bitmap) {
        this.f612f = f11;
        float f12 = i5;
        float f13 = f12 / 2.0f;
        int iMax = Math.max(Math.round(this.f609c + f13), Math.round(this.f612f + this.f609c + this.f610d));
        float f14 = i11;
        RectF rectF = this.f607a;
        rectF.set(0.0f, 0.0f, f12, f14);
        float f15 = iMax;
        rectF.offsetTo(f15 - f13, f15 - (f14 / 2.0f));
        int i13 = iMax * 2;
        Canvas canvas = this.f614h;
        if (bitmap != null && bitmap.getWidth() == i13 && bitmap.getHeight() == i13 && bitmap.getConfig() == Bitmap.Config.ARGB_8888) {
            bitmap.eraseColor(0);
            canvas.setBitmap(bitmap);
            b(canvas, i12);
            canvas.setBitmap(null);
            return bitmap;
        }
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i13, i13, Bitmap.Config.ARGB_8888);
        canvas.setBitmap(bitmapCreateBitmap);
        b(canvas, i12);
        canvas.setBitmap(null);
        return bitmapCreateBitmap;
    }

    public final void b(Canvas canvas, int i5) {
        Paint paintC = c();
        paintC.setColor(i5);
        paintC.setShadowLayer(this.f609c, 0.0f, this.f610d, p.d(-16777216, this.f611e));
        float f11 = this.f612f;
        RectF rectF = this.f607a;
        canvas.drawRoundRect(rectF, f11, f11, paintC);
        paintC.setShadowLayer(this.f609c, 0.0f, 0.0f, p.d(-16777216, this.f608b));
        float f12 = this.f612f;
        canvas.drawRoundRect(rectF, f12, f12, paintC);
        if (Color.alpha(i5) < 255) {
            paintC.setXfermode(f606i);
            paintC.clearShadowLayer();
            paintC.setColor(-16777216);
            float f13 = this.f612f;
            canvas.drawRoundRect(rectF, f13, f13, paintC);
            paintC.setXfermode(null);
            paintC.setColor(i5);
            float f14 = this.f612f;
            canvas.drawRoundRect(rectF, f14, f14, paintC);
        }
    }

    public final Paint c() {
        Paint paint = this.f613g;
        paint.clearShadowLayer();
        paint.setXfermode(null);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(-16777216);
        return paint;
    }

    public final void d(int i5) {
        float f11 = i5 * 1.0f;
        this.f609c = f11 / 24.0f;
        this.f610d = f11 / 16.0f;
    }
}
