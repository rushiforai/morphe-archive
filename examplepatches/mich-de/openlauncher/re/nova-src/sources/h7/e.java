package h7;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.view.animation.LinearInterpolator;

/* loaded from: classes2.dex */
public final class e extends Drawable implements Animatable {

    /* renamed from: g, reason: collision with root package name */
    public static final LinearInterpolator f59520g = new LinearInterpolator();

    /* renamed from: h, reason: collision with root package name */
    public static final f6.a f59521h = new f6.a(1);

    /* renamed from: i, reason: collision with root package name */
    public static final int[] f59522i = {-16777216};

    /* renamed from: a, reason: collision with root package name */
    public final d f59523a;

    /* renamed from: b, reason: collision with root package name */
    public float f59524b;

    /* renamed from: c, reason: collision with root package name */
    public final Resources f59525c;

    /* renamed from: d, reason: collision with root package name */
    public final ValueAnimator f59526d;

    /* renamed from: e, reason: collision with root package name */
    public float f59527e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f59528f;

    public e(Context context) {
        context.getClass();
        this.f59525c = context.getResources();
        d dVar = new d();
        this.f59523a = dVar;
        int[] iArr = f59522i;
        dVar.f59509i = iArr;
        dVar.f59510j = 0;
        dVar.f59519u = iArr[0];
        dVar.f59508h = 2.5f;
        dVar.f59502b.setStrokeWidth(2.5f);
        invalidateSelf();
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat.addUpdateListener(new b(this, dVar));
        valueAnimatorOfFloat.setRepeatCount(-1);
        valueAnimatorOfFloat.setRepeatMode(1);
        valueAnimatorOfFloat.setInterpolator(f59520g);
        valueAnimatorOfFloat.addListener(new c(this, dVar));
        this.f59526d = valueAnimatorOfFloat;
    }

    public static void b(float f11, d dVar) {
        if (f11 <= 0.75f) {
            dVar.f59519u = dVar.f59509i[dVar.f59510j];
            return;
        }
        float f12 = (f11 - 0.75f) / 0.25f;
        int[] iArr = dVar.f59509i;
        int i5 = dVar.f59510j;
        int i11 = iArr[i5];
        int i12 = iArr[(i5 + 1) % iArr.length];
        dVar.f59519u = ((((i11 >> 24) & 255) + ((int) ((((i12 >> 24) & 255) - r1) * f12))) << 24) | ((((i11 >> 16) & 255) + ((int) ((((i12 >> 16) & 255) - r3) * f12))) << 16) | ((((i11 >> 8) & 255) + ((int) ((((i12 >> 8) & 255) - r4) * f12))) << 8) | ((i11 & 255) + ((int) (f12 * ((i12 & 255) - r2))));
    }

