package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q23 implements m3c {
    public final long a;

    public q23(long j) {
        this.a = j;
    }

    @Override // defpackage.m3c
    public final er7 a(long j, ip6 ip6Var, m73 m73Var) {
        br brVarA = er.a();
        long j2 = this.a;
        float fZ = m73Var.Z(yj3.b(j2));
        float fZ2 = m73Var.Z(yj3.a(j2));
        brVarA.d(0.0f, 0.0f);
        brVarA.c(fZ / 2.0f, 0.0f);
        brVarA.c(0.0f, fZ2);
        brVarA.c((-fZ) / 2.0f, 0.0f);
        brVarA.a();
        return new nw8(brVarA);
    }
}
