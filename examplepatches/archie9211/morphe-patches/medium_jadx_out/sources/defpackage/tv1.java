package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class tv1 {
    public static final sn3 a = new sn3(1, new n7(16));

    public static final long a(sv1 sv1Var, long j) {
        long jD = sv1Var.d();
        k49 k49Var = sv1Var.i;
        k49 k49Var2 = sv1Var.h;
        int i = uu1.i;
        return ezd.a(j, jD) ? ((uu1) k49Var2.getValue()).a : ezd.a(j, ((uu1) sv1Var.b.getValue()).a) ? ((uu1) k49Var2.getValue()).a : ezd.a(j, ((uu1) sv1Var.c.getValue()).a) ? ((uu1) k49Var.getValue()).a : ezd.a(j, ((uu1) sv1Var.d.getValue()).a) ? ((uu1) k49Var.getValue()).a : ezd.a(j, sv1Var.a()) ? ((uu1) sv1Var.j.getValue()).a : ezd.a(j, sv1Var.e()) ? sv1Var.c() : ezd.a(j, sv1Var.b()) ? ((uu1) sv1Var.l.getValue()).a : uu1.h;
    }

    public static final long b(long j, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(-583917585);
        long jA = a((sv1) p65Var.j(a), j);
        if (jA == 16) {
            jA = ((uu1) p65Var.j(d82.a)).a;
        }
        p65Var.p(false);
        return jA;
    }
}
