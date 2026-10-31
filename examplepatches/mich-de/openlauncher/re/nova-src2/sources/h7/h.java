package h7;

import android.view.animation.Animation;
import android.view.animation.Transformation;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

/* loaded from: classes2.dex */
public final class h extends Animation {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59533a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f59534b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ SwipeRefreshLayout f59535c;

    public h(SwipeRefreshLayout swipeRefreshLayout, int i5, int i11) {
        this.f59535c = swipeRefreshLayout;
        this.f59533a = i5;
        this.f59534b = i11;
    }

    @Override // android.view.animation.Animation
    public final void applyTransformation(float f11, Transformation transformation) {
        this.f59535c.f15305y.setAlpha((int) (((this.f59534b - r0) * f11) + this.f59533a));
    }
}
