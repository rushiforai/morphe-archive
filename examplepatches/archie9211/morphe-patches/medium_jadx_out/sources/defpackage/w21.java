package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w21 extends v05 {
    public final /* synthetic */ x21 b;
    public final /* synthetic */ ms c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w21(x21 x21Var, ms msVar, bfc bfcVar) {
        super(bfcVar);
        this.b = x21Var;
        this.c = msVar;
    }

    @Override // defpackage.v05, defpackage.bfc, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        x21 x21Var = this.b;
        ms msVar = this.c;
        synchronized (x21Var) {
            if (msVar.a) {
                return;
            }
            msVar.a = true;
            super.close();
            ((zf3) this.c.b).c();
        }
    }
}
