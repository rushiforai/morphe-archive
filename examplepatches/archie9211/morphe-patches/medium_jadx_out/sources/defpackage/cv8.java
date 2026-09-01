package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cv8 extends zl4 {
    public static final cv8 d = new cv8(1, 0, 2);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        int iH = ym0Var.h(0);
        int i = igcVar.v;
        int iM = igcVar.M(igcVar.q(i), igcVar.b);
        int iF = igcVar.f(igcVar.q(i + 1), igcVar.b);
        for (int iMax = Math.max(iM, iF - iH); iMax < iF; iMax++) {
            Object obj = igcVar.c[igcVar.g(iMax)];
            if (obj instanceof t65) {
                l3bVar.f((t65) obj);
            } else if (obj instanceof mwa) {
                ((mwa) obj).d();
            }
        }
        if (iH <= 0) {
            b22.a("Check failed");
        }
        int i2 = igcVar.v;
        int iM2 = igcVar.M(igcVar.q(i2), igcVar.b);
        int iF2 = igcVar.f(igcVar.q(i2 + 1), igcVar.b) - iH;
        if (iF2 < iM2) {
            b22.a("Check failed");
        }
        igcVar.I(iF2, iH, i2);
        int i3 = igcVar.i;
        if (i3 >= iM2) {
            igcVar.i = i3 - iH;
        }
    }
}
