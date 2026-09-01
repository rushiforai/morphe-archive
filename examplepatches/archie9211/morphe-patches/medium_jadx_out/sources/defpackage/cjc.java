package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cjc extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ b55 e;
    public final /* synthetic */ l78 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cjc(b55 b55Var, l78 l78Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = b55Var;
        this.f = l78Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                cjc cjcVar = new cjc(this.e, this.f, n92Var, 0);
                cjcVar.d = obj;
                return cjcVar;
            case 1:
                cjc cjcVar2 = new cjc(this.e, this.f, n92Var, 1);
                cjcVar2.d = obj;
                return cjcVar2;
            default:
                cjc cjcVar3 = new cjc(this.e, this.f, n92Var, 2);
                cjcVar3.d = obj;
                return cjcVar3;
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
        return ((cjc) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.f;
        b55 b55Var = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    k2a k2aVar = new k2a(l78Var, ((sb2) this.d).Q());
                    this.c = 1;
                    return b55Var.invoke(k2aVar, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    k2a k2aVar2 = new k2a(l78Var, ((sb2) this.d).Q());
                    this.c = 1;
                    return b55Var.invoke(k2aVar2, this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    k2a k2aVar3 = new k2a(l78Var, ((sb2) this.d).Q());
                    this.c = 1;
                    return b55Var.invoke(k2aVar3, this) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i4 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