    public final void a(float f11, d dVar, boolean z11) {
        float interpolation;
        float interpolation2;
        if (this.f59528f) {
            b(f11, dVar);
            float fFloor = (float) (Math.floor(dVar.f59513m / 0.8f) + 1.0d);
            float f12 = dVar.f59511k;
            float f13 = dVar.f59512l;
            dVar.f59505e = (((f13 - 0.01f) - f12) * f11) + f12;
            dVar.f59506f = f13;
            float f14 = dVar.f59513m;
            dVar.f59507g = a2.c.a(fFloor, f14, f11, f14);
            return;
        }
        if (f11 != 1.0f || z11) {
            float f15 = dVar.f59513m;
            f6.a aVar = f59521h;
            if (f11 < 0.5f) {
                interpolation = dVar.f59511k;
                interpolation2 = (aVar.getInterpolation(f11 / 0.5f) * 0.79f) + 0.01f + interpolation;
            } else {
                float f16 = dVar.f59511k + 0.79f;
                interpolation = f16 - (((1.0f - aVar.getInterpolation((f11 - 0.5f) / 0.5f)) * 0.79f) + 0.01f);
                interpolation2 = f16;
            }
            float f17 = (0.20999998f * f11) + f15;
            float f18 = (f11 + this.f59527e) * 216.0f;
            dVar.f59505e = interpolation;
            dVar.f59506f = interpolation2;
            dVar.f59507g = f17;
            this.f59524b = f18;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Rect bounds = getBounds();
        canvas.save();
        canvas.rotate(this.f59524b, bounds.exactCenterX(), bounds.exactCenterY());
        d dVar = this.f59523a;
        Paint paint = dVar.f59502b;
        RectF rectF = dVar.f59501a;
        float f11 = dVar.f59515q;
        float fMin = (dVar.f59508h / 2.0f) + f11;
        if (f11 <= 0.0f) {
            fMin = (Math.min(bounds.width(), bounds.height()) / 2.0f) - Math.max((dVar.f59516r * dVar.f59514p) / 2.0f, dVar.f59508h / 2.0f);
        }
        rectF.set(bounds.centerX() - fMin, bounds.centerY() - fMin, bounds.centerX() + fMin, bounds.centerY() + fMin);
        float f12 = dVar.f59505e;
        float f13 = dVar.f59507g;
        float f14 = (f12 + f13) * 360.0f;
        float f15 = ((dVar.f59506f + f13) * 360.0f) - f14;
        paint.setColor(dVar.f59519u);
        paint.setAlpha(dVar.f59518t);
        float f16 = dVar.f59508h / 2.0f;
        rectF.inset(f16, f16);
        canvas.drawCircle(rectF.centerX(), rectF.centerY(), rectF.width() / 2.0f, dVar.f59504d);
        float f17 = -f16;
        rectF.inset(f17, f17);
        canvas.drawArc(rectF, f14, f15, false, paint);
        Paint paint2 = dVar.f59503c;
        if (dVar.n) {
            Path path = dVar.o;
            if (path == null) {
                Path path2 = new Path();
                dVar.o = path2;
                path2.setFillType(Path.FillType.EVEN_ODD);
            } else {
                path.reset();
            }
            float fMin2 = Math.min(rectF.width(), rectF.height()) / 2.0f;
            float f18 = (dVar.f59516r * dVar.f59514p) / 2.0f;
            dVar.o.moveTo(0.0f, 0.0f);
            dVar.o.lineTo(dVar.f59516r * dVar.f59514p, 0.0f);
            Path path3 = dVar.o;
            float f19 = dVar.f59516r;
            float f21 = dVar.f59514p;
            path3.lineTo((f19 * f21) / 2.0f, dVar.f59517s * f21);
            dVar.o.offset((rectF.centerX() + fMin2) - f18, (dVar.f59508h / 2.0f) + rectF.centerY());
            dVar.o.close();
            paint2.setColor(dVar.f59519u);
            paint2.setAlpha(dVar.f59518t);
            canvas.save();
            canvas.rotate(f14 + f15, rectF.centerX(), rectF.centerY());
            canvas.drawPath(dVar.o, paint2);
            canvas.restore();
        }
        canvas.restore();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.f59523a.f59518t;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Animatable
    public final boolean isRunning() {
        return this.f59526d.isRunning();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f59523a.f59518t = i5;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f59523a.f59502b.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public final void start() {
        this.f59526d.cancel();
        d dVar = this.f59523a;
        float f11 = dVar.f59505e;
        dVar.f59511k = f11;
        float f12 = dVar.f59506f;
        dVar.f59512l = f12;
        dVar.f59513m = dVar.f59507g;
        if (f12 != f11) {
            this.f59528f = true;
            this.f59526d.setDuration(666L);
            this.f59526d.start();
            return;
        }
        dVar.f59510j = 0;
        dVar.f59519u = dVar.f59509i[0];
        dVar.f59511k = 0.0f;
        dVar.f59512l = 0.0f;
        dVar.f59513m = 0.0f;
        dVar.f59505e = 0.0f;
        dVar.f59506f = 0.0f;
        dVar.f59507g = 0.0f;
        this.f59526d.setDuration(1332L);
        this.f59526d.start();
    }

    @Override // android.graphics.drawable.Animatable
    public final void stop() {
        this.f59526d.cancel();
        this.f59524b = 0.0f;
        d dVar = this.f59523a;
        if (dVar.n) {
            dVar.n = false;
        }
        dVar.f59510j = 0;
        dVar.f59519u = dVar.f59509i[0];
        dVar.f59511k = 0.0f;
        dVar.f59512l = 0.0f;
        dVar.f59513m = 0.0f;
        dVar.f59505e = 0.0f;
        dVar.f59506f = 0.0f;
        dVar.f59507g = 0.0f;
        invalidateSelf();
    }
}
