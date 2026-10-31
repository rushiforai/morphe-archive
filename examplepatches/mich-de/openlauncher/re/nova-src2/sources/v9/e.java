package v9;

import android.view.View;
import android.widget.LinearLayout;
import com.teslacoilsw.launcher.search.AppSearchResultsView;

/* loaded from: classes.dex */
public final class e implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final AppSearchResultsView f92317a;

    /* renamed from: b, reason: collision with root package name */
    public final AppSearchResultsView f92318b;

    /* renamed from: c, reason: collision with root package name */
    public final LinearLayout f92319c;

    /* renamed from: d, reason: collision with root package name */
    public final LinearLayout f92320d;

    public e(AppSearchResultsView appSearchResultsView, AppSearchResultsView appSearchResultsView2, LinearLayout linearLayout, LinearLayout linearLayout2) {
        this.f92317a = appSearchResultsView;
        this.f92318b = appSearchResultsView2;
        this.f92319c = linearLayout;
        this.f92320d = linearLayout2;
    }

    public static e a(View view) {
        AppSearchResultsView appSearchResultsView = (AppSearchResultsView) view;
        int i5 = 2131427756;
        LinearLayout linearLayout = (LinearLayout) ab.e0.x(2131427756, view);
        if (linearLayout != null) {
            i5 = 2131427758;
            LinearLayout linearLayout2 = (LinearLayout) ab.e0.x(2131427758, view);
            if (linearLayout2 != null) {
                return new e(appSearchResultsView, appSearchResultsView, linearLayout, linearLayout2);
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(view.getResources().getResourceName(i5)));
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92317a;
    }
}
