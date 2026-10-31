package yy;

import android.view.View;
import android.view.animation.AccelerateInterpolator;
import o9.s2;

/* loaded from: classes.dex */
public final class b extends d {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f97714b;

    /* renamed from: c, reason: collision with root package name */
    public final AccelerateInterpolator f97715c;

    public b(int i5) {
        this.f97714b = i5;
        switch (i5) {
            case 1:
                this.f97715c = new AccelerateInterpolator(0.5f);
                this.f97717a = false;
                break;
            case 2:
                this.f97715c = new AccelerateInterpolator(0.6f);
                break;
            default:
                this.f97715c = new AccelerateInterpolator(0.8f);
                this.f97717a = false;
                break;
        }
    }

    @Override // yy.d
    public final void a(s2 s2Var, View view, int i5, float f11) {
        switch (this.f97714b) {
            case 0:
                float fAbs = 1.0f - Math.abs(f11);
                view.setTranslationX(Math.min(0.0f, f11) * view.getMeasuredWidth());
                view.setPivotX(view.getWidth());
                view.setPivotY(view.getHeight() / 2.0f);
                view.setScaleX(fAbs);
                float fAbs2 = Math.abs(f11);
                if (fAbs2 > 0.5f) {
                    s2Var.e0(view, 1.0f - this.f97715c.getInterpolation((fAbs2 - 0.5f) * 2.0f));
                    break;
                } else {
                    s2Var.e0(view, 1.0f);
                    break;
                }
            case 1:
                float f12 = (-90.0f) * f11;
                float fAbs3 = (0.5f - Math.abs(0.5f - Math.abs(f11))) + 1.0f;
                view.setScaleY(fAbs3);
                view.setScaleX(fAbs3);
                e.b(800, view);
                view.setPivotX(f12 == 0.0f ? view.getWidth() / 2 : f12 < 0.0f ? view.getWidth() : 0);
                view.setPivotY(view.getHeight() / 2);
                view.setRotationY(f12);
                float fAbs4 = Math.abs(f11);
                if (fAbs4 > 0.75f) {
                    s2Var.e0(view, 1.0f - this.f97715c.getInterpolation((fAbs4 - 0.75f) / 0.25f));
                    break;
                } else {
                    s2Var.e0(view, 1.0f);
                    break;
                }
            default:
                float f13 = (-90.0f) * f11;
                e.a(-f13, view.getWidth(), view.getHeight());
                view.setTranslationX((view.getMeasuredWidth() + s2Var.f80112l) * f11);
                e.b(3250, view);
                view.setPivotX(view.getWidth() / 2.0f);
                view.setPivotY(view.getHeight() / 2.0f);
                view.setRotationY(f13);
                s2Var.e0(view, 1.0f - this.f97715c.getInterpolation(Math.abs(f11)));
                break;
        }
    }
}
