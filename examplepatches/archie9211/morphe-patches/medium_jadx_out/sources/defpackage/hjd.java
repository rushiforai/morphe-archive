package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class hjd implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ wjd b;

    public /* synthetic */ hjd(wjd wjdVar, int i) {
        this.a = i;
        this.b = wjdVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        wjd wjdVar = this.b;
        lx lxVar = (lx) obj;
        switch (i) {
            case 0:
                ix ixVar = (ix) lxVar.a;
                if (ixVar instanceof c07) {
                    c07 c07Var = (c07) ixVar;
                    if (c07Var.b == null) {
                        return lx.a(lxVar, new c07(c07Var.a, wjdVar), 0, 14);
                    }
                }
                if (!(ixVar instanceof b07)) {
                    return lxVar;
                }
                b07 b07Var = (b07) ixVar;
                return b07Var.b == null ? lx.a(lxVar, new b07(b07Var.a, wjdVar, b07Var.c), 0, 14) : lxVar;
            default:
                ix ixVar2 = (ix) lxVar.a;
                if (ixVar2 instanceof c07) {
                    c07 c07Var2 = (c07) ixVar2;
                    if (c07Var2.b == null) {
                        return lx.a(lxVar, new c07(c07Var2.a, wjdVar), 0, 14);
                    }
                }
                if (!(ixVar2 instanceof b07)) {
                    return lxVar;
                }
                b07 b07Var2 = (b07) ixVar2;
                return b07Var2.b == null ? lx.a(lxVar, new b07(b07Var2.a, wjdVar, b07Var2.c), 0, 14) : lxVar;
        }
    }
}
