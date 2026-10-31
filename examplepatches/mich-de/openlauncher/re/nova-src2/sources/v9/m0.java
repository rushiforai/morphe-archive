package v9;

import android.view.View;
import android.widget.LinearLayout;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCornerRadiusSeekBarView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView;
import com.teslacoilsw.launcher.widget.RippleScrollView;

/* loaded from: classes2.dex */
public final class m0 implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final RippleScrollView f92467a;

    /* renamed from: b, reason: collision with root package name */
    public final LinearLayout f92468b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefCornerRadiusSeekBarView f92469c;

    /* renamed from: d, reason: collision with root package name */
    public final FancyPrefSpinnerView f92470d;

    /* renamed from: e, reason: collision with root package name */
    public final LinearLayout f92471e;

    /* renamed from: f, reason: collision with root package name */
    public final FancyPrefCornerRadiusSeekBarView f92472f;

    /* renamed from: g, reason: collision with root package name */
    public final FancyPrefSpinnerView f92473g;

    /* renamed from: h, reason: collision with root package name */
    public final FancyPrefCornerRadiusSeekBarView f92474h;

    /* renamed from: i, reason: collision with root package name */
    public final FancyPrefSpinnerView f92475i;

    /* renamed from: j, reason: collision with root package name */
    public final FancyPrefCornerRadiusSeekBarView f92476j;

    /* renamed from: k, reason: collision with root package name */
    public final FancyPrefSpinnerView f92477k;

    public m0(RippleScrollView rippleScrollView, LinearLayout linearLayout, FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView, FancyPrefSpinnerView fancyPrefSpinnerView, LinearLayout linearLayout2, FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView2, FancyPrefSpinnerView fancyPrefSpinnerView2, FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView3, FancyPrefSpinnerView fancyPrefSpinnerView3, FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView4, FancyPrefSpinnerView fancyPrefSpinnerView4) {
        this.f92467a = rippleScrollView;
        this.f92468b = linearLayout;
        this.f92469c = fancyPrefCornerRadiusSeekBarView;
        this.f92470d = fancyPrefSpinnerView;
        this.f92471e = linearLayout2;
        this.f92472f = fancyPrefCornerRadiusSeekBarView2;
        this.f92473g = fancyPrefSpinnerView2;
        this.f92474h = fancyPrefCornerRadiusSeekBarView3;
        this.f92475i = fancyPrefSpinnerView3;
        this.f92476j = fancyPrefCornerRadiusSeekBarView4;
        this.f92477k = fancyPrefSpinnerView4;
    }

    public static m0 a(View view) {
        int i5 = 2131427803;
        LinearLayout linearLayout = (LinearLayout) ab.e0.x(2131427803, view);
        if (linearLayout != null) {
            i5 = 2131427804;
            FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView = (FancyPrefCornerRadiusSeekBarView) ab.e0.x(2131427804, view);
            if (fancyPrefCornerRadiusSeekBarView != null) {
                i5 = 2131427805;
                FancyPrefSpinnerView fancyPrefSpinnerView = (FancyPrefSpinnerView) ab.e0.x(2131427805, view);
                if (fancyPrefSpinnerView != null) {
                    i5 = 2131427806;
                    LinearLayout linearLayout2 = (LinearLayout) ab.e0.x(2131427806, view);
                    if (linearLayout2 != null) {
                        i5 = 2131427807;
                        FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView2 = (FancyPrefCornerRadiusSeekBarView) ab.e0.x(2131427807, view);
                        if (fancyPrefCornerRadiusSeekBarView2 != null) {
                            i5 = 2131427808;
                            FancyPrefSpinnerView fancyPrefSpinnerView2 = (FancyPrefSpinnerView) ab.e0.x(2131427808, view);
                            if (fancyPrefSpinnerView2 != null) {
                                i5 = 2131427811;
                                FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView3 = (FancyPrefCornerRadiusSeekBarView) ab.e0.x(2131427811, view);
                                if (fancyPrefCornerRadiusSeekBarView3 != null) {
                                    i5 = 2131427812;
                                    FancyPrefSpinnerView fancyPrefSpinnerView3 = (FancyPrefSpinnerView) ab.e0.x(2131427812, view);
                                    if (fancyPrefSpinnerView3 != null) {
                                        i5 = 2131427813;
                                        FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView4 = (FancyPrefCornerRadiusSeekBarView) ab.e0.x(2131427813, view);
                                        if (fancyPrefCornerRadiusSeekBarView4 != null) {
                                            i5 = 2131427814;
                                            FancyPrefSpinnerView fancyPrefSpinnerView4 = (FancyPrefSpinnerView) ab.e0.x(2131427814, view);
                                            if (fancyPrefSpinnerView4 != null) {
                                                return new m0((RippleScrollView) view, linearLayout, fancyPrefCornerRadiusSeekBarView, fancyPrefSpinnerView, linearLayout2, fancyPrefCornerRadiusSeekBarView2, fancyPrefSpinnerView2, fancyPrefCornerRadiusSeekBarView3, fancyPrefSpinnerView3, fancyPrefCornerRadiusSeekBarView4, fancyPrefSpinnerView4);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(view.getResources().getResourceName(i5)));
    }

    public final RippleScrollView b() {
        return this.f92467a;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92467a;
    }
}
