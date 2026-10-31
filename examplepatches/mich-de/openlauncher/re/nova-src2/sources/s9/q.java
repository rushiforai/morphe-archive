package s9;

import a5.g1;
import android.animation.ValueAnimator;
import android.graphics.Outline;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewOutlineProvider;

/* loaded from: classes2.dex */
public class q extends ViewOutlineProvider {

    /* renamed from: a, reason: collision with root package name */
    public final Rect f86820a;

    /* renamed from: b, reason: collision with root package name */
    public float f86821b;

    /* renamed from: c, reason: collision with root package name */
    public final float f86822c;

    /* renamed from: d, reason: collision with root package name */
    public final float f86823d;

    /* renamed from: e, reason: collision with root package name */
    public final Rect f86824e;

    /* renamed from: f, reason: collision with root package name */
    public final Rect f86825f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f86826g;

    public q(float f11, float f12, Rect rect, Rect rect2, boolean z11) {
        this.f86820a = new Rect();
        this.f86822c = f11;
        this.f86823d = f12;
        this.f86824e = rect;
        this.f86825f = rect2;
        this.f86826g = z11;
    }

    public final ValueAnimator a(View view, boolean z11) {
        ValueAnimator valueAnimatorOfFloat = z11 ? ValueAnimator.ofFloat(1.0f, 0.0f) : ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat.addListener(new p(this, view, view.getElevation()));
        valueAnimatorOfFloat.addUpdateListener(new g1(4, this, view));
        return valueAnimatorOfFloat;
    }

    public final void b(Rect rect) {
        rect.set(this.f86820a);
    }

    public final void c(float f11) {
        float f12 = 1.0f - f11;
        this.f86821b = (this.f86823d * f11) + (this.f86822c * f12);
        Rect rect = this.f86824e;
        Rect rect2 = this.f86825f;
        Rect rect3 = this.f86820a;
        rect3.left = (int) ((rect2.left * f11) + (rect.left * f12));
        rect3.top = (int) ((rect2.top * f11) + (rect.top * f12));
        rect3.right = (int) ((rect2.right * f11) + (rect.right * f12));
        rect3.bottom = (int) ((f11 * rect2.bottom) + (f12 * rect.bottom));
    }

    public boolean d() {
        return this.f86826g;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        outline.setRoundRect(this.f86820a, this.f86821b);
    }

    public q(float f11, float f12, Rect rect, Rect rect2) {
        this(f11, f12, rect, rect2, false);
    }
}
