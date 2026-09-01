package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xyd implements pj6 {
    public static final xyd a = new xyd();
    public static final x16 b = g01.q(v11.a, "kotlin.UByte");

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        xtcVar.h(b).c(((tyd) obj).a);
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        return new tyd(kw2Var.o(b).x());
    }
}
