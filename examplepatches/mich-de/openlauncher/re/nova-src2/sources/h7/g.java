package h7;

import android.view.animation.Animation;
import android.view.animation.Transformation;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

/* loaded from: classes2.dex */
public final class g extends Animation {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59531a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f59532b;

    public /* synthetic */ g(Object obj, int i5) {
        this.f59531a = i5;
        this.f59532b = obj;
    }

    @Override // android.view.animation.Animation
    public final void applyTransformation(float f11, Transformation transformation) {
        switch (this.f59531a) {
            case 0:
                SwipeRefreshLayout swipeRefreshLayout = (SwipeRefreshLayout) this.f59532b;
                swipeRefreshLayout.f15300t.setScaleX(f11);
                swipeRefreshLayout.f15300t.setScaleY(f11);
                break;
            case 1:
                SwipeRefreshLayout swipeRefreshLayout2 = (SwipeRefreshLayout) this.f59532b;
                float f12 = 1.0f - f11;
                swipeRefreshLayout2.f15300t.setScaleX(f12);
                swipeRefreshLayout2.f15300t.setScaleY(f12);
                break;
            case 2:
                SwipeRefreshLayout swipeRefreshLayout3 = (SwipeRefreshLayout) this.f59532b;
                int iAbs = swipeRefreshLayout3.f15304x - Math.abs(swipeRefreshLayout3.f15303w);
                swipeRefreshLayout3.n((swipeRefreshLayout3.f15302v + ((int) ((iAbs - r1) * f11))) - swipeRefreshLayout3.f15300t.getTop());
                e eVar = swipeRefreshLayout3.f15305y;
                float f13 = 1.0f - f11;
                d dVar = eVar.f59523a;
                if (f13 != dVar.f59514p) {
                    dVar.f59514p = f13;
                }
                eVar.invalidateSelf();
                break;
            case 3:
                ((SwipeRefreshLayout) this.f59532b).k(f11);
                break;
            default:
                g8.e eVar2 = (g8.e) this.f59532b;
                float fFloor = (float) (Math.floor(eVar2.f57217m / 0.8f) + 1.0d);
                float f14 = eVar2.f57215k;
                eVar2.f57208d = a2.c.a(eVar2.f57216l, f14, f11, f14);
                eVar2.a();
                float f15 = eVar2.f57217m;
                eVar2.f57210f = a2.c.a(fFloor, f15, f11, f15);
                eVar2.a();
                float f16 = 1.0f - f11;
                if (f16 != eVar2.n) {
                    eVar2.n = f16;
                    eVar2.a();
                    break;
                }
                break;
        }
    }
}
