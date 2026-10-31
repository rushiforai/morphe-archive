package v9;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefIconView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPreviewLayout;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;

/* loaded from: classes2.dex */
public final class a implements l7.a {
    public final RadioButton A;
    public final RadioButton B;

    /* renamed from: a, reason: collision with root package name */
    public final FancyPreviewLayout f92221a;

    /* renamed from: b, reason: collision with root package name */
    public final FancyPrefView f92222b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefCheckableView f92223c;

    /* renamed from: d, reason: collision with root package name */
    public final TextView f92224d;

    /* renamed from: e, reason: collision with root package name */
    public final FancyPrefIconView f92225e;

    /* renamed from: f, reason: collision with root package name */
    public final LinearLayout f92226f;

    /* renamed from: g, reason: collision with root package name */
    public final TextView f92227g;

    /* renamed from: h, reason: collision with root package name */
    public final FrameLayout f92228h;

    /* renamed from: i, reason: collision with root package name */
    public final FancyPrefIconView f92229i;

    /* renamed from: j, reason: collision with root package name */
    public final FancyPrefCheckableView f92230j;

    /* renamed from: k, reason: collision with root package name */
    public final DoubleShadowBubbleTextView f92231k;

    /* renamed from: l, reason: collision with root package name */
    public final ScrollView f92232l;

    /* renamed from: m, reason: collision with root package name */
    public final FancyPrefCheckableView f92233m;
    public final FancyPrefCheckableView n;
    public final LinearLayout o;

    /* renamed from: p, reason: collision with root package name */
    public final ProgressBar f92234p;

    /* renamed from: q, reason: collision with root package name */
    public final FancyPrefCheckableView f92235q;

    /* renamed from: r, reason: collision with root package name */
    public final FancyPrefSpinnerView f92236r;

    /* renamed from: s, reason: collision with root package name */
    public final FancyPrefCheckableView f92237s;

    /* renamed from: t, reason: collision with root package name */
    public final RadioButton f92238t;

    /* renamed from: u, reason: collision with root package name */
    public final RadioButton f92239u;

    /* renamed from: v, reason: collision with root package name */
    public final m0 f92240v;

    /* renamed from: w, reason: collision with root package name */
    public final RadioButton f92241w;

    /* renamed from: x, reason: collision with root package name */
    public final RadioButton f92242x;

    /* renamed from: y, reason: collision with root package name */
    public final DumbRadioGrid f92243y;

    /* renamed from: z, reason: collision with root package name */
    public final RadioButton f92244z;

    public a(FancyPreviewLayout fancyPreviewLayout, FancyPrefView fancyPrefView, FancyPrefCheckableView fancyPrefCheckableView, TextView textView, FancyPrefIconView fancyPrefIconView, LinearLayout linearLayout, TextView textView2, FrameLayout frameLayout, FancyPrefIconView fancyPrefIconView2, FancyPrefCheckableView fancyPrefCheckableView2, DoubleShadowBubbleTextView doubleShadowBubbleTextView, ScrollView scrollView, FancyPrefCheckableView fancyPrefCheckableView3, FancyPrefCheckableView fancyPrefCheckableView4, LinearLayout linearLayout2, ProgressBar progressBar, FancyPrefCheckableView fancyPrefCheckableView5, FancyPrefSpinnerView fancyPrefSpinnerView, FancyPrefCheckableView fancyPrefCheckableView6, RadioButton radioButton, RadioButton radioButton2, m0 m0Var, RadioButton radioButton3, RadioButton radioButton4, DumbRadioGrid dumbRadioGrid, RadioButton radioButton5, RadioButton radioButton6, RadioButton radioButton7) {
        this.f92221a = fancyPreviewLayout;
        this.f92222b = fancyPrefView;
        this.f92223c = fancyPrefCheckableView;
        this.f92224d = textView;
        this.f92225e = fancyPrefIconView;
        this.f92226f = linearLayout;
        this.f92227g = textView2;
        this.f92228h = frameLayout;
        this.f92229i = fancyPrefIconView2;
        this.f92230j = fancyPrefCheckableView2;
        this.f92231k = doubleShadowBubbleTextView;
        this.f92232l = scrollView;
        this.f92233m = fancyPrefCheckableView3;
        this.n = fancyPrefCheckableView4;
        this.o = linearLayout2;
        this.f92234p = progressBar;
        this.f92235q = fancyPrefCheckableView5;
        this.f92236r = fancyPrefSpinnerView;
        this.f92237s = fancyPrefCheckableView6;
        this.f92238t = radioButton;
        this.f92239u = radioButton2;
        this.f92240v = m0Var;
        this.f92241w = radioButton3;
        this.f92242x = radioButton4;
        this.f92243y = dumbRadioGrid;
        this.f92244z = radioButton5;
        this.A = radioButton6;
        this.B = radioButton7;
    }

