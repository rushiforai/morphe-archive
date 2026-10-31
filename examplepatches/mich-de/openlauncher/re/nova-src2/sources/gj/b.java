package gj;

import android.view.View;

/* loaded from: classes3.dex */
public final class b extends a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f57688a;

    public b(d dVar) {
        this.f57688a = dVar;
    }

    @Override // gj.a
    public final void b(View view) {
    }

    @Override // gj.a
    public final void c(int i5, View view) {
        if (i5 == 5) {
            this.f57688a.cancel();
        }
    }
}
