package py;

import android.content.ComponentCallbacks;
import android.content.res.Configuration;

/* loaded from: classes.dex */
public final class b implements ComponentCallbacks {
    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        int i5 = configuration.uiMode & 48;
        c.f83128b.getClass();
        if (i5 != c.f83129c) {
            c.f83129c = i5;
            c.a();
        }
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
    }
}
