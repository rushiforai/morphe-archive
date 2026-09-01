package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lfe extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ do4 d;
    public /* synthetic */ Throwable e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lfe(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 3;
        do4 do4Var = (do4) obj;
        Throwable th = (Throwable) obj2;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                lfe lfeVar = new lfe(i2, 0, n92Var);
                lfeVar.d = do4Var;
                lfeVar.e = th;
                return lfeVar.invokeSuspend(c1eVar);
            default:
                lfe lfeVar2 = new lfe(i2, 1, n92Var);
                lfeVar2.d = do4Var;
                lfeVar2.e = th;
                return lfeVar2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                do4 do4Var = this.d;
                Throwable th = this.e;
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
                gfe gfeVar = new gfe(m4.I(th));
                this.d = null;
                this.e = null;
                this.c = 1;
                return do4Var.a(gfeVar, this) == tb2Var ? tb2Var : c1eVar;
            default:
                do4 do4Var2 = this.d;
                Throwable th2 = this.e;
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
                jge jgeVar = new jge(m4.I(th2));
                this.d = null;
                this.e = null;
                this.c = 1;
                return do4Var2.a(jgeVar, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
