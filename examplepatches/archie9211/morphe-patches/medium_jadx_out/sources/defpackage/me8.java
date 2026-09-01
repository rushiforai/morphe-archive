package defpackage;

import android.net.ConnectivityManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class me8 implements o52 {
    public final ConnectivityManager a;

    public me8(ConnectivityManager connectivityManager) {
        this.a = connectivityManager;
    }

    @Override // defpackage.o52
    public final boolean a(c8f c8fVar) {
        if (!c(c8fVar)) {
            return false;
        }
        ygf.f("isCurrentlyConstrained() must never be called onNetworkRequestConstraintController. isCurrentlyConstrained() is called only on older platforms where NetworkRequest isn't supported");
        return false;
    }

    @Override // defpackage.o52
    public final l41 b(e72 e72Var) {
        e72Var.getClass();
        return o7f.l(new mo5(e72Var, this, (n92) null, 15));
    }

    @Override // defpackage.o52
    public final boolean c(c8f c8fVar) {
        c8fVar.getClass();
        return (c8fVar.j.a() == null && c8fVar.j.a == te8.NOT_REQUIRED) ? false : true;
    }
}
