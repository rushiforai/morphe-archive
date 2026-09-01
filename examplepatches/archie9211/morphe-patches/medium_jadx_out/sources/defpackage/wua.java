package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wua implements vpc, bo4, f65 {
    public final /* synthetic */ vpc a;
    private final va6 job;

    public wua(xpc xpcVar, enc encVar) {
        this.a = xpcVar;
        this.job = encVar;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        return this.a.b(do4Var, n92Var);
    }

    @Override // defpackage.f65
    public final bo4 c(ib2 ib2Var, int i, nz0 nz0Var) {
        return (((i < 0 || i >= 2) && i != -2) || nz0Var != nz0.DROP_OLDEST) ? k40.Y(this, ib2Var, i, nz0Var) : this;
    }

    @Override // defpackage.vpc
    public final Object getValue() {
        return this.a.getValue();
    }
}
