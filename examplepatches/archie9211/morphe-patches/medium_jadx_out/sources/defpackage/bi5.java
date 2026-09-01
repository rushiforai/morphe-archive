package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bi5 implements gd9 {
    public final xd a;
    public final lp8 b;
    public long c = 0;

    public bi5(xd xdVar, lp8 lp8Var) {
        this.a = xdVar;
        this.b = lp8Var;
    }

    @Override // defpackage.gd9
    public final long C(o46 o46Var, long j, ip6 ip6Var, long j2) {
        long jA = this.b.a();
        if ((9223372034707292159L & jA) == 9205357640488583168L) {
            jA = this.c;
        }
        this.c = jA;
        return k46.d(k46.d(o46Var.c(), d46.c0(jA)), this.a.a(j2, 0L, ip6Var));
    }
}
