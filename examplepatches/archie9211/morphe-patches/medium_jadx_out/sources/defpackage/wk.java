package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wk extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ m45 e;
    public final /* synthetic */ b55 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wk(m45 m45Var, b55 b55Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = m45Var;
        this.f = b55Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                wk wkVar = new wk(this.e, this.f, n92Var, 0);
                wkVar.d = obj;
                return wkVar;
            case 1:
                wk wkVar2 = new wk(this.e, this.f, n92Var, 1);
                wkVar2.d = obj;
                return wkVar2;
            default:
                wk wkVar3 = new wk(this.e, this.f, n92Var, 2);
                wkVar3.d = obj;
                return wkVar3;
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
        return ((wk) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        b55 b55Var = this.f;
        m45 m45Var = this.e;
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
                sb2 sb2Var = (sb2) this.d;
                rya ryaVar = new rya();
                u50 u50VarE = no7.E(m45Var);
                vk vkVar = new vk(ryaVar, sb2Var, b55Var, 0);
                this.c = 1;
                return u50VarE.b(vkVar, this) == tb2Var ? tb2Var : c1eVar;
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
                sb2 sb2Var2 = (sb2) this.d;
                rya ryaVar2 = new rya();
                u50 u50VarE2 = no7.E(m45Var);
                vk vkVar2 = new vk(ryaVar2, sb2Var2, b55Var, 1);
                this.c = 1;
                return u50VarE2.b(vkVar2, this) == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                sb2 sb2Var3 = (sb2) this.d;
                rya ryaVar3 = new rya();
                u50 u50VarE3 = no7.E(m45Var);
                vk vkVar3 = new vk(ryaVar3, sb2Var3, b55Var, 2);
                this.c = 1;
                return u50VarE3.b(vkVar3, this) == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
