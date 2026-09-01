package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nf3 {
    public final /* synthetic */ rz2 a;
    public final /* synthetic */ uf3 b;

    public nf3(rz2 rz2Var, uf3 uf3Var) {
        this.a = rz2Var;
        this.b = uf3Var;
    }

    public final void a(boolean z) {
        uf3 uf3Var = this.b;
        sf3 sf3Var = (sf3) uf3Var.g.a.getValue();
        if (!(sf3Var instanceof pf3) || ((pf3) sf3Var).a == z) {
            return;
        }
        vx0.c0(f76.F(uf3Var), null, null, new lj1(uf3Var, z, null, 1), 3);
    }
}
