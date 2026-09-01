package defpackage;

import android.content.Context;
import android.os.Handler;
import android.view.View;
import android.view.Window;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l15 extends gx1 implements wue, jq8, v7, hpb, o25 {
    public final m15 v;
    public final Context w;
    public final Handler x;
    public final g25 y;
    public final /* synthetic */ m15 z;

    public l15(m15 m15Var) {
        this.z = m15Var;
        Handler handler = new Handler();
        this.y = new g25();
        this.v = m15Var;
        this.w = m15Var;
        this.x = handler;
    }

    @Override // defpackage.gx1
    public final View T(int i) {
        return this.z.findViewById(i);
    }

    @Override // defpackage.gx1
    public final boolean U() {
        Window window = this.z.getWindow();
        return (window == null || window.peekDecorView() == null) ? false : true;
    }

    @Override // defpackage.v7
    public final r7 getActivityResultRegistry() {
        return this.z.getActivityResultRegistry();
    }

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        return this.z.b;
    }

    @Override // defpackage.jq8
    public final iq8 getOnBackPressedDispatcher() {
        return this.z.getOnBackPressedDispatcher();
    }

    @Override // defpackage.hpb
    public final epb getSavedStateRegistry() {
        return this.z.getSavedStateRegistry();
    }

    @Override // defpackage.wue
    public final vue getViewModelStore() {
        return this.z.getViewModelStore();
    }

    @Override // defpackage.o25
    public final void a(f25 f25Var, j15 j15Var) {
    }
}
