package c3;

import android.content.ComponentCallbacks2;
import android.content.res.Configuration;

/* loaded from: classes.dex */
public final class z0 implements ComponentCallbacks2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h3.d f19489a;

    public z0(h3.d dVar) {
        this.f19489a = dVar;
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        this.f19489a.a();
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
        this.f19489a.a();
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i5) {
        this.f19489a.a();
    }
}
