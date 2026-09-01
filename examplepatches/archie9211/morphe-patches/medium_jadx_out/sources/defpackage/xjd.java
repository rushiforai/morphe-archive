package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xjd {
    public final yy4 a;
    public final m73 b;
    public final ip6 c;
    public final vwa d = new vwa(5);

    public xjd(yy4 yy4Var, m73 m73Var, ip6 ip6Var) {
        this.a = yy4Var;
        this.b = m73Var;
        this.c = ip6Var;
    }

    public static qjd a(xjd xjdVar, String str, mkd mkdVar, int i, long j, int i2) {
        int i3 = (i2 & 4) != 0 ? 1 : 2;
        int i4 = (i2 & 16) != 0 ? Integer.MAX_VALUE : i;
        long jB = (i2 & 32) != 0 ? h72.b(0, 0, 0, 0, 15) : j;
        ip6 ip6Var = xjdVar.c;
        m73 m73Var = xjdVar.b;
        yy4 yy4Var = xjdVar.a;
        xjdVar.getClass();
        return b(xjdVar, new mx(str), mkdVar, i3, i4, jB, ip6Var, m73Var, yy4Var, 32);
    }

    public static qjd b(xjd xjdVar, mx mxVar, mkd mkdVar, int i, int i2, long j, ip6 ip6Var, m73 m73Var, yy4 yy4Var, int i3) {
        qjd qjdVar;
        yy4 yy4Var2 = (i3 & 512) != 0 ? xjdVar.a : yy4Var;
        vwa vwaVar = xjdVar.d;
        ey3 ey3Var = ey3.a;
        yy4 yy4Var3 = yy4Var2;
        pjd pjdVar = new pjd(mxVar, mkdVar, ey3Var, i2, true, i, m73Var, ip6Var, yy4Var3, j);
        qjd qjdVar2 = null;
        if (vwaVar != null) {
            m31 m31Var = new m31(pjdVar);
            bd7 bd7Var = (bd7) vwaVar.b;
            if (bd7Var != null) {
                qjdVar = (qjd) bd7Var.h(m31Var);
            } else if (g76.L((m31) vwaVar.c, m31Var)) {
                qjdVar = (qjd) vwaVar.d;
            }
            if (qjdVar != null && !qjdVar.b.a.a()) {
                qjdVar2 = qjdVar;
            }
        }
        if (qjdVar2 != null) {
            return new qjd(pjdVar, qjdVar2.b, h72.d(j, (((long) ((int) Math.ceil(r14.e))) & 4294967295L) | (((long) ((int) Math.ceil(r14.d))) << 32)));
        }
        iq1 iq1Var = new iq1(mxVar, il7.C(mkdVar, ip6Var), ey3Var, m73Var, yy4Var3);
        int iJ = f72.j(j);
        int iH = f72.d(j) ? f72.h(j) : Integer.MAX_VALUE;
        if (iJ != iH) {
            iH = iq7.v((int) Math.ceil(iq1Var.q()), iJ, iH);
        }
        qjd qjdVar3 = new qjd(pjdVar, new f58(iq1Var, g01.Q(0, iH, 0, f72.g(j)), i2, i), h72.d(j, (((long) ((int) Math.ceil(r0.e))) & 4294967295L) | (((long) ((int) Math.ceil(r0.d))) << 32)));
        if (vwaVar != null) {
            bd7 bd7Var2 = (bd7) vwaVar.b;
            if (bd7Var2 != null) {
                bd7Var2.l(new m31(pjdVar), qjdVar3);
                return qjdVar3;
            }
            vwaVar.c = new m31(pjdVar);
            vwaVar.d = qjdVar3;
        }
        return qjdVar3;
    }
}
