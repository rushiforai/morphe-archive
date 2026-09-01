package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m68 implements d56 {
    public final r6c a = k40.x(16, 1, nz0.DROP_OLDEST);

    @Override // defpackage.d56
    public final bo4 a() {
        return this.a;
    }

    public final Object b(c56 c56Var, n92 n92Var) {
        Object objA = this.a.a(c56Var, n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public final void c(c56 c56Var) {
        this.a.h(c56Var);
    }
}
