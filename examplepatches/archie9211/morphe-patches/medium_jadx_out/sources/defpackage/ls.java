package defpackage;

import android.content.ComponentCallbacks2;
import android.content.res.Configuration;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ls implements ComponentCallbacks2 {
    public final /* synthetic */ ms a;

    public ls(ms msVar) {
        this.a = msVar;
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        ms msVar = this.a;
        synchronized (msVar) {
            if (((kva) ((WeakReference) msVar.b).get()) == null) {
                msVar.f();
            }
        }
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
        onTrimMemory(80);
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i) {
        pva pvaVarD;
        ms msVar = this.a;
        synchronized (msVar) {
            try {
                kva kvaVar = (kva) ((WeakReference) msVar.b).get();
                if (kvaVar != null) {
                    hva hvaVar = kvaVar.a;
                    if (i >= 40) {
                        pva pvaVarD2 = kvaVar.d();
                        if (pvaVarD2 != null) {
                            pvaVarD2.a();
                        }
                    } else if (i >= 20) {
                        ((ks) msVar.c).a(hvaVar.a);
                    } else if (i >= 10 && (pvaVarD = kvaVar.d()) != null) {
                        pvaVarD.f(pvaVarD.c() / 2);
                    }
                } else {
                    msVar.f();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
