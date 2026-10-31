package yy;

import android.content.Context;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import mx.g0;
import o9.s2;

/* loaded from: classes.dex */
public final class a extends d {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f97710b;

    /* renamed from: c, reason: collision with root package name */
    public final zx.b f97711c;

    /* renamed from: d, reason: collision with root package name */
    public final AccelerateInterpolator f97712d;

    /* renamed from: e, reason: collision with root package name */
    public final DecelerateInterpolator f97713e;

    public a(int i5) {
        this.f97710b = i5;
        switch (i5) {
            case 1:
                this.f97711c = new zx.b(0.5f);
                this.f97712d = new AccelerateInterpolator(0.9f);
                this.f97713e = new DecelerateInterpolator(4.0f);
                this.f97717a = false;
                break;
            default:
                this.f97711c = new zx.b(0.5f);
                this.f97712d = new AccelerateInterpolator(0.9f);
                this.f97713e = new DecelerateInterpolator(4.0f);
                this.f97717a = false;
                break;
        }
    }

    @Override // yy.d
    public final void a(s2 s2Var, View view, int i5, float f11) {
        int i11 = this.f97710b;
        AccelerateInterpolator accelerateInterpolator = this.f97712d;
        DecelerateInterpolator decelerateInterpolator = this.f97713e;
        zx.b bVar = this.f97711c;
        switch (i11) {
            case 0:
                float interpolation = bVar.getInterpolation(Math.abs(Math.min(f11, 0.0f)));
                float f12 = (interpolation * 0.74f) + (1.0f - interpolation);
                float fMin = Math.min(0.0f, f11) * (view.getMeasuredWidth() + s2Var.f80112l);
                Context context = g0.f77088a;
                float interpolation2 = (!g0.n() || f11 < 0.0f) ? f11 < 0.0f ? accelerateInterpolator.getInterpolation(1.0f - Math.abs(f11)) : 1.0f : decelerateInterpolator.getInterpolation(1.0f - f11);
                e.b(3250, view);
                view.setTranslationX(fMin);
                view.setScaleX(f12);
                view.setScaleY(f12);
                if (f11 <= 0.0f || f11 >= 1.0f) {
                    view.setTranslationZ(0.0f);
                } else {
                    view.setTranslationZ(1.0f);
                }
                s2Var.e0(view, interpolation2);
                break;
            default:
                float interpolation3 = bVar.getInterpolation(Math.abs(Math.min(f11, 0.0f)));
                float f13 = (interpolation3 * 0.74f) + (1.0f - interpolation3);
                float fMin2 = Math.min(0.0f, f11) * (view.getMeasuredWidth() + s2Var.f80112l);
                Context context2 = g0.f77088a;
                float interpolation4 = (!g0.n() || f11 < 0.0f) ? f11 < 0.0f ? accelerateInterpolator.getInterpolation(1.0f - Math.abs(f11)) : 1.0f : decelerateInterpolator.getInterpolation(1.0f - f11);
                e.b(3250, view);
                view.setPivotX(view.getWidth() / 2.0f);
                view.setPivotY(view.getHeight() / 2.0f);
                if (f11 > 0.0f) {
                    view.setRotation((-180.0f) * f11);
                } else {
                    view.setRotation(0.0f);
                }
                view.setTranslationX(fMin2);
                view.setScaleX(f13);
                view.setScaleY(f13);
                if (f11 <= 0.0f || f11 >= 1.0f) {
                    view.setTranslationZ(0.0f);
                } else {
                    view.setTranslationZ(1.0f);
                }
                s2Var.e0(view, interpolation4);
                break;
        }
    }

    @Override // yy.d
    public final void b(s2 s2Var, View view, int i5, float f11) {
        switch (this.f97710b) {
            case 0:
                super.b(s2Var, view, i5, f11);
                view.setTranslationZ(0.0f);
                break;
            default:
                super.b(s2Var, view, i5, f11);
                view.setRotation(0.0f);
                view.setTranslationZ(0.0f);
                break;
        }
    }
}
