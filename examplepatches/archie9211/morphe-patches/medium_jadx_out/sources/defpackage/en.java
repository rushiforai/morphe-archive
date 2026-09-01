package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class en extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rya b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ en(rya ryaVar, int i) {
        super(1);
        this.a = i;
        this.b = ryaVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        boolean z;
        int i = this.a;
        rya ryaVar = this.b;
        switch (i) {
            case 0:
                ryaVar.a = (es4) obj;
                return Boolean.TRUE;
            case 1:
                rr5 rr5Var = (rr5) obj;
                Object obj2 = ryaVar.a;
                if (obj2 == null && rr5Var.q) {
                    ryaVar.a = rr5Var;
                } else if (obj2 != null) {
                    rr5Var.getClass();
                }
                return Boolean.TRUE;
            default:
                a43 a43Var = (ssd) obj;
                if (((q28) a43Var).a.n) {
                    ryaVar.a = a43Var;
                    z = false;
                } else {
                    z = true;
                }
                return Boolean.valueOf(z);
        }
    }
}
