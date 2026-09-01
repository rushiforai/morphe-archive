package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fu8 extends zl4 {
    public static final fu8 d = new fu8(0, 2, 1);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        int i;
        p46 p46Var = (p46) ym0Var.i(0);
        int iC = igcVar.c((k65) ym0Var.i(1));
        if (igcVar.t >= iC) {
            b22.a("Check failed");
        }
        vp7.E(igcVar, x60Var, iC);
        int i2 = igcVar.t;
        int iD = igcVar.v;
        while (iD >= 0 && !igcVar.x(iD)) {
            iD = igcVar.D(iD, igcVar.b);
        }
        int iT = iD + 1;
        int iK = 0;
        while (iT < i2) {
            if (igcVar.u(i2, iT)) {
                if (igcVar.x(iT)) {
                    iK = 0;
                }
                iT++;
            } else {
                iK += igcVar.x(iT) ? 1 : igcVar.b[(igcVar.q(iT) * 5) + 1] & 67108863;
                iT += igcVar.t(iT);
            }
        }
        while (true) {
            i = igcVar.t;
            if (i >= iC) {
                break;
            }
            if (igcVar.u(iC, i)) {
                int i3 = igcVar.t;
                if (i3 < igcVar.u && (igcVar.b[(igcVar.q(i3) * 5) + 1] & 1073741824) != 0) {
                    x60Var.d(igcVar.C(igcVar.t));
                    iK = 0;
                }
                igcVar.O();
            } else {
                iK += igcVar.K();
            }
        }
        if (i != iC) {
            b22.a("Check failed");
        }
        p46Var.a = iK;
    }
}
