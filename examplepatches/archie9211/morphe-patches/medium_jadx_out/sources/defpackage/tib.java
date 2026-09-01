package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class tib extends kn0 {
    public tib(n92 n92Var) {
        super(n92Var);
        if (n92Var == null || n92Var.getContext() == zx3.a) {
            return;
        }
        ay0.e("Coroutines with restricted suspension must have EmptyCoroutineContext");
        throw null;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return zx3.a;
    }
}
