package v9;

import android.view.View;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefColorView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefTransparencySeekBarView;
import com.teslacoilsw.launcher.preferences.fragments.SettingsDockBackgroundLayout;

/* loaded from: classes2.dex */
public final class w implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final SettingsDockBackgroundLayout f92548a;

    /* renamed from: b, reason: collision with root package name */
    public final FancyPrefColorView f92549b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefCheckableView f92550c;

    /* renamed from: d, reason: collision with root package name */
    public final FancyPrefCheckableView f92551d;

    /* renamed from: e, reason: collision with root package name */
    public final FancyPrefCheckableView f92552e;

    /* renamed from: f, reason: collision with root package name */
    public final View f92553f;

    /* renamed from: g, reason: collision with root package name */
    public final m0 f92554g;

    /* renamed from: h, reason: collision with root package name */
    public final FancyPrefTransparencySeekBarView f92555h;

    public w(SettingsDockBackgroundLayout settingsDockBackgroundLayout, FancyPrefColorView fancyPrefColorView, FancyPrefCheckableView fancyPrefCheckableView, FancyPrefCheckableView fancyPrefCheckableView2, FancyPrefCheckableView fancyPrefCheckableView3, View view, m0 m0Var, FancyPrefTransparencySeekBarView fancyPrefTransparencySeekBarView) {
        this.f92548a = settingsDockBackgroundLayout;
        this.f92549b = fancyPrefColorView;
        this.f92550c = fancyPrefCheckableView;
        this.f92551d = fancyPrefCheckableView2;
        this.f92552e = fancyPrefCheckableView3;
        this.f92553f = view;
        this.f92554g = m0Var;
        this.f92555h = fancyPrefTransparencySeekBarView;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92548a;
    }
}
