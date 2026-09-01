package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nk extends p4d implements d55 {
    public int b;
    public /* synthetic */ pl c;
    public /* synthetic */ ry2 d;
    public /* synthetic */ Object e;
    public final /* synthetic */ ul f;
    public final /* synthetic */ ww g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nk(ul ulVar, ww wwVar, n92 n92Var) {
        super(4, n92Var);
        this.f = ulVar;
        this.g = wwVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            pl plVar = this.c;
            ry2 ry2Var = this.d;
            Object obj2 = this.e;
            ul ulVar = this.f;
            float fG = ulVar.g.g();
            this.c = null;
            this.d = null;
            this.b = 1;
            if (vx0.D(ulVar, fG, plVar, ry2Var, obj2, this.g, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        nk nkVar = new nk(this.f, this.g, (n92) obj4);
        nkVar.c = (pl) obj;
        nkVar.d = (ry2) obj2;
        nkVar.e = obj3;
        return nkVar.invokeSuspend(c1e.a);
    }
}
