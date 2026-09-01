package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kk extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ sb2 c;
    public /* synthetic */ float d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kk(Object obj, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.e = obj;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.e;
        sb2 sb2Var = (sb2) obj;
        float fFloatValue = ((Number) obj2).floatValue();
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                kk kkVar = new kk((tl) obj4, n92Var, 0);
                kkVar.c = sb2Var;
                kkVar.d = fFloatValue;
                kkVar.invokeSuspend(c1eVar);
                break;
            default:
                kk kkVar2 = new kk((sl) obj4, n92Var, 1);
                kkVar2.c = sb2Var;
                kkVar2.d = fFloatValue;
                kkVar2.invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj2 = this.e;
        n92 n92Var = null;
        switch (i) {
            case 0:
                br7.v(obj);
                vx0.c0(this.c, null, null, new jk((tl) obj2, this.d, n92Var, 0), 3);
                break;
            default:
                br7.v(obj);
                vx0.c0(this.c, null, null, new jk((sl) obj2, this.d, n92Var, 1), 3);
                break;
        }
        return c1eVar;
    }
}
