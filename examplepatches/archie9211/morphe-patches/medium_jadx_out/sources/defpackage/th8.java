package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class th8 implements csd {
    public final hsd a;
    public final xx5 b;

    public th8(hsd hsdVar, xx5 xx5Var) {
        this.a = hsdVar;
        this.b = xx5Var;
    }

    @Override // defpackage.csd
    public final void a() {
        xx5 xx5Var = this.b;
        boolean z = xx5Var instanceof w0d;
        hsd hsdVar = this.a;
        if (z) {
            hsdVar.b(((w0d) xx5Var).a);
        } else if (xx5Var instanceof r14) {
            hsdVar.n(((r14) xx5Var).a);
        } else {
            ygf.a();
        }
    }
}
