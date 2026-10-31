package v9;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;

/* loaded from: classes2.dex */
public final class f implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final FrameLayout f92332a;

    /* renamed from: b, reason: collision with root package name */
    public final ImageView f92333b;

    public f(FrameLayout frameLayout, ImageView imageView) {
        this.f92332a = frameLayout;
        this.f92333b = imageView;
    }

    public static f b(LayoutInflater layoutInflater, ViewGroup viewGroup) {
        View viewInflate = layoutInflater.inflate(2131624049, viewGroup, false);
        ImageView imageView = (ImageView) ab.e0.x(2131428202, viewInflate);
        if (imageView != null) {
            return new f((FrameLayout) viewInflate, imageView);
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428202)));
    }

    public final FrameLayout a() {
        return this.f92332a;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92332a;
    }
}
