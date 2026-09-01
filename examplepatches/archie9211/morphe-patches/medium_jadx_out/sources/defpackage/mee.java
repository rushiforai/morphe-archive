package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mee extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ nee c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mee(nee neeVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = neeVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        nee neeVar = this.c;
        switch (i) {
            case 0:
                return new mee(neeVar, n92Var, 0);
            default:
                return new mee(neeVar, n92Var, 1);
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
                ((mee) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((mee) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        nee neeVar = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                mfe mfeVar = neeVar.a;
                if (!mfeVar.e) {
                    mfeVar.e = true;
                    mfeVar.d.j(mfeVar.b, gp7.u(mfeVar.g), mfeVar.f);
                }
                break;
            default:
                br7.v(obj);
                mfe mfeVar2 = neeVar.a;
                if (!mfeVar2.e) {
                    mfeVar2.e = true;
                    mfeVar2.d.j(mfeVar2.b, gp7.u(mfeVar2.g), mfeVar2.f);
                }
                break;
        }
        return c1eVar;
    }
}
