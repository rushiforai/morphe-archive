package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fva implements AutoCloseable {
    public final gg3 a;

    public fva(gg3 gg3Var) {
        this.a = gg3Var;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        this.a.close();
    }
}
