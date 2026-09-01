package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class rjb implements zk1 {
    public final x45 a;
    public final String b;

    public rjb(String str, x45 x45Var) {
        this.a = x45Var;
        this.b = "must return ".concat(str);
    }

    @Override // defpackage.zk1
    public final boolean a(g96 g96Var) {
        return g76.L(g96Var.h, this.a.invoke(f93.e(g96Var)));
    }

    @Override // defpackage.zk1
    public final /* bridge */ String b(g96 g96Var) {
        return o7f.A(this, g96Var);
    }

    @Override // defpackage.zk1
    public final String getDescription() {
        return this.b;
    }
}
