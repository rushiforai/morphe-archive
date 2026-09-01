package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hl8 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nl8 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hl8(nl8 nl8Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nl8Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        nl8 nl8Var = this.d;
        switch (i) {
            case 0:
                return new hl8(nl8Var, n92Var, 0);
            case 1:
                return new hl8(nl8Var, n92Var, 1);
            default:
                return new hl8(nl8Var, n92Var, 2);
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
        return ((hl8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        nl8 nl8Var = this.d;
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
                zk8 zk8Var = (zk8) ei7.N(nl8Var.n.a.getValue(), nl8Var.o);
                this.c = 1;
                Object objD = zk8Var.b.D(this);
                if (objD != tb2Var) {
                    objD = c1eVar;
                }
                return objD == tb2Var ? tb2Var : c1eVar;
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
                zk8 zk8Var2 = (zk8) ei7.N(nl8Var.n.a.getValue(), nl8Var.o);
                this.c = 1;
                Object objC0 = zk8Var2.b.c0(this);
                if (objC0 != tb2Var2) {
                    objC0 = c1eVar;
                }
                return objC0 == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    Object obj2 = ((bjb) obj).a;
                    return c1eVar;
                }
                br7.v(obj);
                ji7 ji7Var = nl8Var.c;
                String str = nl8Var.b;
                String str2 = nl8Var.j;
                String str3 = nl8Var.h;
                this.c = 1;
                return ji7Var.a(str, str2, str3, this) == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
