package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vg8 implements fx8 {
    public static final vg8 a = new vg8();

    @Override // defpackage.fx8
    public final Object a(long j, b55 b55Var, n92 n92Var) {
        Object objInvoke = b55Var.invoke(new qre(j), n92Var);
        return objInvoke == tb2.COROUTINE_SUSPENDED ? objInvoke : c1e.a;
    }

    @Override // defpackage.fx8
    public final long b(long j, int i, x45 x45Var) {
        return ((ip8) x45Var.invoke(new ip8(j))).a;
    }

    @Override // defpackage.fx8
    public final a43 c() {
        return new ug8(0);
    }

    @Override // defpackage.fx8
    public final boolean d() {
        return false;
    }
}
