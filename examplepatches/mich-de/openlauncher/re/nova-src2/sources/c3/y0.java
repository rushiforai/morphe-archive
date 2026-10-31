package c3;

import android.content.ComponentCallbacks2;
import android.content.res.Configuration;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes.dex */
public final class y0 implements ComponentCallbacks2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Configuration f19473a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h3.c f19474b;

    public y0(Configuration configuration, h3.c cVar) {
        this.f19473a = configuration;
        this.f19474b = cVar;
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        Configuration configuration2 = this.f19473a;
        int iUpdateFrom = configuration2.updateFrom(configuration);
        Iterator it = this.f19474b.f59038a.entrySet().iterator();
        while (it.hasNext()) {
            h3.a aVar = (h3.a) ((WeakReference) ((Map.Entry) it.next()).getValue()).get();
            if (aVar == null || Configuration.needNewResources(iUpdateFrom, aVar.f59035b)) {
                it.remove();
            }
        }
        configuration2.setTo(configuration);
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
        this.f19474b.f59038a.clear();
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i5) {
        this.f19474b.f59038a.clear();
    }
}
