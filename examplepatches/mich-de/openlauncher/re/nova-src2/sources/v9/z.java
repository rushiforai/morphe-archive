package v9;

import android.view.View;
import android.widget.ScrollView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefIconView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;

/* loaded from: classes2.dex */
public final class z implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final ScrollView f92578a;

    /* renamed from: b, reason: collision with root package name */
    public final FancyPrefIconView f92579b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefView f92580c;

    /* renamed from: d, reason: collision with root package name */
    public final FancyPrefView f92581d;

    public z(ScrollView scrollView, FancyPrefIconView fancyPrefIconView, FancyPrefView fancyPrefView, FancyPrefView fancyPrefView2) {
        this.f92578a = scrollView;
        this.f92579b = fancyPrefIconView;
        this.f92580c = fancyPrefView;
        this.f92581d = fancyPrefView2;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92578a;
    }
}
