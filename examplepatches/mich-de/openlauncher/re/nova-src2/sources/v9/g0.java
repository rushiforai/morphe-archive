package v9;

import android.view.View;
import android.widget.ScrollView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefNightModeView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView;

/* loaded from: classes2.dex */
public final class g0 implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final ScrollView f92348a;

    /* renamed from: b, reason: collision with root package name */
    public final FancyPrefCheckableView f92349b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefSpinnerView f92350c;

    public g0(ScrollView scrollView, FancyPrefNightModeView fancyPrefNightModeView, FancyPrefCheckableView fancyPrefCheckableView, FancyPrefSpinnerView fancyPrefSpinnerView) {
        this.f92348a = scrollView;
        this.f92349b = fancyPrefCheckableView;
        this.f92350c = fancyPrefSpinnerView;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92348a;
    }
}
