package qv;

import android.view.View;
import android.widget.FrameLayout;
import com.google.android.material.progressindicator.CircularProgressIndicator;

/* loaded from: classes4.dex */
public final class b implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final FrameLayout f84330a;

    /* renamed from: b, reason: collision with root package name */
    public final CircularProgressIndicator f84331b;

    public b(FrameLayout frameLayout, CircularProgressIndicator circularProgressIndicator) {
        this.f84330a = frameLayout;
        this.f84331b = circularProgressIndicator;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f84330a;
    }
}
