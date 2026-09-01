package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gp1 implements AutoCloseable, sb2 {
    public final ib2 a;

    public gp1(ib2 ib2Var) {
        ib2Var.getClass();
        this.a = ib2Var;
    }

    @Override // defpackage.sb2
    public final ib2 Q() {
        return this.a;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        bo.D(this.a, null);
    }
}
