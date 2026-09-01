package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ya7 implements pj6 {
    public static final ya7 a = new ya7();
    public static final u0a b = new u0a("kotlin.Long", r0a.k);

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        xtcVar.k(((Number) obj).longValue());
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        return Long.valueOf(kw2Var.t());
    }
}
