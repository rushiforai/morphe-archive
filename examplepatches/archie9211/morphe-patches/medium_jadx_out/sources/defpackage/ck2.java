package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ck2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ek2 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ck2(ek2 ek2Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ek2Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ek2 ek2Var = this.d;
        switch (i) {
            case 0:
                return new ck2(ek2Var, n92Var, 0);
            default:
                return new ck2(ek2Var, n92Var, 1);
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
        return ((ck2) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        int i = this.b;
        ek2 ek2Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    uua uuaVar = ((ex1) ek2Var.a.a).c;
                    bk2 bk2Var = new bk2(ek2Var, 0);
                    this.c = 1;
                    if (uuaVar.a.b(bk2Var, this) == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                z72.b();
                return null;
            default:
                Object obj2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                Object obj3 = c1e.a;
                if (i3 == 0) {
                    br7.v(obj);
                    r6c r6cVar = ek2Var.b.a.d;
                    bk2 bk2Var2 = new bk2(ek2Var, 1);
                    this.c = 1;
                    Object objM = r6c.m(r6cVar, new yh(bk2Var2, 15), this);
                    if (objM != obj2) {
                        objM = obj3;
                    }
                    if (objM == obj2) {
                        return obj2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return obj3;
        }
    }
}
