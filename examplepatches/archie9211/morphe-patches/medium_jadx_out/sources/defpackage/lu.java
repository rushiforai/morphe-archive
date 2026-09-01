package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lu extends p4d implements x45 {
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lu(Object obj, n92 n92Var, int i) {
        super(1, n92Var);
        this.b = i;
        this.c = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        int i = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                return new lu((ou) obj, n92Var, 0);
            default:
                return new lu((String) obj, n92Var, 1);
        }
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = (n92) obj;
        switch (i) {
            case 0:
                ((lu) create(n92Var)).invokeSuspend(c1eVar);
                return c1eVar;
            default:
                lu luVar = (lu) create(n92Var);
                br7.v(c1eVar);
                return (String) luVar.c;
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                ((ou) obj2).c();
                return c1e.a;
            default:
                br7.v(obj);
                return (String) obj2;
        }
    }
}
