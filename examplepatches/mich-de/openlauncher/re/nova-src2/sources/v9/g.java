package v9;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.teslacoilsw.launcher.search.TouchPositionLinearLayout;
import com.teslacoilsw.launcher.widget.DumbGridLayout;

/* loaded from: classes2.dex */
public final class g implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final LinearLayout f92340a;

    /* renamed from: b, reason: collision with root package name */
    public final LinearLayout f92341b;

    /* renamed from: c, reason: collision with root package name */
    public final DumbGridLayout f92342c;

    /* renamed from: d, reason: collision with root package name */
    public final ImageView f92343d;

    /* renamed from: e, reason: collision with root package name */
    public final ImageView f92344e;

    /* renamed from: f, reason: collision with root package name */
    public final TouchPositionLinearLayout f92345f;

    /* renamed from: g, reason: collision with root package name */
    public final TextView f92346g;

    /* renamed from: h, reason: collision with root package name */
    public final TextView f92347h;

    public g(LinearLayout linearLayout, LinearLayout linearLayout2, DumbGridLayout dumbGridLayout, ImageView imageView, ImageView imageView2, TouchPositionLinearLayout touchPositionLinearLayout, TextView textView, TextView textView2) {
        this.f92340a = linearLayout;
        this.f92341b = linearLayout2;
        this.f92342c = dumbGridLayout;
        this.f92343d = imageView;
        this.f92344e = imageView2;
        this.f92345f = touchPositionLinearLayout;
        this.f92346g = textView;
        this.f92347h = textView2;
    }

    public static g b(LayoutInflater layoutInflater, ViewGroup viewGroup, boolean z11) {
        View viewInflate = layoutInflater.inflate(2131624051, viewGroup, false);
        if (z11) {
            viewGroup.addView(viewInflate);
        }
        int i5 = 2131427441;
        LinearLayout linearLayout = (LinearLayout) ab.e0.x(2131427441, viewInflate);
        if (linearLayout != null) {
            i5 = 2131427446;
            DumbGridLayout dumbGridLayout = (DumbGridLayout) ab.e0.x(2131427446, viewInflate);
            if (dumbGridLayout != null) {
                i5 = 2131427882;
                ImageView imageView = (ImageView) ab.e0.x(2131427882, viewInflate);
                if (imageView != null) {
                    i5 = 16908294;
                    ImageView imageView2 = (ImageView) ab.e0.x(16908294, viewInflate);
                    if (imageView2 != null) {
                        i5 = 2131428302;
                        TouchPositionLinearLayout touchPositionLinearLayout = (TouchPositionLinearLayout) ab.e0.x(2131428302, viewInflate);
                        if (touchPositionLinearLayout != null) {
                            i5 = 16908304;
                            TextView textView = (TextView) ab.e0.x(16908304, viewInflate);
                            if (textView != null) {
                                i5 = 16908310;
                                TextView textView2 = (TextView) ab.e0.x(16908310, viewInflate);
                                if (textView2 != null) {
                                    return new g((LinearLayout) viewInflate, linearLayout, dumbGridLayout, imageView, imageView2, touchPositionLinearLayout, textView, textView2);
                                }
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i5)));
    }

    public final LinearLayout a() {
        return this.f92340a;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92340a;
    }
}
