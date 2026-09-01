package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class su6 implements ht6 {
    public final kv6 a;

    public su6(kv6 kv6Var) {
        this.a = kv6Var;
    }

    @Override // defpackage.ht6
    public final int a() {
        return this.a.j().n;
    }

    @Override // defpackage.ht6
    public final int b() {
        return Math.min(a() - 1, ((dv6) bu1.H0(this.a.j().k)).a);
    }

    @Override // defpackage.ht6
    public final int c() {
        int i;
        kv6 kv6Var = this.a;
        if (kv6Var.j().k.isEmpty()) {
            return 0;
        }
        cv6 cv6VarJ = kv6Var.j();
        int iG = (int) (cv6VarJ.o == hw8.Vertical ? cv6VarJ.g() & 4294967295L : cv6VarJ.g() >> 32);
        int iI0 = g76.i0(kv6Var.j());
        if (iI0 != 0 && (i = iG / iI0) >= 1) {
            return i;
        }
        return 1;
    }

    @Override // defpackage.ht6
    public final boolean d() {
        return !this.a.j().k.isEmpty();
    }

    @Override // defpackage.ht6
    public final int e() {
        return Math.max(0, this.a.h());
    }
}
