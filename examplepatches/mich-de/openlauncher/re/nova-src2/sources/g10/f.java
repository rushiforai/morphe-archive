package g10;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public final int f56838a;

    /* renamed from: b, reason: collision with root package name */
    public final g f56839b;

    /* renamed from: c, reason: collision with root package name */
    public int f56840c;

    /* renamed from: d, reason: collision with root package name */
    public int f56841d;

    /* renamed from: e, reason: collision with root package name */
    public final Paint f56842e;

    /* renamed from: f, reason: collision with root package name */
    public final Paint f56843f;

    /* renamed from: g, reason: collision with root package name */
    public final Paint f56844g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f56845h;

    /* renamed from: i, reason: collision with root package name */
    public final Drawable f56846i;

    public f(Context context, int i5, float f11, int i11, int i12) {
        g gVar = g.f56848b;
        f11 = (i12 & 4) != 0 ? 2.0f : f11;
        i11 = (i12 & 8) != 0 ? 0 : i11;
        gVar = (i12 & 16) != 0 ? g.f56847a : gVar;
        this.f56838a = i11;
        this.f56839b = gVar;
        Paint paint = new Paint(1);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(context.getResources().getDisplayMetrics().density * f11);
        this.f56842e = paint;
        Paint paint2 = new Paint(1);
        paint2.setTextSize(context.getResources().getDisplayMetrics().density * 16.0f);
        paint2.setTypeface(f9.a.a(context, "sans-serif-condensed"));
        this.f56843f = paint2;
        Paint paint3 = new Paint(3);
        Drawable drawable = context.getDrawable(2131231224);
        Intrinsics.e(drawable, "null cannot be cast to non-null type android.graphics.drawable.BitmapDrawable");
        Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
        Shader.TileMode tileMode = Shader.TileMode.REPEAT;
        paint3.setShader(new BitmapShader(bitmap, tileMode, tileMode));
        this.f56844g = paint3;
        Drawable drawable2 = context.getDrawable(2131231524);
        Intrinsics.d(drawable2);
        this.f56846i = drawable2;
        b(i5);
    }

    public final void a(Canvas canvas, Rect rect, Paint paint, float f11) {
        int iCenterX = rect.centerX();
        int iCenterY = rect.centerY();
        int iMin = Math.min(rect.width(), rect.height()) / 2;
        if (this.f56839b == g.f56847a) {
            canvas.drawCircle(iCenterX, iCenterY, iMin - f11, paint);
        } else {
            canvas.drawRect(rect.left + f11, rect.top + f11, rect.right - f11, rect.bottom - f11, paint);
        }
    }

    public final void b(int i5) {
        this.f56840c = i5;
        int iJ = r4.a.j(-2130706433, i5);
        int iJ2 = r4.a.j(167772160, i5);
        if (r4.a.g(iJ, r4.a.n(i5, 255)) <= 1.0499999523162842d) {
            iJ = iJ2;
        }
        this.f56841d = iJ;
        c(getState());
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(int[] iArr) {
        int iAlpha;
        boolean z11 = !(iArr.length == 0);
        boolean z12 = false;
        for (int i5 : iArr) {
            if (i5 == 16842908) {
                z12 = true;
            } else if (i5 == 16842910) {
                z11 = false;
            } else if (i5 != 16842919) {
            }
        }
        this.f56845h = z11;
        int iN = this.f56838a;
        if (iN == 0) {
            int i11 = this.f56840c;
            if (i11 == 262914) {
                iN = r4.a.n(10526880, z11 ? 64 : 255);
            } else if (Color.alpha(i11) < 204) {
                iN = r4.a.n(this.f56840c, 255);
            } else {
                iN = (!v30.e.s(this.f56840c) || Color.luminance(this.f56840c) <= 0.35f) ? r4.a.n(16777215, z11 ? 64 : 128) : r4.a.n(8421504, z11 ? 64 : 128);
            }
        }
        if (z11) {
            int i12 = this.f56840c;
            iAlpha = (i12 & 16777215) | ((((Color.alpha(i12) * 64) / 255) & 255) << 24);
        } else {
            iAlpha = z12 ? this.f56841d : this.f56840c;
        }
        setState(iArr);
        Paint paint = this.f56843f;
        int color = paint.getColor();
        Paint paint2 = this.f56842e;
        if (color == iAlpha && paint2.getColor() == iN) {
            return;
        }
        paint.setColor(iAlpha);
        paint2.setColor(iN);
        invalidateSelf();
    }

    /* JADX WARN: Finally extract failed */
    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        int iCenterX = getBounds().centerX();
        int iCenterY = getBounds().centerY();
        int i5 = this.f56840c;
        Paint paint = this.f56842e;
        Paint paint2 = this.f56843f;
        if (i5 == 262914) {
            int iSave = canvas.save();
            canvas.rotate(45.0f, getBounds().centerX(), getBounds().centerY());
            int color = paint2.getColor();
            int i11 = this.f56845h ? 64 : 255;
            int iSave2 = canvas.save();
            try {
                canvas.clipRect(getBounds().left, getBounds().top, getBounds().right, getBounds().height() / 2);
                paint2.setColor(r4.a.n(-1, i11));
                float f11 = 2;
                a(canvas, getBounds(), paint2, paint.getStrokeWidth() / f11);
                canvas.restoreToCount(iSave2);
                canvas.clipRect(getBounds().left, getBounds().height() / 2, getBounds().right, getBounds().height());
                paint2.setColor(r4.a.n(-5263441, i11));
                a(canvas, getBounds(), paint2, paint.getStrokeWidth() / f11);
                canvas.restoreToCount(iSave);
                paint2.setColor(r4.a.n(-16777216, i11));
                canvas.drawText("A", iCenterX - (paint2.measureText("A") / f11), (paint2.measureText("A") / f11) + iCenterY, paint2);
                if (paint.getStrokeWidth() > 0.0f) {
                    a(canvas, getBounds(), paint, paint.getStrokeWidth() / f11);
                }
                paint2.setColor(color);
            } catch (Throwable th2) {
                canvas.restoreToCount(iSave2);
                throw th2;
            }
        } else {
            if (Color.alpha(i5) < 255) {
                a(canvas, getBounds(), this.f56844g, (paint.getStrokeWidth() / 2) + 0.6f);
            }
            a(canvas, getBounds(), paint2, 0.0f);
            if (paint.getStrokeWidth() > 0.0f) {
                a(canvas, getBounds(), paint, paint.getStrokeWidth() / 2);
            }
        }
        if (kotlin.collections.c.r0(getState(), 16842912)) {
            this.f56846i.draw(canvas);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        c(iArr);
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f56843f.setAlpha(i5);
        this.f56844g.setAlpha(i5);
        this.f56842e.setAlpha(i5);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setBounds(int i5, int i11, int i12, int i13) {
        super.setBounds(i5, i11, i12, i13);
        this.f56846i.setBounds(i5, i11, i12, i13);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f56843f.setColorFilter(colorFilter);
        this.f56844g.setColorFilter(colorFilter);
        this.f56842e.setColorFilter(colorFilter);
    }
}
