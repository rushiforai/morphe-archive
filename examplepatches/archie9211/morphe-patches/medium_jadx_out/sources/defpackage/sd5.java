package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sd5 extends k78 {
    @Override // defpackage.k78
    public final k78 D(x45 x45Var, x45 x45Var2) {
        return (k78) ((oic) uic.b(new ju0(4, new dy4(x45Var, 3, x45Var2))));
    }

    @Override // defpackage.k78, defpackage.oic
    public final void c() {
        synchronized (uic.c) {
            o();
        }
    }

    @Override // defpackage.k78, defpackage.oic
    public final void k() {
        to7.y();
        throw null;
    }

    @Override // defpackage.k78, defpackage.oic
    public final void l() {
        to7.y();
        throw null;
    }

    @Override // defpackage.k78, defpackage.oic
    public final void m() {
        uic.c();
    }

    @Override // defpackage.k78, defpackage.oic
    public final oic u(x45 x45Var) {
        return (vua) ((oic) uic.b(new ju0(4, new rd5(0, x45Var))));
    }

    @Override // defpackage.k78
    public final fo7 w() {
        throw new IllegalStateException("Cannot apply the global snapshot directly. Call Snapshot.advanceGlobalSnapshot");
    }
}
