package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ln3 implements pj6 {
    public static final ln3 a = new ln3();
    public static final u0a b = new u0a("kotlin.time.Duration", r0a.m);

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        long j = ((in3) obj).a;
        int i = in3.d;
        StringBuilder sb = new StringBuilder();
        if (j < 0) {
            sb.append('-');
        }
        sb.append("PT");
        long jL = j < 0 ? in3.l(j) : j;
        long j2 = in3.j(jL, mn3.HOURS);
        boolean z = false;
        int iJ = in3.g(jL) ? 0 : (int) (in3.j(jL, mn3.MINUTES) % 60);
        int iJ2 = in3.g(jL) ? 0 : (int) (in3.j(jL, mn3.SECONDS) % 60);
        int iF = in3.f(jL);
        if (in3.g(j)) {
            j2 = 9999999999999L;
        }
        boolean z2 = j2 != 0;
        boolean z3 = (iJ2 == 0 && iF == 0) ? false : true;
        if (iJ != 0 || (z3 && z2)) {
            z = true;
        }
        if (z2) {
            sb.append(j2);
            sb.append('H');
        }
        if (z) {
            sb.append(iJ);
            sb.append('M');
        }
        if (z3 || (!z2 && !z)) {
            in3.b(sb, iJ2, iF, 9, "S", true);
        }
        xtcVar.r(sb.toString());
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        int i = in3.d;
        String strR = kw2Var.r();
        strR.getClass();
        try {
            return new in3(hlg.L(strR));
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(ev6.x("Invalid ISO duration string format: '", strR, "'."), e);
        }
    }
}
