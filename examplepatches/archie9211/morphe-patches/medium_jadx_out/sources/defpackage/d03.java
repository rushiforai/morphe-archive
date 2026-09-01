package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d03 {
    public int a;
    public boolean b;
    public int c;
    public float d;
    public Object e;

    public static int a(cv6 cv6Var, boolean z) {
        return z ? ((dv6) bu1.H0(cv6Var.k)).a + 1 : ((dv6) bu1.x0(cv6Var.k)).a - 1;
    }

    public static int b(mr6 mr6Var, boolean z) {
        if (z) {
            nr6 nr6Var = (nr6) bu1.H0(mr6Var.m);
            return (mr6Var.q == hw8.Vertical ? nr6Var.u : nr6Var.v) + 1;
        }
        nr6 nr6Var2 = (nr6) bu1.x0(mr6Var.m);
        return (mr6Var.q == hw8.Vertical ? nr6Var2.u : nr6Var2.v) - 1;
    }
}
