package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ys3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ ht3 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ys3(ht3 ht3Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = ht3Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ht3 ht3Var = this.c;
        switch (i) {
            case 0:
                return new ys3(ht3Var, n92Var, 0);
            default:
                return new ys3(ht3Var, n92Var, 1);
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
                ((ys3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((ys3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ht3 ht3Var = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                xpc xpcVar = ht3Var.A;
                xpcVar.getClass();
                xpcVar.m(null, xr3.a);
                break;
            default:
                br7.v(obj);
                xpc xpcVar2 = ht3Var.A;
                xpcVar2.getClass();
                xpcVar2.m(null, zr3.a);
                break;
        }
        return c1eVar;
    }
}
