package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kl0 implements q51 {
    public final jl0[] a;

    public kl0(jl0[] jl0VarArr) {
        this.a = jl0VarArr;
    }

    public final void a() {
        for (jl0 jl0Var : this.a) {
            yh3 yh3Var = jl0Var.f;
            if (yh3Var == null) {
                g76.g0("handle");
                throw null;
            }
            yh3Var.dispose();
        }
    }

    @Override // defpackage.q51
    public final void b(Throwable th) {
        a();
    }

    public final String toString() {
        return "DisposeHandlersOnCancel[" + this.a + ']';
    }
}
