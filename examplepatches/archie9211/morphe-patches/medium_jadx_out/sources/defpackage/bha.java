package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bha extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ fha d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bha(fha fhaVar, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = fhaVar;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.e;
        fha fhaVar = this.d;
        switch (i) {
            case 0:
                return new bha(fhaVar, str, n92Var, 0);
            default:
                return new bha(fhaVar, str, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((bha) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        String str = this.e;
        fha fhaVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar = fhaVar.t;
                bfa bfaVar = new bfa(str);
                this.c = 1;
                return r6cVar.a(bfaVar, this) == tb2Var ? tb2Var : c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = fhaVar.t;
                cfa cfaVar = new cfa(str);
                this.c = 1;
                return r6cVar2.a(cfaVar, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
