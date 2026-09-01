package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jvc extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ kvc b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jvc(kvc kvcVar, int i) {
        super(2);
        this.a = i;
        this.b = kvcVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        kvc kvcVar = this.b;
        switch (i) {
            case 0:
                kvcVar.a().b = (l22) obj2;
                break;
            case 1:
                nq6 nq6VarA = kvcVar.a();
                ((aq6) obj).c0(new kq6(nq6VarA, (b55) obj2, nq6VarA.p));
                break;
            default:
                aq6 aq6Var = (aq6) obj;
                nvc nvcVar = kvcVar.a;
                nq6 nq6Var = aq6Var.H;
                if (nq6Var == null) {
                    nq6Var = new nq6(aq6Var, nvcVar);
                    aq6Var.H = nq6Var;
                }
                kvcVar.b = nq6Var;
                kvcVar.a().h();
                nq6 nq6VarA2 = kvcVar.a();
                if (nq6VarA2.c != nvcVar) {
                    nq6VarA2.c = nvcVar;
                    nq6VarA2.i(false);
                    aq6.V(nq6VarA2.a, false, 7);
                }
                break;
        }
        return c1eVar;
    }
}
