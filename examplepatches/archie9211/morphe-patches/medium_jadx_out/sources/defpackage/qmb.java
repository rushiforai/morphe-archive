package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qmb implements pmb {
    public static final qmb a = new qmb();

    @Override // defpackage.pmb
    public final r28 a(float f, r28 r28Var, boolean z) {
        if (f <= 0.0d) {
            z16.a("invalid weight; must be greater than zero");
        }
        if (f > Float.MAX_VALUE) {
            f = Float.MAX_VALUE;
        }
        return r28Var.b(new sq6(f, z));
    }

    @Override // defpackage.pmb
    public final r28 b(r28 r28Var, zq0 zq0Var) {
        return r28Var.b(new qse(zq0Var));
    }
}
