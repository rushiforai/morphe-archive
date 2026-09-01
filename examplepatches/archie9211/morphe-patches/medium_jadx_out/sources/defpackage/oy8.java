package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oy8 implements ht6 {
    public final gz8 a;

    public oy8(gz8 gz8Var) {
        this.a = gz8Var;
    }

    @Override // defpackage.ht6
    public final int a() {
        return this.a.o();
    }

    @Override // defpackage.ht6
    public final int b() {
        return Math.min(r1.o() - 1, ((el7) bu1.H0(this.a.n().a)).a);
    }

    @Override // defpackage.ht6
    public final int c() {
        int i;
        gz8 gz8Var = this.a;
        if (gz8Var.n().a.size() == 0) {
            return 0;
        }
        int iU = lk7.u(gz8Var.n());
        int i2 = gz8Var.n().b + gz8Var.n().c;
        if (i2 != 0 && (i = iU / i2) >= 1) {
            return i;
        }
        return 1;
    }

    @Override // defpackage.ht6
    public final boolean d() {
        return !this.a.n().a.isEmpty();
    }

    @Override // defpackage.ht6
    public final int e() {
        return Math.max(0, this.a.e);
    }
}
