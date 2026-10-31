package v9;

import android.view.View;
import android.widget.ScrollView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.preferences.widget.LinkImageView;

/* loaded from: classes2.dex */
public final class h0 implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final ScrollView f92354a;

    /* renamed from: b, reason: collision with root package name */
    public final FancyPrefView f92355b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefView f92356c;

    /* renamed from: d, reason: collision with root package name */
    public final FancyPrefView f92357d;

    /* renamed from: e, reason: collision with root package name */
    public final FancyPrefView f92358e;

    public h0(ScrollView scrollView, FancyPrefCheckableView fancyPrefCheckableView, LinkImageView linkImageView, FancyPrefView fancyPrefView, FancyPrefView fancyPrefView2, FancyPrefView fancyPrefView3, FancyPrefView fancyPrefView4, FancyPrefView fancyPrefView5, FancyPrefView fancyPrefView6, FancyPrefView fancyPrefView7, FancyPrefView fancyPrefView8, LinkImageView linkImageView2, FancyPrefView fancyPrefView9, FancyPrefView fancyPrefView10) {
        this.f92354a = scrollView;
        this.f92355b = fancyPrefView3;
        this.f92356c = fancyPrefView8;
        this.f92357d = fancyPrefView9;
        this.f92358e = fancyPrefView10;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92354a;
    }
}
