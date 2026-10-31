package qv;

import android.view.View;
import android.widget.FrameLayout;
import androidx.fragment.app.FragmentContainerView;

/* loaded from: classes4.dex */
public final class a implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final FrameLayout f84328a;

    /* renamed from: b, reason: collision with root package name */
    public final FragmentContainerView f84329b;

    public a(FrameLayout frameLayout, FragmentContainerView fragmentContainerView) {
        this.f84328a = frameLayout;
        this.f84329b = fragmentContainerView;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f84328a;
    }
}
