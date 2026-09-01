package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gva {
    public final g59 a;
    public final ch4 b;
    public final mg3 c;

    public gva(long j, ch4 ch4Var, g59 g59Var) {
        this.a = g59Var;
        this.b = ch4Var;
        this.c = new mg3(j, ch4Var, g59Var);
    }

    public final void a() {
        mg3 mg3Var = this.c;
        synchronized (mg3Var.h) {
            try {
                mg3Var.B();
                for (dg3 dg3Var : (dg3[]) mg3Var.f.values().toArray(new dg3[0])) {
                    mg3Var.Q(dg3Var);
                }
                mg3Var.o = false;
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
