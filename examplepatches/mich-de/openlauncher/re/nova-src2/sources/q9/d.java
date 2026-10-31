package q9;

import android.graphics.Paint;
import android.view.animation.DecelerateInterpolator;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.e2;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView;
import e10.c0;

/* loaded from: classes.dex */
public final class d extends e2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83815a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AllAppsContainerView f83816b;

    public /* synthetic */ d(AllAppsContainerView allAppsContainerView, int i5) {
        this.f83815a = i5;
        this.f83816b = allAppsContainerView;
    }

    @Override // androidx.recyclerview.widget.e2
    public final void onScrolled(RecyclerView recyclerView, int i5, int i11) {
        switch (this.f83815a) {
            case 0:
                this.f83816b.x(((o9.m) recyclerView).h());
                break;
            default:
                AllAppsContainerView allAppsContainerView = this.f83816b;
                Paint paint = allAppsContainerView.E;
                Paint paint2 = allAppsContainerView.f21028j;
                int i12 = allAppsContainerView.F;
                if (recyclerView == allAppsContainerView.a()) {
                    kz.a aVar = (kz.a) recyclerView;
                    int iMin = Math.min(aVar.g(), w20.e.k(1000));
                    DecelerateInterpolator decelerateInterpolator = s9.k.f86795h;
                    float fG = (aVar.g() - aVar.h()) / iMin;
                    if (fG < 0.0f) {
                        fG = 0.0f;
                    } else if (fG > 1.0f) {
                        fG = 1.0f;
                    }
                    float interpolation = decelerateInterpolator.getInterpolation(fG);
                    float f11 = i12;
                    float f12 = interpolation * f11;
                    int i13 = (int) (f12 >= 0.0f ? f12 > f11 ? f11 : f12 : 0.0f);
                    if (aVar.t()) {
                        i13 = 0;
                    }
                    if (i13 != paint2.getAlpha()) {
                        paint2.setAlpha(i13);
                        allAppsContainerView.invalidate();
                    }
                    int iH = (aVar.h() * i12) / w20.e.k(48);
                    if (iH < 0) {
                        i12 = 0;
                    } else if (iH <= i12) {
                        i12 = iH;
                    }
                    if (i12 != paint.getAlpha()) {
                        paint.setAlpha(i12);
                        allAppsContainerView.invalidate();
                    }
                    c0 c0Var = allAppsContainerView.J;
                    c0 c0Var2 = c0.f51451c;
                    if (c0Var != c0Var2 && allAppsContainerView.G == c0Var2) {
                        ((NovaSearchBarView) allAppsContainerView.f21031m).d(allAppsContainerView.c(aVar));
                        break;
                    }
                }
                break;
        }
    }
}
