package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sy2 implements sl3 {
    public final ws a;
    public final ql b = new ql(2, this);
    public final z78 c = new z78();

    public sy2(ws wsVar) {
        this.a = wsVar;
    }

    @Override // defpackage.sl3
    public final Object a(s78 s78Var, ku2 ku2Var, dl3 dl3Var) {
        Object objS = o7f.s(new ku2(this, s78Var, ku2Var, null, 1), dl3Var);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }
}
