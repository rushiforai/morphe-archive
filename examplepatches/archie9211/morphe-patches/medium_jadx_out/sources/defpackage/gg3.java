package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gg3 implements AutoCloseable {
    public final dg3 a;
    public boolean b;
    public final /* synthetic */ mg3 c;

    public gg3(mg3 mg3Var, dg3 dg3Var) {
        this.c = mg3Var;
        this.a = dg3Var;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        if (this.b) {
            return;
        }
        this.b = true;
        mg3 mg3Var = this.c;
        synchronized (mg3Var.h) {
            dg3 dg3Var = this.a;
            int i = dg3Var.h - 1;
            dg3Var.h = i;
            if (i == 0 && dg3Var.f) {
                mg3Var.Q(dg3Var);
            }
        }
    }
}
