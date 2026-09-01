package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r13 extends v44 {
    public static final r13 d;
    public rb2 c;

    static {
        int i = dgd.c;
        int i2 = dgd.d;
        long j = dgd.e;
        String str = dgd.a;
        r13 r13Var = new r13();
        r13Var.c = new rb2(i, i2, j, str);
        d = r13Var;
    }

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        rb2.p(this.c, runnable, 6);
    }

    @Override // defpackage.kb2
    public final void F0(ib2 ib2Var, Runnable runnable) {
        rb2.p(this.c, runnable, 2);
    }

    @Override // defpackage.kb2
    public final kb2 H0(int i) {
        wgf.f(i);
        return i >= dgd.c ? this : super.H0(i);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        throw new UnsupportedOperationException("Dispatchers.Default cannot be closed");
    }

    @Override // defpackage.kb2
    public final String toString() {
        return "Dispatchers.Default";
    }
}
