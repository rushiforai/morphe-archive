package v9;

import android.view.View;
import android.widget.FrameLayout;
import com.teslacoilsw.launcher.preferences.fragments.ScrollEffectPreviewPagedView;

/* loaded from: classes2.dex */
public final class t implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final FrameLayout f92537a;

    /* renamed from: b, reason: collision with root package name */
    public final ScrollEffectPreviewPagedView f92538b;

    public t(FrameLayout frameLayout, ScrollEffectPreviewPagedView scrollEffectPreviewPagedView) {
        this.f92537a = frameLayout;
        this.f92538b = scrollEffectPreviewPagedView;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92537a;
    }
}
