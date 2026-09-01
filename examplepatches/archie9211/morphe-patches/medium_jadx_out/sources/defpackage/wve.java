package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wve implements View.OnAttachStateChangeListener {
    public mv2 a;
    public enc b;
    public vve c;
    public boolean d;

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        vve vveVar = this.c;
        if (vveVar == null) {
            return;
        }
        this.d = true;
        vveVar.a.a(vveVar.b);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        vve vveVar = this.c;
        if (vveVar != null) {
            vveVar.d();
        }
    }
}
