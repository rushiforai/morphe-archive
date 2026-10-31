package com.facebook.shimmer;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class ShimmerFrameLayout extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public final Paint f27528a;

    /* renamed from: b, reason: collision with root package name */
    public final d f27529b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f27530c;

    public ShimmerFrameLayout(Context context, AttributeSet attributeSet) {
        b bVar;
        super(context, attributeSet);
        this.f27528a = new Paint();
        d dVar = new d();
        this.f27529b = dVar;
        this.f27530c = true;
        setWillNotDraw(false);
        dVar.setCallback(this);
        if (attributeSet == null) {
            a(new b(0).h());
            return;
        }
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, a.f27531a, 0, 0);
        try {
            if (typedArrayObtainStyledAttributes.hasValue(4) && typedArrayObtainStyledAttributes.getBoolean(4, false)) {
                bVar = new b(1);
                ((c) bVar.f13368a).f27546p = false;
            } else {
                bVar = new b(0);
            }
            a(bVar.i(typedArrayObtainStyledAttributes).h());
            typedArrayObtainStyledAttributes.recycle();
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }

    public final void a(c cVar) {
        boolean zIsStarted;
        d dVar = this.f27529b;
        dVar.f27556f = cVar;
        if (cVar != null) {
            dVar.f27552b.setXfermode(new PorterDuffXfermode(dVar.f27556f.f27546p ? PorterDuff.Mode.DST_IN : PorterDuff.Mode.SRC_IN));
        }
        dVar.b();
        if (dVar.f27556f != null) {
            ValueAnimator valueAnimator = dVar.f27555e;
            if (valueAnimator != null) {
                zIsStarted = valueAnimator.isStarted();
                dVar.f27555e.cancel();
                dVar.f27555e.removeAllUpdateListeners();
            } else {
                zIsStarted = false;
            }
            c cVar2 = dVar.f27556f;
            ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, (cVar2.f27550t / cVar2.f27549s) + 1.0f);
            dVar.f27555e = valueAnimatorOfFloat;
            valueAnimatorOfFloat.setRepeatMode(dVar.f27556f.f27548r);
            dVar.f27555e.setRepeatCount(dVar.f27556f.f27547q);
            ValueAnimator valueAnimator2 = dVar.f27555e;
            c cVar3 = dVar.f27556f;
            valueAnimator2.setDuration(cVar3.f27549s + cVar3.f27550t);
            dVar.f27555e.addUpdateListener(dVar.f27551a);
            if (zIsStarted) {
                dVar.f27555e.start();
            }
        }
        dVar.invalidateSelf();
        if (cVar == null || !cVar.n) {
            setLayerType(0, null);
        } else {
            setLayerType(2, this.f27528a);
        }
    }

    public final void b() {
        d dVar = this.f27529b;
        ValueAnimator valueAnimator = dVar.f27555e;
        if (valueAnimator == null || valueAnimator == null || !valueAnimator.isStarted()) {
            return;
        }
        dVar.f27555e.cancel();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.f27530c) {
            this.f27529b.draw(canvas);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f27529b.a();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        b();
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        this.f27529b.setBounds(0, 0, getWidth(), getHeight());
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.f27529b;
    }
}
