package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pm1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ ou d;
    public final /* synthetic */ ou e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ pm1(ou ouVar, ou ouVar2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ouVar;
        this.e = ouVar2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                pm1 pm1Var = new pm1(this.d, this.e, n92Var, 0);
                pm1Var.c = obj;
                return pm1Var;
            case 1:
                pm1 pm1Var2 = new pm1(this.d, this.e, n92Var, 1);
                pm1Var2.c = obj;
                return pm1Var2;
            default:
                pm1 pm1Var3 = new pm1(this.d, this.e, n92Var, 2);
                pm1Var3.c = obj;
                return pm1Var3;
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
                ((pm1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((pm1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((pm1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ou ouVar = this.e;
        ou ouVar2 = this.d;
        n92 n92Var = null;
        sb2 sb2Var = (sb2) this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                vx0.c0(sb2Var, null, null, new nm1(ouVar2, ouVar, n92Var, 1), 3);
                break;
            case 1:
                br7.v(obj);
                vx0.c0(sb2Var, null, null, new mm1(ouVar2, n92Var, 6), 3);
                vx0.c0(sb2Var, null, null, new mm1(ouVar, n92Var, 7), 3);
                break;
            default:
                br7.v(obj);
                vx0.c0(sb2Var, null, null, new mm1(ouVar2, n92Var, 8), 3);
                vx0.c0(sb2Var, null, null, new mm1(ouVar, n92Var, 9), 3);
                break;
        }
        return c1eVar;
    }
}
