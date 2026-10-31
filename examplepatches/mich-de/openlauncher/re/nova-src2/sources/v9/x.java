package v9;

import android.view.View;
import android.widget.ScrollView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefGridView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefIconView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefNumberPickerDialog;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefPaddingView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.preferences.widget.MatchWrapLinearLayout;

/* loaded from: classes2.dex */
public final class x implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final ScrollView f92556a;

    /* renamed from: b, reason: collision with root package name */
    public final MatchWrapLinearLayout f92557b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefCheckableView f92558c;

    /* renamed from: d, reason: collision with root package name */
    public final FancyPrefGridView f92559d;

    /* renamed from: e, reason: collision with root package name */
    public final FancyPrefNumberPickerDialog f92560e;

    /* renamed from: f, reason: collision with root package name */
    public final FancyPrefCheckableView f92561f;

    /* renamed from: g, reason: collision with root package name */
    public final FancyPrefIconView f92562g;

    /* renamed from: h, reason: collision with root package name */
    public final FancyPrefView f92563h;

    /* renamed from: i, reason: collision with root package name */
    public final FancyPrefPaddingView f92564i;

    public x(ScrollView scrollView, MatchWrapLinearLayout matchWrapLinearLayout, FancyPrefCheckableView fancyPrefCheckableView, FancyPrefGridView fancyPrefGridView, FancyPrefNumberPickerDialog fancyPrefNumberPickerDialog, FancyPrefCheckableView fancyPrefCheckableView2, FancyPrefIconView fancyPrefIconView, FancyPrefView fancyPrefView, FancyPrefPaddingView fancyPrefPaddingView) {
        this.f92556a = scrollView;
        this.f92557b = matchWrapLinearLayout;
        this.f92558c = fancyPrefCheckableView;
        this.f92559d = fancyPrefGridView;
        this.f92560e = fancyPrefNumberPickerDialog;
        this.f92561f = fancyPrefCheckableView2;
        this.f92562g = fancyPrefIconView;
        this.f92563h = fancyPrefView;
        this.f92564i = fancyPrefPaddingView;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92556a;
    }
}