    public static a b(LayoutInflater layoutInflater) {
        View viewInflate = layoutInflater.inflate(2131623967, (ViewGroup) null, false);
        int i5 = 2131427451;
        FancyPrefView fancyPrefView = (FancyPrefView) ab.e0.x(2131427451, viewInflate);
        if (fancyPrefView != null) {
            i5 = 2131427452;
            FancyPrefCheckableView fancyPrefCheckableView = (FancyPrefCheckableView) ab.e0.x(2131427452, viewInflate);
            if (fancyPrefCheckableView != null) {
                i5 = 2131427453;
                TextView textView = (TextView) ab.e0.x(2131427453, viewInflate);
                if (textView != null) {
                    i5 = 2131427531;
                    if (((ImageView) ab.e0.x(2131427531, viewInflate)) != null) {
                        i5 = 2131427749;
                        if (((FrameLayout) ab.e0.x(2131427749, viewInflate)) != null) {
                            i5 = 2131427809;
                            FancyPrefIconView fancyPrefIconView = (FancyPrefIconView) ab.e0.x(2131427809, viewInflate);
                            if (fancyPrefIconView != null) {
                                i5 = 2131427810;
                                LinearLayout linearLayout = (LinearLayout) ab.e0.x(2131427810, viewInflate);
                                if (linearLayout != null) {
                                    i5 = 2131427815;
                                    TextView textView2 = (TextView) ab.e0.x(2131427815, viewInflate);
                                    if (textView2 != null) {
                                        i5 = 2131428039;
                                        FrameLayout frameLayout = (FrameLayout) ab.e0.x(2131428039, viewInflate);
                                        if (frameLayout != null) {
                                            i5 = 2131428213;
                                            FancyPrefIconView fancyPrefIconView2 = (FancyPrefIconView) ab.e0.x(2131428213, viewInflate);
                                            if (fancyPrefIconView2 != null) {
                                                i5 = 2131428214;
                                                FancyPrefCheckableView fancyPrefCheckableView2 = (FancyPrefCheckableView) ab.e0.x(2131428214, viewInflate);
                                                if (fancyPrefCheckableView2 != null) {
                                                    i5 = 2131428269;
                                                    DoubleShadowBubbleTextView doubleShadowBubbleTextView = (DoubleShadowBubbleTextView) ab.e0.x(2131428269, viewInflate);
                                                    if (doubleShadowBubbleTextView != null) {
                                                        i5 = 2131428303;
                                                        ScrollView scrollView = (ScrollView) ab.e0.x(2131428303, viewInflate);
                                                        if (scrollView != null) {
                                                            i5 = 2131428450;
                                                            FancyPrefCheckableView fancyPrefCheckableView3 = (FancyPrefCheckableView) ab.e0.x(2131428450, viewInflate);
                                                            if (fancyPrefCheckableView3 != null) {
                                                                i5 = 2131428608;
                                                                FancyPrefCheckableView fancyPrefCheckableView4 = (FancyPrefCheckableView) ab.e0.x(2131428608, viewInflate);
                                                                if (fancyPrefCheckableView4 != null) {
                                                                    i5 = 2131428626;
                                                                    if (((RelativeLayout) ab.e0.x(2131428626, viewInflate)) != null) {
                                                                        i5 = 2131428633;
                                                                        LinearLayout linearLayout2 = (LinearLayout) ab.e0.x(2131428633, viewInflate);
                                                                        if (linearLayout2 != null) {
                                                                            i5 = 2131428653;
                                                                            ProgressBar progressBar = (ProgressBar) ab.e0.x(2131428653, viewInflate);
                                                                            if (progressBar != null) {
                                                                                i5 = 2131428699;
                                                                                FancyPrefCheckableView fancyPrefCheckableView5 = (FancyPrefCheckableView) ab.e0.x(2131428699, viewInflate);
                                                                                if (fancyPrefCheckableView5 != null) {
                                                                                    i5 = 2131428700;
                                                                                    FancyPrefSpinnerView fancyPrefSpinnerView = (FancyPrefSpinnerView) ab.e0.x(2131428700, viewInflate);
                                                                                    if (fancyPrefSpinnerView != null) {
                                                                                        i5 = 2131428818;
                                                                                        FancyPrefCheckableView fancyPrefCheckableView6 = (FancyPrefCheckableView) ab.e0.x(2131428818, viewInflate);
                                                                                        if (fancyPrefCheckableView6 != null) {
                                                                                            i5 = 2131428821;
                                                                                            RadioButton radioButton = (RadioButton) ab.e0.x(2131428821, viewInflate);
                                                                                            if (radioButton != null) {
                                                                                                i5 = 2131428822;
                                                                                                RadioButton radioButton2 = (RadioButton) ab.e0.x(2131428822, viewInflate);
                                                                                                if (radioButton2 != null) {
                                                                                                    i5 = 2131428823;
                                                                                                    View viewX = ab.e0.x(2131428823, viewInflate);
                                                                                                    if (viewX != null) {
                                                                                                        m0 m0VarA = m0.a(viewX);
                                                                                                        i5 = 2131428824;
                                                                                                        RadioButton radioButton3 = (RadioButton) ab.e0.x(2131428824, viewInflate);
                                                                                                        if (radioButton3 != null) {
                                                                                                            i5 = 2131428825;
                                                                                                            RadioButton radioButton4 = (RadioButton) ab.e0.x(2131428825, viewInflate);
                                                                                                            if (radioButton4 != null) {
                                                                                                                i5 = 2131428826;
                                                                                                                DumbRadioGrid dumbRadioGrid = (DumbRadioGrid) ab.e0.x(2131428826, viewInflate);
                                                                                                                if (dumbRadioGrid != null) {
                                                                                                                    i5 = 2131428830;
                                                                                                                    RadioButton radioButton5 = (RadioButton) ab.e0.x(2131428830, viewInflate);
                                                                                                                    if (radioButton5 != null) {
                                                                                                                        i5 = 2131428834;
                                                                                                                        RadioButton radioButton6 = (RadioButton) ab.e0.x(2131428834, viewInflate);
                                                                                                                        if (radioButton6 != null) {
                                                                                                                            i5 = 2131428836;
                                                                                                                            RadioButton radioButton7 = (RadioButton) ab.e0.x(2131428836, viewInflate);
                                                                                                                            if (radioButton7 != null) {
                                                                                                                                return new a((FancyPreviewLayout) viewInflate, fancyPrefView, fancyPrefCheckableView, textView, fancyPrefIconView, linearLayout, textView2, frameLayout, fancyPrefIconView2, fancyPrefCheckableView2, doubleShadowBubbleTextView, scrollView, fancyPrefCheckableView3, fancyPrefCheckableView4, linearLayout2, progressBar, fancyPrefCheckableView5, fancyPrefSpinnerView, fancyPrefCheckableView6, radioButton, radioButton2, m0VarA, radioButton3, radioButton4, dumbRadioGrid, radioButton5, radioButton6, radioButton7);
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
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i5)));
    }

    public final FancyPreviewLayout a() {
        return this.f92221a;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92221a;
    }
}
