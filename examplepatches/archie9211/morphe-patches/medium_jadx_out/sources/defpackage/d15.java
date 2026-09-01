package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d15 extends gx1 {
    public final /* synthetic */ j15 v;

    public d15(j15 j15Var) {
        this.v = j15Var;
    }

    @Override // defpackage.gx1
    public final View T(int i) {
        j15 j15Var = this.v;
        View view = j15Var.G;
        if (view != null) {
            return view.findViewById(i);
        }
        ygf.f(km4.x("Fragment ", j15Var, " does not have a view"));
        return null;
    }

    @Override // defpackage.gx1
    public final boolean U() {
        return this.v.G != null;
    }
}
