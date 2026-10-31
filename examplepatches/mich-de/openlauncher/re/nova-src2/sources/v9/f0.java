package v9;

import android.view.View;
import android.widget.ScrollView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefIconView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSummaryListView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;

/* loaded from: classes2.dex */
public final class f0 implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final ScrollView f92334a;

    /* renamed from: b, reason: collision with root package name */
    public final FancyPrefSpinnerView f92335b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefIconView f92336c;

    /* renamed from: d, reason: collision with root package name */
    public final FancyPrefIconView f92337d;

    /* renamed from: e, reason: collision with root package name */
    public final FancyPrefSummaryListView f92338e;

    /* renamed from: f, reason: collision with root package name */
    public final FancyPrefSpinnerView f92339f;

    public f0(ScrollView scrollView, FancyPrefCheckableView fancyPrefCheckableView, FancyPrefSpinnerView fancyPrefSpinnerView, FancyPrefIconView fancyPrefIconView, FancyPrefIconView fancyPrefIconView2, FancyPrefSummaryListView fancyPrefSummaryListView, FancyPrefView fancyPrefView, FancyPrefSpinnerView fancyPrefSpinnerView2) {
        this.f92334a = scrollView;
        this.f92335b = fancyPrefSpinnerView;
        this.f92336c = fancyPrefIconView;
        this.f92337d = fancyPrefIconView2;
        this.f92338e = fancyPrefSummaryListView;
        this.f92339f = fancyPrefSpinnerView2;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92334a;
    }
}
