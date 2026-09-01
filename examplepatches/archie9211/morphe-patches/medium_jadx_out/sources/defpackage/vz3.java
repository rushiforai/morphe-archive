package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vz3 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ xz3 b;
    public final /* synthetic */ long c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ vz3(xz3 xz3Var, long j, int i) {
        super(1);
        this.a = i;
        this.b = xz3Var;
        this.c = j;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        x45 x45Var;
        x45 x45Var2;
        int i;
        int i2 = this.a;
        long jC = 0;
        long j = this.c;
        xz3 xz3Var = this.b;
        switch (i2) {
            case 0:
                int i3 = tz3.a[((jz3) obj).ordinal()];
                if (i3 != 1) {
                    if (i3 == 2) {
                        uj1 uj1Var = xz3Var.t.a.c;
                        if (uj1Var != null && (x45Var = uj1Var.b) != null) {
                            j = ((s46) x45Var.invoke(new s46(j))).a;
                        }
                    } else {
                        if (i3 != 3) {
                            ygf.a();
                            return null;
                        }
                        uj1 uj1Var2 = xz3Var.u.a.c;
                        if (uj1Var2 != null && (x45Var2 = uj1Var2.b) != null) {
                            j = ((s46) x45Var2.invoke(new s46(j))).a;
                        }
                    }
                }
                return new s46(j);
            case 1:
                jz3 jz3Var = (jz3) obj;
                if (xz3Var.y != null && xz3Var.K0() != null && !g76.L(xz3Var.y, xz3Var.K0()) && (i = tz3.a[jz3Var.ordinal()]) != 1 && i != 2) {
                    if (i != 3) {
                        ygf.a();
                        return null;
                    }
                    uj1 uj1Var3 = xz3Var.u.a.c;
                    if (uj1Var3 != null) {
                        x45 x45Var3 = uj1Var3.b;
                        long j2 = this.c;
                        long j3 = ((s46) x45Var3.invoke(new s46(j2))).a;
                        xd xdVarK0 = xz3Var.K0();
                        xdVarK0.getClass();
                        ip6 ip6Var = ip6.Ltr;
                        long jA = xdVarK0.a(j2, j3, ip6Var);
                        xd xdVar = xz3Var.y;
                        xdVar.getClass();
                        jC = k46.c(jA, xdVar.a(j2, j3, ip6Var));
                    }
                }
                return new k46(jC);
            default:
                jz3 jz3Var2 = (jz3) obj;
                pfc pfcVar = xz3Var.t.a.b;
                long j4 = pfcVar != null ? ((k46) pfcVar.a.invoke(new s46(j))).a : 0L;
                pfc pfcVar2 = xz3Var.u.a.b;
                long j5 = pfcVar2 != null ? ((k46) pfcVar2.a.invoke(new s46(j))).a : 0L;
                int i4 = tz3.a[jz3Var2.ordinal()];
                if (i4 != 1) {
                    if (i4 == 2) {
                        jC = j4;
                    } else {
                        if (i4 != 3) {
                            ygf.a();
                            return null;
                        }
                        jC = j5;
                    }
                }
                return new k46(jC);
        }
    }
}
