package defpackage;

import android.view.ActionProvider;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tx7 implements ActionProvider.VisibilityListener {
    public my6 a;
    public final ActionProvider b;

    public tx7(wx7 wx7Var, ActionProvider actionProvider) {
        this.b = actionProvider;
    }

    @Override // android.view.ActionProvider.VisibilityListener
    public final void onActionProviderVisibilityChanged(boolean z) {
        my6 my6Var = this.a;
        if (my6Var != null) {
            lx7 lx7Var = ((sx7) my6Var.a).n;
            lx7Var.h = true;
            lx7Var.p(true);
        }
    }
}
