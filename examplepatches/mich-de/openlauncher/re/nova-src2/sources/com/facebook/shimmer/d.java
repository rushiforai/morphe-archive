package com.facebook.shimmer;

import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import androidx.recyclerview.widget.a0;

/* loaded from: classes2.dex */
public final class d extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public final a0 f27551a = new a0(this, 2);

    /* renamed from: b, reason: collision with root package name */
    public final Paint f27552b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f27553c;

    /* renamed from: d, reason: collision with root package name */
    public final Matrix f27554d;

    /* renamed from: e, reason: collision with root package name */
    public ValueAnimator f27555e;

    /* renamed from: f, reason: collision with root package name */
    public c f27556f;

    public d() {
        Paint paint = new Paint();
        this.f27552b = paint;
        this.f27553c = new Rect();
        this.f27554d = new Matrix();
        paint.setAntiAlias(true);
    }

    public final void a() {
        c cVar;
        ValueAnimator valueAnimator = this.f27555e;
        if (valueAnimator == null || valueAnimator.isStarted() || (cVar = this.f27556f) == null || !cVar.o || getCallback() == null) {
            return;
        }
        this.f27555e.start();
    }

    public final void b() {
        c cVar;
        Shader radialGradient;
        Rect bounds = getBounds();
        int iWidth = bounds.width();
        int iHeight = bounds.height();
        if (iWidth == 0 || iHeight == 0 || (cVar = this.f27556f) == null) {
            return;
        }
        int iRound = cVar.f27539g;
        if (iRound <= 0) {
            iRound = Math.round(cVar.f27541i * iWidth);
        }
        c cVar2 = this.f27556f;
        int iRound2 = cVar2.f27540h;
        if (iRound2 <= 0) {
            iRound2 = Math.round(cVar2.f27542j * iHeight);
        }
        c cVar3 = this.f27556f;
        boolean z11 = true;
        if (cVar3.f27538f != 1) {
            int i5 = cVar3.f27535c;
            if (i5 != 1 && i5 != 3) {
                z11 = false;
            }
            if (z11) {
                iRound = 0;
            }
            if (!z11) {
                iRound2 = 0;
            }
            c cVar4 = this.f27556f;
            radialGradient = new LinearGradient(0.0f, 0.0f, iRound, iRound2, cVar4.f27534b, cVar4.f27533a, Shader.TileMode.CLAMP);
        } else {
            float fMax = (float) (Math.max(iRound, iRound2) / Math.sqrt(2.0d));
            c cVar5 = this.f27556f;
            radialGradient = new RadialGradient(iRound / 2.0f, iRound2 / 2.0f, fMax, cVar5.f27534b, cVar5.f27533a, Shader.TileMode.CLAMP);
        }
        this.f27552b.setShader(radialGradient);
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        float fA;
        float fA2;
        if (this.f27556f != null) {
            Paint paint = this.f27552b;
            if (paint.getShader() == null) {
                return;
            }
            float fTan = (float) Math.tan(Math.toRadians(this.f27556f.f27545m));
            Rect rect = this.f27553c;
            float fWidth = (rect.width() * fTan) + rect.height();
            float fHeight = (fTan * rect.height()) + rect.width();
            ValueAnimator valueAnimator = this.f27555e;
            float f11 = 0.0f;
            float animatedFraction = valueAnimator != null ? valueAnimator.getAnimatedFraction() : 0.0f;
            int i5 = this.f27556f.f27535c;
            if (i5 != 1) {
                if (i5 == 2) {
                    fA2 = a2.c.a(-fHeight, fHeight, animatedFraction, fHeight);
                } else if (i5 != 3) {
                    float f12 = -fHeight;
                    fA2 = a2.c.a(fHeight, f12, animatedFraction, f12);
                } else {
                    fA = a2.c.a(-fWidth, fWidth, animatedFraction, fWidth);
                }
                f11 = fA2;
                fA = 0.0f;
            } else {
                float f13 = -fWidth;
                fA = a2.c.a(fWidth, f13, animatedFraction, f13);
            }
            Matrix matrix = this.f27554d;
            matrix.reset();
            matrix.setRotate(this.f27556f.f27545m, rect.width() / 2.0f, rect.height() / 2.0f);
            matrix.postTranslate(f11, fA);
            paint.getShader().setLocalMatrix(matrix);
            canvas.drawRect(rect, paint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        c cVar = this.f27556f;
        if (cVar != null) {
            return (cVar.n || cVar.f27546p) ? -3 : -1;
        }
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.f27553c.set(0, 0, rect.width(), rect.height());
        b();
        a();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
    }
}
