package q9;

import com.android.launcher3.allapps.AllAppsContainerView;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import s10.d0;
import t70.m0;
import t70.y0;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements o {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83808a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f83809b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f83808a = i5;
        this.f83809b = obj;
    }

    @Override // q9.o
    public final void a() {
        switch (this.f83808a) {
            case 0:
                ((AllAppsContainerView) this.f83809b).m();
                break;
            case 1:
                AppSearchResultsView appSearchResultsView = (AppSearchResultsView) this.f83809b;
                appSearchResultsView.L(appSearchResultsView.f46190g, true);
                break;
            default:
                d0 d0Var = (d0) this.f83809b;
                if (d0Var.f86586i != null) {
                    y70.d dVar = d0Var.f86579b;
                    a80.e eVar = y0.f88884a;
                    m0.t(dVar, a80.d.f488c, null, new s10.v(d0Var, null), 2);
                    break;
                }
                break;
        }
    }
}
