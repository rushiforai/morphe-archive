package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g92 {
    public final ejc a = new ejc();

    public static void b(g92 g92Var, b55 b55Var, mz1 mz1Var, m45 m45Var, int i) {
        if ((i & 8) != 0) {
            mz1Var = null;
        }
        g92Var.a.add(new mz1(new gaf(b55Var, g92Var, mz1Var, m45Var, 1), true, -1789283891));
    }

    public final void a(f92 f92Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-798501095);
        int i2 = 4;
        int i3 = (p65Var.f(f92Var) ? 4 : 2) | i | (p65Var.f(this) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            ejc ejcVar = this.a;
            int size = ejcVar.size();
            for (int i4 = 0; i4 < size; i4++) {
                ((c55) ejcVar.get(i4)).f(f92Var, p65Var, Integer.valueOf(i3 & 14));
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(this, f92Var, i, i2);
        }
    }
}
