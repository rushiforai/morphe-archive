package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rl implements sl3 {
    public final /* synthetic */ int a = 1;
    public final ql b;
    public final /* synthetic */ Object c;

    public rl(tl tlVar) {
        this.c = tlVar;
        this.b = new ql(0, tlVar);
    }

    @Override // defpackage.sl3
    public final Object a(s78 s78Var, ku2 ku2Var, dl3 dl3Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        Object obj = this.c;
        switch (i) {
            case 0:
                Object objA = ((tl) obj).a(s78Var, new tg(this, ku2Var, n92Var, 6), dl3Var);
                return objA == tb2.COROUTINE_SUSPENDED ? objA : c1eVar;
            default:
                Object objA2 = ((sl) obj).a(s78Var, new tg(this, ku2Var, n92Var, 7), dl3Var);
                return objA2 == tb2.COROUTINE_SUSPENDED ? objA2 : c1eVar;
        }
    }

    public rl(sl slVar) {
        this.c = slVar;
        this.b = new ql(1, slVar);
    }
}
