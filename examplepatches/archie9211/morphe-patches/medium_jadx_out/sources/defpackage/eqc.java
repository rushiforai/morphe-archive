package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class eqc implements dqc {
    public final x90 a = new x90(0);

    public final boolean c(int i) {
        return (this.a.get() & i) != 0;
    }

    public final void e(int i) {
        x90 x90Var;
        int i2;
        do {
            x90Var = this.a;
            i2 = x90Var.get();
            if ((i2 & i) != 0) {
                return;
            }
        } while (!x90Var.compareAndSet(i2, i2 | i));
    }

    @Override // defpackage.dqc
    public fqc f(fqc fqcVar, fqc fqcVar2, fqc fqcVar3) {
        return null;
    }
}
