package v9;

import android.view.View;
import android.widget.TextView;
import com.teslacoilsw.launcher.preferences.widget.MatchWrapLinearLayout;
import com.teslacoilsw.launcher.widget.DumbGridLayout;

/* loaded from: classes2.dex */
public final class j0 implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final MatchWrapLinearLayout f92404a;

    /* renamed from: b, reason: collision with root package name */
    public final View f92405b;

    /* renamed from: c, reason: collision with root package name */
    public final DumbGridLayout f92406c;

    /* renamed from: d, reason: collision with root package name */
    public final MatchWrapLinearLayout f92407d;

    /* renamed from: e, reason: collision with root package name */
    public final View f92408e;

    /* renamed from: f, reason: collision with root package name */
    public final View f92409f;

    /* renamed from: g, reason: collision with root package name */
    public final View f92410g;

    /* renamed from: h, reason: collision with root package name */
    public final TextView f92411h;

    /* renamed from: i, reason: collision with root package name */
    public final k f92412i;

    /* renamed from: j, reason: collision with root package name */
    public final k f92413j;

    /* renamed from: k, reason: collision with root package name */
    public final k f92414k;

    public j0(MatchWrapLinearLayout matchWrapLinearLayout, View view, DumbGridLayout dumbGridLayout, MatchWrapLinearLayout matchWrapLinearLayout2, View view2, View view3, View view4, TextView textView, k kVar, k kVar2, k kVar3) {
        this.f92404a = matchWrapLinearLayout;
        this.f92405b = view;
        this.f92406c = dumbGridLayout;
        this.f92407d = matchWrapLinearLayout2;
        this.f92408e = view2;
        this.f92409f = view3;
        this.f92410g = view4;
        this.f92411h = textView;
        this.f92412i = kVar;
        this.f92413j = kVar2;
        this.f92414k = kVar3;
    }

    public static j0 a(View view) {
        int i5 = 2131428130;
        View viewX = ab.e0.x(2131428130, view);
        if (viewX != null) {
            i5 = 2131428131;
            DumbGridLayout dumbGridLayout = (DumbGridLayout) ab.e0.x(2131428131, view);
            if (dumbGridLayout != null) {
                i5 = 2131428460;
                MatchWrapLinearLayout matchWrapLinearLayout = (MatchWrapLinearLayout) ab.e0.x(2131428460, view);
                if (matchWrapLinearLayout != null) {
                    i5 = 2131428463;
                    View viewX2 = ab.e0.x(2131428463, view);
                    if (viewX2 != null) {
                        i5 = 2131428464;
                        View viewX3 = ab.e0.x(2131428464, view);
                        if (viewX3 != null) {
                            i5 = 2131428465;
                            View viewX4 = ab.e0.x(2131428465, view);
                            if (viewX4 != null) {
                                i5 = 2131428468;
                                TextView textView = (TextView) ab.e0.x(2131428468, view);
                                if (textView != null) {
                                    i5 = 2131428851;
                                    View viewX5 = ab.e0.x(2131428851, view);
                                    if (viewX5 != null) {
                                        k kVarA = k.a(viewX5);
                                        i5 = 2131428852;
                                        View viewX6 = ab.e0.x(2131428852, view);
                                        if (viewX6 != null) {
                                            k kVarA2 = k.a(viewX6);
                                            i5 = 2131428853;
                                            View viewX7 = ab.e0.x(2131428853, view);
                                            if (viewX7 != null) {
                                                return new j0((MatchWrapLinearLayout) view, viewX, dumbGridLayout, matchWrapLinearLayout, viewX2, viewX3, viewX4, textView, kVarA, kVarA2, k.a(viewX7));
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

    @Override // l7.a
    public final View getRoot() {
        return this.f92404a;
    }
}
