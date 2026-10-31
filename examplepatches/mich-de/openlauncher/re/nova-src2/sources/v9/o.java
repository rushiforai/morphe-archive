package v9;

import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;

/* loaded from: classes2.dex */
public final class o implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final FrameLayout f92498a;

    /* renamed from: b, reason: collision with root package name */
    public final ImageView f92499b;

    /* renamed from: c, reason: collision with root package name */
    public final ImageView f92500c;

    public o(FrameLayout frameLayout, ImageView imageView, ImageView imageView2) {
        this.f92498a = frameLayout;
        this.f92499b = imageView;
        this.f92500c = imageView2;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92498a;
    }
}
