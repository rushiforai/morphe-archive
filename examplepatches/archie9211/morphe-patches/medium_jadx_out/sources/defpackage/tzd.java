package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tzd extends kb2 {
    public static final tzd c = new tzd();

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        faf fafVar = (faf) ib2Var.o0(faf.c);
        if (fafVar != null) {
            fafVar.b = true;
        } else {
            ik4.k("Dispatchers.Unconfined.dispatch function can only be used by the yield function. If you wrap Unconfined dispatcher in your code, make sure you properly delegate isDispatchNeeded and dispatch calls.");
        }
    }

    @Override // defpackage.kb2
    public final kb2 H0(int i) {
        throw new UnsupportedOperationException("limitedParallelism is not supported for Dispatchers.Unconfined");
    }

    @Override // defpackage.kb2
    public final String toString() {
        return "Dispatchers.Unconfined";
    }
}
