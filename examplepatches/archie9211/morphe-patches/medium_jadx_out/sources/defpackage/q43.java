package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q43 implements dv1 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ q43(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.dv1
    public final long a() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                r43 r43Var = (r43) obj;
                long j = ((skb) ((q43) r43Var.v).b).c;
                if (j != 16) {
                    return j;
                }
                lkb lkbVar = (lkb) bo.K(r43Var, qkb.a);
                if (lkbVar != null) {
                    long j2 = lkbVar.a;
                    if (j2 != 16) {
                        return j2;
                    }
                }
                return ((uu1) bo.K(r43Var, c82.a)).a;
            case 1:
                r43 r43Var2 = (r43) obj;
                long j3 = ((tkb) ((q43) r43Var2.v).b).c;
                if (j3 != 16) {
                    return j3;
                }
                mkb mkbVar = (mkb) bo.K(r43Var2, rkb.a);
                if (mkbVar != null) {
                    long j4 = mkbVar.a;
                    if (j4 != 16) {
                        return j4;
                    }
                }
                long j5 = ((uu1) bo.K(r43Var2, d82.a)).a;
                return (((sv1) bo.K(r43Var2, tv1.a)).f() || ((double) op8.f0(j5)) >= 0.5d) ? j5 : uu1.d;
            case 2:
                return ((skb) obj).c;
            default:
                return ((tkb) obj).c;
        }
    }
}
