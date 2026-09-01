package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uv4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ xv4 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uv4(xv4 xv4Var, String str, String str2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = xv4Var;
        this.e = str;
        this.f = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new uv4(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new uv4(this.d, this.e, this.f, n92Var, 1);
            default:
                return new uv4(this.d, this.e, this.f, n92Var, 2);
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
        return ((uv4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objH;
        Object objE0;
        Object objJ0;
        int i = this.b;
        c1e c1eVar = c1e.a;
        xv4 xv4Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = xv4Var.c;
                    String str = xv4Var.b;
                    String str2 = xv4Var.m;
                    this.c = 1;
                    objH = n0cVar.H(this, this.e, str, this.f, str2, false);
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
                r6c r6cVar = xv4Var.i;
                nv4 nv4Var = new nv4((x71) objH);
                this.c = 2;
                if (r6cVar.a(nv4Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = xv4Var.c;
                    this.c = 1;
                    objE0 = n0cVar2.e0(this.e, false, this);
                    if (objE0 != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objE0 = obj;
                r6c r6cVar2 = xv4Var.i;
                nv4 nv4Var2 = new nv4((g81) objE0);
                this.c = 2;
                if (r6cVar2.a(nv4Var2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    n0c n0cVar3 = xv4Var.c;
                    String str3 = xv4Var.b;
                    String str4 = xv4Var.m;
                    this.c = 1;
                    objJ0 = n0cVar3.j0(this, this.e, str3, this.f, str4, false);
                    if (objJ0 != tb2Var3) {
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
                objJ0 = obj;
                r6c r6cVar3 = xv4Var.i;
                nv4 nv4Var3 = new nv4((k81) objJ0);
                this.c = 2;
                if (r6cVar3.a(nv4Var3, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
        }
    }
}
