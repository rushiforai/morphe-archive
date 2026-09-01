package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tg7 implements gd9 {
    public final olb a;
    public s46 b;
    public ip6 c;
    public s46 d;
    public k46 e;

    public tg7(olb olbVar) {
        this.a = olbVar;
    }

    @Override // defpackage.gd9
    public final long C(o46 o46Var, long j, ip6 ip6Var, long j2) {
        k46 k46Var = this.e;
        if (k46Var != null) {
            s46 s46Var = this.b;
            if ((s46Var == null ? false : s46.a(s46Var.a, j)) && this.c == ip6Var) {
                s46 s46Var2 = this.d;
                if (s46Var2 != null ? s46.a(s46Var2.a, j2) : false) {
                    return k46Var.a;
                }
            }
        }
        long jC = this.a.C(o46Var, j, ip6Var, j2);
        this.b = new s46(j);
        this.c = ip6Var;
        this.d = new s46(j2);
        this.e = new k46(jC);
        return jC;
    }
}
