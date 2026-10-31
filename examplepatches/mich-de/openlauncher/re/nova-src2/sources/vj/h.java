package vj;

import a5.a1;
import android.content.res.Resources;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class h extends a {

    /* renamed from: g, reason: collision with root package name */
    public final float f92800g;

    /* renamed from: h, reason: collision with root package name */
    public final float f92801h;

    /* renamed from: i, reason: collision with root package name */
    public final float f92802i;

    public h(View view) {
        super(view);
        Resources resources = view.getResources();
        this.f92800g = resources.getDimension(2131165614);
        this.f92801h = resources.getDimension(2131165613);
        this.f92802i = resources.getDimension(2131165615);
    }

    public final void a(int i5, float f11, boolean z11) {
        float interpolation = this.f92786a.getInterpolation(f11);
        WeakHashMap weakHashMap = a1.f250a;
        View view = this.f92787b;
        boolean z12 = (Gravity.getAbsoluteGravity(i5, view.getLayoutDirection()) & 3) == 3;
        boolean z13 = z11 == z12;
        int width = view.getWidth();
        int height = view.getHeight();
        float f12 = width;
        if (f12 > 0.0f) {
            float f13 = height;
            if (f13 <= 0.0f) {
                return;
            }
            float f14 = this.f92800g / f12;
            float f15 = this.f92801h / f12;
            float f16 = this.f92802i / f13;
            if (z12) {
                f12 = 0.0f;
            }
            view.setPivotX(f12);
            if (!z13) {
                f15 = -f14;
            }
            float fA = cj.a.a(0.0f, f15, interpolation);
            float f17 = fA + 1.0f;
            view.setScaleX(f17);
            float fA2 = 1.0f - cj.a.a(0.0f, f16, interpolation);
            view.setScaleY(fA2);
            if (view instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view;
                for (int i11 = 0; i11 < viewGroup.getChildCount(); i11++) {
                    View childAt = viewGroup.getChildAt(i11);
                    childAt.setPivotX(z12 ? childAt.getWidth() + (width - childAt.getRight()) : -childAt.getLeft());
                    childAt.setPivotY(-childAt.getTop());
                    float f18 = z13 ? 1.0f - fA : 1.0f;
                    float f19 = fA2 != 0.0f ? (f17 / fA2) * f18 : 1.0f;
                    childAt.setScaleX(f18);
                    childAt.setScaleY(f19);
                }
            }
        }
    }
}
