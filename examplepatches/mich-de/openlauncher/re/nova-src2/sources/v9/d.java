package v9;

import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.android.launcher3.InsettableFrameLayout;
import com.teslacoilsw.launcher.novawidget.WeatherWidget;
import com.teslacoilsw.launcher.preferences.SettingsInsetFragmentContainer;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchEditText;
import com.teslacoilsw.launcher.search.AppSearchFloatingView;
import com.teslacoilsw.launcher.widget.AlphaOptimizedEditText;
import com.teslacoilsw.launcher.widget.AlphaOptimizedImageView;
import com.teslacoilsw.launcher.widget.AlphaOptimizedLinearLayout;
import com.teslacoilsw.launcher.widget.AlphaOptimizedTextView;
import com.teslacoilsw.launcher.widget.FontFamilyToolbar;

/* loaded from: classes2.dex */
public final class d implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f92296a;

    /* renamed from: b, reason: collision with root package name */
    public final ViewGroup f92297b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f92298c;

    /* renamed from: d, reason: collision with root package name */
    public final View f92299d;

    /* renamed from: e, reason: collision with root package name */
    public final View f92300e;

    /* renamed from: f, reason: collision with root package name */
    public final View f92301f;

    /* renamed from: g, reason: collision with root package name */
    public final View f92302g;

    /* renamed from: h, reason: collision with root package name */
    public final View f92303h;

    public /* synthetic */ d(ViewGroup viewGroup, Object obj, TextView textView, View view, View view2, View view3, View view4, int i5) {
        this.f92296a = i5;
        this.f92297b = viewGroup;
        this.f92298c = obj;
        this.f92299d = textView;
        this.f92300e = view;
        this.f92301f = view2;
        this.f92302g = view3;
        this.f92303h = view4;
    }

    public static d a(AppSearchFloatingView appSearchFloatingView) {
        int i5 = 2131427503;
        View viewX = ab.e0.x(2131427503, appSearchFloatingView);
        if (viewX != null) {
            e eVarA = e.a(viewX);
            i5 = 2131427680;
            if (((AlphaOptimizedImageView) ab.e0.x(2131427680, appSearchFloatingView)) != null) {
                i5 = 2131427941;
                AlphaOptimizedEditText alphaOptimizedEditText = (AlphaOptimizedEditText) ab.e0.x(2131427941, appSearchFloatingView);
                if (alphaOptimizedEditText != null) {
                    i5 = 2131428778;
                    NovaSearchEditText novaSearchEditText = (NovaSearchEditText) ab.e0.x(2131428778, appSearchFloatingView);
                    if (novaSearchEditText != null) {
                        i5 = 2131428781;
                        FrameLayout frameLayout = (FrameLayout) ab.e0.x(2131428781, appSearchFloatingView);
                        if (frameLayout != null) {
                            i5 = 2131428785;
                            AlphaOptimizedImageView alphaOptimizedImageView = (AlphaOptimizedImageView) ab.e0.x(2131428785, appSearchFloatingView);
                            if (alphaOptimizedImageView != null) {
                                i5 = 2131428786;
                                AlphaOptimizedLinearLayout alphaOptimizedLinearLayout = (AlphaOptimizedLinearLayout) ab.e0.x(2131428786, appSearchFloatingView);
                                if (alphaOptimizedLinearLayout != null) {
                                    i5 = 2131428941;
                                    if (((AlphaOptimizedTextView) ab.e0.x(2131428941, appSearchFloatingView)) != null) {
                                        return new d(appSearchFloatingView, eVarA, alphaOptimizedEditText, novaSearchEditText, frameLayout, alphaOptimizedImageView, alphaOptimizedLinearLayout, 0);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(appSearchFloatingView.getResources().getResourceName(i5)));
    }

    @Override // l7.a
    public final View getRoot() {
        switch (this.f92296a) {
            case 0:
                return (AppSearchFloatingView) this.f92297b;
            case 1:
                return (WeatherWidget) this.f92297b;
            default:
                return (FrameLayout) this.f92301f;
        }
    }

    public d(FrameLayout frameLayout, SettingsInsetFragmentContainer settingsInsetFragmentContainer, FrameLayout frameLayout2, FontFamilyToolbar fontFamilyToolbar, FrameLayout frameLayout3, TextView textView, InsettableFrameLayout insettableFrameLayout) {
        this.f92296a = 2;
        this.f92301f = frameLayout;
        this.f92297b = settingsInsetFragmentContainer;
        this.f92298c = frameLayout2;
        this.f92299d = fontFamilyToolbar;
        this.f92300e = frameLayout3;
        this.f92302g = textView;
        this.f92303h = insettableFrameLayout;
    }
}
