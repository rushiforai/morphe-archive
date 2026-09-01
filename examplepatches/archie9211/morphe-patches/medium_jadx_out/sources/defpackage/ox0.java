package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ox0 {
    public final sl a;

    public ox0(px0 px0Var, m73 m73Var, ww wwVar, x45 x45Var) {
        this.a = new sl(px0Var, new s0(11, m73Var), new ik(m73Var, 1), wwVar, x45Var);
    }

    public final Object a(p4d p4dVar) {
        sl slVar = this.a;
        hh7 hh7VarD = slVar.d();
        px0 px0Var = px0.Expanded;
        if (!hh7VarD.a.containsKey(px0Var)) {
            px0Var = px0.Collapsed;
        }
        Object objX = sgg.x(slVar, px0Var, slVar.j.g(), p4dVar);
        return objX == tb2.COROUTINE_SUSPENDED ? objX : c1e.a;
    }
}
