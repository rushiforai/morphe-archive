package defpackage;

import android.content.ComponentCallbacks2;
import android.content.res.Configuration;
import android.view.ViewTreeObserver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t12 implements ComponentCallbacks2, ViewTreeObserver.OnWindowFocusChangeListener {
    public final /* synthetic */ u12 a;

    public t12(u12 u12Var) {
        this.a = u12Var;
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        this.a.d(configuration);
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
        u12 u12Var = this.a;
        u12Var.f.a.clear();
        pcb pcbVar = u12Var.g;
        synchronized (pcbVar) {
            pcbVar.a.c();
        }
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i) {
        u12 u12Var = this.a;
        u12Var.f.a.clear();
        pcb pcbVar = u12Var.g;
        synchronized (pcbVar) {
            pcbVar.a.c();
        }
    }

    @Override // android.view.ViewTreeObserver.OnWindowFocusChangeListener
    public final void onWindowFocusChanged(boolean z) {
        this.a.s.c.setValue(Boolean.valueOf(z));
    }
}
