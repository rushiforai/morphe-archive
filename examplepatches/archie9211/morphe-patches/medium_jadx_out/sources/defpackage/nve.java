package defpackage;

import android.view.ViewTreeObserver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nve implements ViewTreeObserver.OnPreDrawListener {
    public boolean a;
    public final /* synthetic */ vva b;
    public final /* synthetic */ ViewTreeObserver c;
    public final /* synthetic */ x51 d;

    public nve(vva vvaVar, ViewTreeObserver viewTreeObserver, x51 x51Var) {
        this.b = vvaVar;
        this.c = viewTreeObserver;
        this.d = x51Var;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        vva vvaVar = this.b;
        cfc cfcVarJ = wgd.j(vvaVar);
        if (cfcVarJ != null) {
            ViewTreeObserver viewTreeObserver = this.c;
            if (viewTreeObserver.isAlive()) {
                viewTreeObserver.removeOnPreDrawListener(this);
            } else {
                vvaVar.b.getViewTreeObserver().removeOnPreDrawListener(this);
            }
            if (!this.a) {
                this.a = true;
                this.d.resumeWith(cfcVarJ);
            }
        }
        return true;
    }
}
