package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ug7 extends k7 {
    public final l7 a;

    public ug7(l7 l7Var) {
        this.a = l7Var;
    }

    @Override // defpackage.k7
    public final void a(Object obj, z6 z6Var) {
        q7 q7Var = this.a.a;
        if (q7Var != null) {
            q7Var.a(obj, z6Var);
        } else {
            ygf.f("Launcher has not been initialized");
        }
    }
}
