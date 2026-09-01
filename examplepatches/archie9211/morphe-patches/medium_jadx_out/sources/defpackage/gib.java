package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gib extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nib d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gib(nib nibVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nibVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        nib nibVar = this.d;
        switch (i) {
            case 0:
                return new gib(nibVar, n92Var, 0);
            case 1:
                return new gib(nibVar, n92Var, 1);
            case 2:
                return new gib(nibVar, n92Var, 2);
            case 3:
                return new gib(nibVar, n92Var, 3);
            case 4:
                return new gib(nibVar, n92Var, 4);
            default:
                return new gib(nibVar, n92Var, 5);
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
        return ((gib) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        nib nibVar = this.d;
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
                b0f b0fVar = nibVar.I;
                this.c = 1;
                Object objA = b0fVar.a.a(fze.a, this);
                if (objA != tb2Var) {
                    objA = c1eVar;
                }
                return objA == tb2Var ? tb2Var : c1eVar;
            case 1:
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
                xpc xpcVar = nibVar.P;
                this.c = 1;
                xpcVar.a(null, this);
                return c1eVar == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    xpc xpcVar2 = nibVar.P;
                    this.c = 1;
                    xpcVar2.a(null, this);
                    if (c1eVar != tb2Var3) {
                    }
                    return tb2Var3;
                }
                if (i4 != 1) {
                    if (i4 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                this.c = 2;
                if (nibVar.g(true, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    xpc xpcVar3 = nibVar.P;
                    this.c = 1;
                    xpcVar3.a(null, this);
                    if (c1eVar != tb2Var4) {
                    }
                    return tb2Var4;
                }
                if (i5 != 1) {
                    if (i5 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                this.c = 2;
                if (nibVar.h(true, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    b0f b0fVar2 = nibVar.I;
                    this.c = 1;
                    return b0fVar2.j(this) == tb2Var5 ? tb2Var5 : c1eVar;
                }
                if (i6 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar = nibVar.u.a.b;
                aq aqVar = new aq(27, nibVar);
                this.c = 1;
                return r6c.m(r6cVar, aqVar, this) == tb2Var6 ? tb2Var6 : c1eVar;
        }
    }
}
