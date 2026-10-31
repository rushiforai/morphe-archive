package i2;

import android.content.ComponentCallbacks2;
import android.content.res.Configuration;

/* loaded from: classes2.dex */
public final class d implements ComponentCallbacks2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f61101a;

    public d(e eVar) {
        this.f61101a = eVar;
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i5) {
        if (i5 >= 40) {
            this.f61101a.getClass();
        }
    }
}
