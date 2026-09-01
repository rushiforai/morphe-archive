package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ij1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ mj1 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ij1(mj1 mj1Var, String str, String str2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = mj1Var;
        this.e = str;
        this.f = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new ij1(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new ij1(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new ij1(this.d, this.e, this.f, n92Var, 2);
            default:
                return new ij1(this.d, this.e, this.f, n92Var, 3);
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
        return ((ij1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objH;
        Object objE0;
        Object objJ0;
        int i = this.b;
        String str = this.e;
        c1e c1eVar = c1e.a;
        mj1 mj1Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = mj1Var.d;
                    String str2 = mj1Var.b;
                    String str3 = mj1Var.n;
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
                r6c r6cVar = mj1Var.h;
                bj1 bj1Var = new bj1((x71) objH);
                this.c = 2;
                if (r6cVar.a(bj1Var, this) != tb2Var) {
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
                mj1Var.d.getClass();
                s71 s71VarV = n0c.v(str, this.f, false);
                r6c r6cVar2 = mj1Var.h;
                bj1 bj1Var2 = new bj1(s71VarV);
                this.c = 1;
                return r6cVar2.a(bj1Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = mj1Var.d;
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
                r6c r6cVar3 = mj1Var.h;
                bj1 bj1Var3 = new bj1((g81) objE0);
                this.c = 2;
                if (r6cVar3.a(bj1Var3, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    n0c n0cVar3 = mj1Var.d;
                    String str4 = mj1Var.b;
                    String str5 = mj1Var.n;
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
                r6c r6cVar4 = mj1Var.h;
                bj1 bj1Var4 = new bj1((k81) objJ0);
                this.c = 2;
                if (r6cVar4.a(bj1Var4, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
        }
    }
}
