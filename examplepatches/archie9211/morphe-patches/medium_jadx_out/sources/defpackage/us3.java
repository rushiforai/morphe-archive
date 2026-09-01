package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class us3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ht3 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ us3(int i, n92 n92Var, ht3 ht3Var, String str, String str2) {
        super(2, n92Var);
        this.b = i;
        this.d = ht3Var;
        this.e = str;
        this.f = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new us3(0, n92Var, this.d, this.e, this.f);
            case 1:
                return new us3(1, n92Var, this.d, this.e, this.f);
            case 2:
                return new us3(2, n92Var, this.d, this.e, this.f);
            default:
                return new us3(3, n92Var, this.d, this.e, this.f);
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
        return ((us3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objH;
        Object objE0;
        Object objJ0;
        int i = this.b;
        String str = this.e;
        c1e c1eVar = c1e.a;
        ht3 ht3Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = ht3Var.l;
                    String str2 = ht3Var.b;
                    String str3 = ht3Var.u;
                    this.c = 1;
                    objH = n0cVar.H(this, this.e, str2, this.f, str3, false);
                    if (objH != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objH = obj;
                r6c r6cVar = ht3Var.q;
                bs3 bs3Var = new bs3((x71) objH);
                this.c = 2;
                if (r6cVar.a(bs3Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
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
                ht3Var.l.getClass();
                s71 s71VarV = n0c.v(str, this.f, false);
                r6c r6cVar2 = ht3Var.q;
                bs3 bs3Var2 = new bs3(s71VarV);
                this.c = 1;
                return r6cVar2.a(bs3Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = ht3Var.l;
                    this.c = 1;
                    objE0 = n0cVar2.e0(str, false, this);
                    if (objE0 != tb2Var3) {
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
                objE0 = obj;
                r6c r6cVar3 = ht3Var.q;
                bs3 bs3Var3 = new bs3((g81) objE0);
                this.c = 2;
                if (r6cVar3.a(bs3Var3, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    n0c n0cVar3 = ht3Var.l;
                    String str4 = ht3Var.b;
                    String str5 = ht3Var.u;
                    this.c = 1;
                    objJ0 = n0cVar3.j0(this, this.e, str4, this.f, str5, false);
                    if (objJ0 != tb2Var4) {
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
                objJ0 = obj;
                r6c r6cVar4 = ht3Var.q;
                bs3 bs3Var4 = new bs3((k81) objJ0);
                this.c = 2;
                if (r6cVar4.a(bs3Var4, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
        }
    }
}
