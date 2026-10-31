package ah;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class g implements j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ FrameLayout f12814a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LayoutInflater f12815b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ViewGroup f12816c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Bundle f12817d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ a f12818e;

    public g(a aVar, FrameLayout frameLayout, LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.f12814a = frameLayout;
        this.f12815b = layoutInflater;
        this.f12816c = viewGroup;
        this.f12817d = bundle;
        Objects.requireNonNull(aVar);
        this.f12818e = aVar;
    }

    @Override // ah.j
    public final int a() {
        return 2;
    }

    @Override // ah.j
    public final void b() {
        FrameLayout frameLayout = this.f12814a;
        frameLayout.removeAllViews();
        frameLayout.addView(((c) this.f12818e.f12803a).c(this.f12815b, this.f12816c, this.f12817d));
    }
}
