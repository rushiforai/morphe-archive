package fz;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.RegionIterator;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import java.nio.ByteBuffer;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f56235a;

    /* renamed from: b, reason: collision with root package name */
    public final Bitmap f56236b;

    /* renamed from: c, reason: collision with root package name */
    public final Canvas f56237c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f56238d;

    /* renamed from: e, reason: collision with root package name */
    public final RectF f56239e;

    /* renamed from: f, reason: collision with root package name */
    public float f56240f;

    /* renamed from: g, reason: collision with root package name */
    public final float[] f56241g;

    /* renamed from: h, reason: collision with root package name */
    public final float[] f56242h;

    /* renamed from: i, reason: collision with root package name */
    public final Rect f56243i;

    /* renamed from: j, reason: collision with root package name */
    public final int f56244j;

    /* renamed from: k, reason: collision with root package name */
    public final Paint f56245k;

    public f0(Context context, int i5) {
        int i11 = i5 * 2;
        this.f56235a = i11;
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i11, i11, Bitmap.Config.ALPHA_8);
        this.f56236b = bitmapCreateBitmap;
        this.f56237c = new Canvas(bitmapCreateBitmap);
        this.f56238d = new byte[i11 * i11];
        this.f56241g = new float[i11];
        this.f56242h = new float[i11];
        this.f56243i = new Rect();
        this.f56239e = new RectF();
        Paint paint = new Paint();
        paint.setColor(-65536);
        paint.setStyle(Paint.Style.FILL);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.XOR));
        Paint paint2 = new Paint();
        paint2.setStrokeWidth(context.getResources().getDisplayMetrics().density * 2.0f);
        paint2.setStyle(Paint.Style.STROKE);
        paint2.setColor(-16777216);
        paint2.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        new Path();
        new Matrix();
        this.f56240f = 0.0f;
        this.f56244j = i5;
        this.f56245k = new Paint(7);
    }

    public static void a(int i5, int i11, int i12, float[] fArr) {
        float[] fArr2 = new float[fArr.length - 1];
        int i13 = -1;
        float f11 = Float.MAX_VALUE;
        for (int i14 = i11 + 1; i14 <= i12; i14++) {
            float f12 = fArr[i14];
            if (f12 > -1.0f) {
                if (f11 == Float.MAX_VALUE) {
                    i13 = i11;
                } else {
                    float f13 = ((f12 - fArr[i13]) / (i14 - i13)) - f11;
                    float f14 = i5;
                    if (f13 * f14 < 0.0f) {
                        while (i13 > i11) {
                            i13--;
                            if ((((fArr[i14] - fArr[i13]) / (i14 - i13)) - fArr2[i13]) * f14 >= 0.0f) {
                                break;
                            }
                        }
                    }
                }
                f11 = (fArr[i14] - fArr[i13]) / (i14 - i13);
                for (int i15 = i13; i15 < i14; i15++) {
                    fArr2[i15] = f11;
                    fArr[i15] = ((i15 - i13) * f11) + fArr[i13];
                }
                i13 = i14;
            }
        }
    }

    public static float d(float f11, float f12, float f13) {
        float f14 = f11 / f12;
        if (f11 / f13 > (f14 < 0.7853982f ? 0.6597222f : a2.c.a(1.0f, f14, 0.040449437f, 0.6510417f))) {
            return (float) Math.sqrt(r4 / r3);
        }
        return 1.0f;
    }

    public static float f(AdaptiveIconDrawable adaptiveIconDrawable, int i5, RectF rectF) {
        Rect rect = new Rect(adaptiveIconDrawable.getBounds());
        int iHeight = 0;
        adaptiveIconDrawable.setBounds(0, 0, i5, i5);
        Path iconMask = adaptiveIconDrawable.getIconMask();
        adaptiveIconDrawable.setBounds(rect);
        Region region = new Region();
        region.setPath(iconMask, new Region(0, 0, i5, i5));
        Rect bounds = region.getBounds();
        RegionIterator regionIterator = new RegionIterator(region);
        Rect rect2 = new Rect();
        while (regionIterator.next(rect2)) {
            iHeight += rect2.height() * rect2.width();
        }
        if (rectF != null) {
            float f11 = i5;
            rectF.set(bounds.left / f11, bounds.top / f11, 1.0f - (bounds.right / f11), 1.0f - (bounds.bottom / f11));
        }
        float f12 = iHeight;
        return d(f12, f12, i5 * i5);
    }

    public final synchronized Pair b(Bitmap bitmap) {
        try {
            v vVarA = e0.a(new aa.n(bitmap, 0, false), this.f56244j, this.f56238d, this.f56236b, this.f56237c);
            int i5 = vVarA.f56370d;
            if (i5 >= 1 || vVarA.f56369c >= 1) {
                float f11 = vVarA.f56369c;
                float f12 = vVarA.f56368b;
                float f13 = this.f56244j;
                float f14 = (f11 / f12) * f13;
                float f15 = (i5 / f12) * f13;
                float fMax = Math.max(Math.abs(f14), Math.abs(f15));
                int i11 = this.f56244j + ((int) fMax);
                Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i11, i11, Bitmap.Config.ARGB_8888);
                bitmapCreateBitmap.setDensity(0);
                Canvas canvas = new Canvas(bitmapCreateBitmap);
                Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
                int i12 = this.f56244j;
                Rect rect2 = new Rect(0, 0, i12, i12);
                if (Math.abs(f14) != fMax) {
                    f14 += fMax / 2.0f;
                }
                if (Math.abs(f15) != fMax) {
                    f15 += fMax / 2.0f;
                }
                canvas.translate(f14, f15);
                canvas.drawBitmap(bitmap, rect, rect2, this.f56245k);
                canvas.setBitmap(null);
                v vVarA2 = e0.a(new aa.n(bitmapCreateBitmap, 0, false), this.f56244j, this.f56238d, this.f56236b, this.f56237c);
                if (!Intrinsics.b(vVarA2.f56371e, d.n)) {
                    return new Pair(bitmapCreateBitmap, vVarA2);
                }
            }
            return new Pair(bitmap, vVarA);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized v c(Drawable drawable) {
        return e0.a(drawable, this.f56244j, this.f56238d, this.f56236b, this.f56237c);
    }

    public final float e(Drawable drawable) {
        if (!(drawable instanceof AdaptiveIconDrawable)) {
            return c(drawable).f56367a;
        }
        synchronized (this) {
            try {
                if (aa.c.f541k) {
                    if (this.f56240f == 0.0f) {
                        this.f56240f = f((AdaptiveIconDrawable) drawable, this.f56235a, this.f56239e);
                    }
                    return this.f56240f;
                }
                int intrinsicWidth = drawable.getIntrinsicWidth();
                int intrinsicHeight = drawable.getIntrinsicHeight();
                if (intrinsicWidth <= 0 || intrinsicHeight <= 0) {
                    if (intrinsicWidth <= 0 || intrinsicWidth > this.f56235a) {
                        intrinsicWidth = this.f56235a;
                    }
                    if (intrinsicHeight <= 0 || intrinsicHeight > this.f56235a) {
                        intrinsicHeight = this.f56235a;
                    }
                } else {
                    int i5 = this.f56235a;
                    if (intrinsicWidth > i5 || intrinsicHeight > i5) {
                        int iMax = Math.max(intrinsicWidth, intrinsicHeight);
                        int i11 = this.f56235a;
                        intrinsicWidth = (intrinsicWidth * i11) / iMax;
                        intrinsicHeight = (i11 * intrinsicHeight) / iMax;
                    }
                }
                int i12 = 0;
                this.f56236b.eraseColor(0);
                drawable.setBounds(0, 0, intrinsicWidth, intrinsicHeight);
                drawable.draw(this.f56237c);
                ByteBuffer byteBufferWrap = ByteBuffer.wrap(this.f56238d);
                byteBufferWrap.rewind();
                this.f56236b.copyPixelsToBuffer(byteBufferWrap);
                int i13 = this.f56235a;
                int i14 = i13 + 1;
                int i15 = i13 - intrinsicWidth;
                int i16 = 0;
                int i17 = 0;
                int i18 = -1;
                int iMax2 = -1;
                int i19 = -1;
                while (i16 < intrinsicHeight) {
                    int i21 = -1;
                    int i22 = -1;
                    for (int i23 = i12; i23 < intrinsicWidth; i23++) {
                        if ((this.f56238d[i17] & 255) > 40) {
                            if (i21 == -1) {
                                i21 = i23;
                            }
                            i22 = i23;
                        }
                        i17++;
                    }
                    i17 += i15;
                    this.f56241g[i16] = i21;
                    this.f56242h[i16] = i22;
                    if (i21 != -1) {
                        if (i18 == -1) {
                            i18 = i16;
                        }
                        int iMin = Math.min(i14, i21);
                        iMax2 = Math.max(iMax2, i22);
                        i14 = iMin;
                        i19 = i16;
                    }
                    i16++;
                    i12 = 0;
                }
                if (i18 != -1 && iMax2 != -1) {
                    a(1, i18, i19, this.f56241g);
                    a(-1, i18, i19, this.f56242h);
                    float f11 = 0.0f;
                    for (int i24 = 0; i24 < intrinsicHeight; i24++) {
                        float f12 = this.f56241g[i24];
                        if (f12 > -1.0f) {
                            f11 = (this.f56242h[i24] - f12) + 1.0f + f11;
                        }
                    }
                    Rect rect = this.f56243i;
                    rect.left = i14;
                    rect.right = iMax2;
                    rect.top = i18;
                    rect.bottom = i19;
                    return d(f11, ((iMax2 + 1) - i14) * ((i19 + 1) - i18), intrinsicWidth * intrinsicHeight);
                }
                return 1.0f;
            } finally {
            }
        }
    }
}
