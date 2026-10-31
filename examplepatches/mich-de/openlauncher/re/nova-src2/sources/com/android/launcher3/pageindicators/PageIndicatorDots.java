package com.android.launcher3.pageindicators;

import aa.l;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import androidx.recyclerview.widget.z;
import ia.a;
import ia.c;
import o9.g3;
import za.d;

/* loaded from: classes.dex */
public class PageIndicatorDots extends View implements a {

    /* renamed from: j, reason: collision with root package name */
    public static final RectF f21199j = new RectF();

    /* renamed from: k, reason: collision with root package name */
    public static final l f21200k = new l(1, Float.TYPE, "current_position");

    /* renamed from: a, reason: collision with root package name */
    public final Paint f21201a;

    /* renamed from: b, reason: collision with root package name */
    public final float f21202b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f21203c;

    /* renamed from: d, reason: collision with root package name */
    public int f21204d;

    /* renamed from: e, reason: collision with root package name */
    public int f21205e;

    /* renamed from: f, reason: collision with root package name */
    public float f21206f;

    /* renamed from: g, reason: collision with root package name */
    public float f21207g;

    /* renamed from: h, reason: collision with root package name */
    public ObjectAnimator f21208h;

    /* renamed from: i, reason: collision with root package name */
    public float[] f21209i;

    public PageIndicatorDots(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @Override // ia.a
    public final void a(int i5) {
        if (this.f21205e != i5) {
            this.f21205e = i5;
        }
    }

    @Override // ia.a
    public final void c(int i5) {
        this.f21204d = i5;
        requestLayout();
    }

    public final void d(float f11) {
        this.f21207g = f11;
        if (Math.abs(this.f21206f - f11) < 0.1f) {
            this.f21206f = this.f21207g;
        }
        if (this.f21208h != null || Float.compare(this.f21206f, this.f21207g) == 0) {
            return;
        }
        float f12 = this.f21206f;
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, f21200k, f12 > this.f21207g ? f12 - 0.5f : f12 + 0.5f);
        this.f21208h = objectAnimatorOfFloat;
        objectAnimatorOfFloat.addListener(new z(this, 1));
        this.f21208h.setDuration(150L);
        this.f21208h.start();
    }

    public RectF e() {
        float f11 = this.f21206f;
        float f12 = (int) f11;
        float f13 = f11 - f12;
        float f14 = this.f21202b;
        float f15 = 3.0f * f14;
        RectF rectF = f21199j;
        rectF.top = (getHeight() * 0.5f) - f14;
        rectF.bottom = (getHeight() * 0.5f) + f14;
        float width = (f12 * f15) + (((getWidth() - (this.f21204d * f15)) + f14) / 2.0f);
        rectF.left = width;
        float f16 = (f14 * 2.0f) + width;
        rectF.right = f16;
        if (f13 < 0.5f) {
            rectF.right = (f13 * f15 * 2.0f) + f16;
        } else {
            rectF.right = f16 + f15;
            rectF.left = ((f13 - 0.5f) * f15 * 2.0f) + width;
        }
        if (this.f21203c) {
            float fWidth = rectF.width();
            float width2 = getWidth() - rectF.left;
            rectF.right = width2;
            rectF.left = width2 - fWidth;
        }
        return rectF;
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x006d  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onDraw(Canvas canvas) {
        float f11 = this.f21202b;
        float f12 = 3.0f * f11;
        float width = (((getWidth() - (this.f21204d * f12)) + f11) / 2.0f) + f11;
        float height = getHeight() / 2;
        float[] fArr = this.f21209i;
        int i5 = 0;
        boolean z11 = this.f21203c;
        Paint paint = this.f21201a;
        if (fArr != null) {
            if (z11) {
                width = getWidth() - width;
                f12 = -f12;
            }
            while (i5 < this.f21209i.length) {
                paint.setAlpha(i5 == this.f21205e ? 255 : 128);
                canvas.drawCircle(width, height, this.f21209i[i5] * f11, paint);
                width += f12;
                i5++;
            }
            return;
        }
        int i11 = z11 ? (this.f21204d - 1) - ((int) this.f21206f) : (int) this.f21206f;
        paint.setAlpha(128);
        while (i5 < this.f21204d) {
            if (i5 == i11) {
                if (this.f21206f != ((int) r5)) {
                    canvas.drawCircle(width, height, f11, paint);
                }
            }
            width += f12;
            i5++;
        }
        paint.setAlpha(255);
        canvas.drawRoundRect(e(), f11, f11, paint);
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        int mode = View.MeasureSpec.getMode(i5);
        float f11 = this.f21202b;
        setMeasuredDimension(mode == 1073741824 ? View.MeasureSpec.getSize(i5) : (int) (((this.f21204d * 3) + 2) * f11), View.MeasureSpec.getMode(i11) == 1073741824 ? View.MeasureSpec.getSize(i11) : (int) (f11 * 4.0f));
    }

    public PageIndicatorDots(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0);
        Paint paint = new Paint(1);
        this.f21201a = paint;
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(((d) d.p(context)).C().f90102e.f90180c);
        this.f21202b = getResources().getDimension(2131166325) / 2.0f;
        setOutlineProvider(new c(this));
        this.f21203c = g3.p(getResources());
    }
}
