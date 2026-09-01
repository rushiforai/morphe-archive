package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sb implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ nhc b;

    public /* synthetic */ sb(nhc nhcVar, int i) {
        this.a = i;
        this.b = nhcVar;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                vb vbVar = (vb) obj;
                if (vbVar == null) {
                    ygf.a();
                    break;
                } else {
                    Object objC = nhc.c(this.b, "Error: ".concat(vbVar.a), null, bhc.Long, n92Var, 6);
                    if (objC != tb2.COROUTINE_SUSPENDED) {
                        break;
                    }
                }
                break;
            default:
                hc hcVar = (hc) obj;
                if (!(hcVar instanceof hc)) {
                    ygf.a();
                    break;
                } else {
                    Object objC2 = nhc.c(this.b, hcVar.a, null, hcVar.b, n92Var, 6);
                    if (objC2 != tb2.COROUTINE_SUSPENDED) {
                        break;
                    }
                }
                break;
        }
        return null;
    }
}
