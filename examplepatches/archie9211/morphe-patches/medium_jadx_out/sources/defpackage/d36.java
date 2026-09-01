package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class d36 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ e36 b;

    public /* synthetic */ d36(e36 e36Var, int i) {
        this.a = i;
        this.b = e36Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        e36 e36Var = this.b;
        ssd ssdVar = (ssd) obj;
        switch (i) {
            case 0:
                ssdVar.getClass();
                e36 e36Var2 = (e36) ssdVar;
                y3f y3fVar = e36Var.p;
                if (!g76.L(e36Var2.o, y3fVar)) {
                    e36Var2.o = y3fVar;
                    e36Var2.J0();
                }
                return rsd.SkipSubtreeAndContinueTraversal;
            default:
                ssdVar.getClass();
                e36Var.o = ((e36) ssdVar).p;
                return Boolean.FALSE;
        }
    }
}
