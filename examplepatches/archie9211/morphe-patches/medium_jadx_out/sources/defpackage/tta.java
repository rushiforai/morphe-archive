package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tta extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ vta c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ tta(vta vtaVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = vtaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new tta(this.c, n92Var, 0);
            default:
                return new tta(this.c, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((tta) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((tta) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        vta vtaVar = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                vtaVar.b();
                break;
            default:
                br7.v(obj);
                vtaVar.b();
                break;
        }
        return c1eVar;
    }
}
