package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w01 extends xx8 implements wx8 {
    public final s01 h;
    public final r98 i;
    public final n0c j;
    public g6a k;
    public ea3 l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w01(y05 y05Var, x67 x67Var, b38 b38Var, g6a g6aVar, s01 s01Var) {
        super(b38Var, y05Var);
        y05Var.getClass();
        b38Var.getClass();
        this.h = s01Var;
        n6a n6aVar = g6aVar.d;
        n6aVar.getClass();
        m6a m6aVar = g6aVar.e;
        m6aVar.getClass();
        r98 r98Var = new r98(n6aVar, m6aVar);
        this.i = r98Var;
        this.j = new n0c(g6aVar, r98Var, s01Var, new zkc(24, this));
        this.k = g6aVar;
    }

    @Override // defpackage.wx8
    public final ev7 H() {
        ea3 ea3Var = this.l;
        if (ea3Var != null) {
            return ea3Var;
        }
        g76.g0("_memberScope");
        throw null;
    }

    @Override // defpackage.xx8, defpackage.zv2, defpackage.b2
    public final String toString() {
        StringBuilder sb = new StringBuilder("builtins package fragment for ");
        sb.append(this.f);
        sb.append(" from ");
        int i = f93.a;
        b38 b38VarD = d93.d(this);
        b38VarD.getClass();
        sb.append(b38VarD);
        return sb.toString();
    }

    public final void z0(i93 i93Var) {
        i93Var.getClass();
        g6a g6aVar = this.k;
        if (g6aVar == null) {
            ygf.f("Repeated call to DeserializedPackageFragmentImpl::initialize");
            return;
        }
        this.k = null;
        e6a e6aVar = g6aVar.f;
        e6aVar.getClass();
        this.l = new ea3(this, e6aVar, this.i, this.h, null, i93Var, "scope of " + this, new v2(10, this));
    }
}
