package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dn0 extends hj5 {
    public npc n0;
    public int o0;
    public bn0 p0;

    public dn0(qpc qpcVar) {
        super(qpcVar, opc.BARRIER);
    }

    @Override // defpackage.hj5, defpackage.c62, defpackage.sya
    public final void apply() {
        s();
        int i = cn0.a[this.n0.ordinal()];
        int i2 = 3;
        if (i == 3 || i == 4) {
            i2 = 1;
        } else if (i == 5) {
            i2 = 2;
        } else if (i != 6) {
            i2 = 0;
        }
        bn0 bn0Var = this.p0;
        bn0Var.t0 = i2;
        bn0Var.v0 = this.o0;
    }

    @Override // defpackage.c62
    public final c62 k(int i) {
        this.o0 = i;
        return this;
    }

    @Override // defpackage.c62
    public final c62 l(Float f) {
        this.o0 = this.k0.c(f);
        return this;
    }

    @Override // defpackage.hj5
    public final jj5 s() {
        bn0 bn0Var = this.p0;
        if (bn0Var != null) {
            return bn0Var;
        }
        bn0 bn0Var2 = new bn0();
        this.p0 = bn0Var2;
        return bn0Var2;
    }
}
