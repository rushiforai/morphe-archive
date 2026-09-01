package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fjb extends xa6 {
    public final za6 e;

    public fjb(za6 za6Var) {
        this.e = za6Var;
    }

    @Override // defpackage.xa6
    public final boolean l() {
        return false;
    }

    @Override // defpackage.xa6
    public final void m(Throwable th) {
        Object objH = k().H();
        boolean z = objH instanceof cy1;
        za6 za6Var = this.e;
        if (z) {
            za6Var.resumeWith(br7.n(((cy1) objH).a));
        } else {
            za6Var.resumeWith(o7f.K(objH));
        }
    }
}
