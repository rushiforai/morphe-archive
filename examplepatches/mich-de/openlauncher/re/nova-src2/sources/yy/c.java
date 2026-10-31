package yy;

import android.content.Context;
import android.view.View;
import com.teslacoilsw.launcher.preferences.fragments.ScrollEffectPreviewPagedView;
import mx.g0;
import o9.s2;

/* loaded from: classes.dex */
public final class c extends d {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f97716b;

    public /* synthetic */ c(int i5) {
        this.f97716b = i5;
    }

    private final void c(s2 s2Var, View view, int i5, float f11) {
    }

    @Override // yy.d
    public final void a(s2 s2Var, View view, int i5, float f11) {
        float measuredWidth;
        float fAbs = 0.5f;
        switch (this.f97716b) {
            case 0:
                if (f11 < -0.5f) {
                    measuredWidth = view.getMeasuredWidth() * (-0.5f);
                } else if (f11 > 0.5f) {
                    view.getMeasuredWidth();
                    measuredWidth = 0;
                } else {
                    fAbs = 1.0f - Math.abs(f11);
                    measuredWidth = view.getMeasuredWidth() * Math.min(0.0f, f11);
                }
                view.setTranslationX(measuredWidth);
                view.setScaleX(fAbs);
                view.setScaleY(fAbs);
                view.setPivotX(view.getWidth());
                view.setPivotY(view.getHeight() / 2.0f);
                break;
            case 1:
                break;
            case 2:
                float f12 = 12.5f * f11;
                if (s2Var instanceof ScrollEffectPreviewPagedView) {
                    f12 *= 3.0f;
                }
                float fA = e.a(f12, view.getWidth() + 10, view.getHeight()) + ((-10) * g0.f77092e * f11);
                e.b(800, view);
                view.setTranslationX(fA);
                view.setPivotX(view.getWidth() / 2.0f);
                view.setPivotY(view.getHeight() / 2.0f);
                view.setRotationY(f12);
                break;
            case 3:
                float f13 = 12.5f * f11;
                float fA2 = e.a(f13, view.getWidth() + 10, view.getHeight()) + ((-10) * g0.f77092e * f11);
                e.b(800, view);
                view.setPivotX(view.getWidth() / 2.0f);
                view.setPivotY(view.getHeight() / 2.0f);
                view.setTranslationX(fA2);
                view.setRotationY(f13);
                float fAbs2 = 1.0f - (Math.abs(f11) * 0.3f);
                view.setScaleX(fAbs2);
                view.setScaleY(fAbs2);
                break;
            case 4:
                if (f11 <= 0.0f) {
                    s2Var.f0(f11, i5);
                    break;
                } else {
                    s2Var.f0(1.0f - f11, i5);
                    break;
                }
            case 5:
                view.setTranslationX((view.getMeasuredWidth() + s2Var.f80112l) * f11);
                float fAbs3 = Math.abs(f11);
                float f14 = 1.0f - fAbs3;
                s2Var.e0(view, f14);
                if (fAbs3 < 0.5f && fAbs3 >= 0.0f) {
                    view.setScaleX(1.0f);
                    view.setScaleY(1.0f);
                    break;
                } else {
                    float f15 = f14 + 0.5f;
                    view.setScaleX(f15);
                    view.setScaleY(f15);
                    break;
                }
                break;
            case 6:
                float f16 = (-180.0f) * f11;
                float fAbs4 = (0.5f - Math.abs(0.5f - Math.abs(f11))) * 0.5f;
                view.setTranslationX((view.getMeasuredWidth() + s2Var.f80112l) * f11);
                float f17 = 1.0f - fAbs4;
                view.setScaleY(f17);
                view.setScaleX(f17);
                Context context = g0.f77088a;
                e.b(g0.n() ? 3250 : 800, view);
                view.setPivotX(view.getWidth() / 2.0f);
                view.setPivotY(view.getHeight() / 2.0f);
                view.setRotationY(f16);
                float fAbs5 = Math.abs(f11);
                if (fAbs5 < 0.5f && fAbs5 >= 0.0f) {
                    s2Var.e0(view, 1.0f);
                    break;
                } else {
                    s2Var.e0(view, 0.0f);
                    break;
                }
            default:
                float fAbs6 = (0.5f - Math.abs(0.5f - Math.abs(f11))) * 0.5f;
                view.setTranslationX((view.getMeasuredWidth() + s2Var.f80112l) * f11);
                float f18 = 1.0f - fAbs6;
                view.setScaleY(f18);
                view.setScaleX(f18);
                e.b(800, view);
                view.setPivotX(view.getWidth() / 2.0f);
                view.setPivotY(view.getHeight() / 2.0f);
                view.setRotationX((-180.0f) * f11);
                float fAbs7 = Math.abs(f11);
                if (fAbs7 < 0.5f && fAbs7 >= 0.0f) {
                    s2Var.e0(view, 1.0f);
                    break;
                } else {
                    view.setScaleY(1.0f);
                    view.setScaleX(1.0f);
                    view.setRotationX(0.0f);
                    s2Var.e0(view, 0.0f);
                    break;
                }
                break;
        }
    }

    @Override // yy.d
    public void b(s2 s2Var, View view, int i5, float f11) {
        switch (this.f97716b) {
            case 4:
                super.b(s2Var, view, i5, f11);
                s2Var.f0(1.0f, i5);
                break;
            default:
                super.b(s2Var, view, i5, f11);
                break;
        }
    }
}
