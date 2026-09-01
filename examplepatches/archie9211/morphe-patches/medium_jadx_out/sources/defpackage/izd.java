package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class izd implements pj6 {
    public static final izd a = new izd();
    public static final x16 b = g01.q(ya7.a, "kotlin.ULong");

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        xtcVar.h(b).k(((ezd) obj).a);
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        return new ezd(kw2Var.o(b).t());
    }
}
