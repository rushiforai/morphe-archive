package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dbf extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ kbf d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dbf(kbf kbfVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = kbfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        kbf kbfVar = this.d;
        switch (i) {
            case 0:
                return new dbf(kbfVar, n92Var, 0);
            case 1:
                return new dbf(kbfVar, n92Var, 1);
            default:
                return new dbf(kbfVar, n92Var, 2);
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
        return ((dbf) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        kbf kbfVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    int i3 = cbf.a[((paf) kbfVar.h.getValue()).ordinal()];
                    if (i3 == 1) {
                        ek2 ek2Var = (ek2) kbfVar.j.getValue();
                        this.c = 1;
                        Object objD = ek2Var.e.D(this);
                        if (objD != tb2Var) {
                            objD = c1eVar;
                        }
                        if (objD != tb2Var) {
                            return c1eVar;
                        }
                    } else if (i3 == 2) {
                        zj2 zj2Var = (zj2) kbfVar.l.getValue();
                        this.c = 2;
                        Object objD2 = zj2Var.c.D(this);
                        if (objD2 != tb2Var) {
                            objD2 = c1eVar;
                        }
                        if (objD2 != tb2Var) {
                            return c1eVar;
                        }
                    } else if (i3 == 3) {
                        zj2 zj2Var2 = (zj2) kbfVar.k.getValue();
                        this.c = 3;
                        Object objD3 = zj2Var2.c.D(this);
                        if (objD3 != tb2Var) {
                            objD3 = c1eVar;
                        }
                        if (objD3 != tb2Var) {
                            return c1eVar;
                        }
                    } else if (i3 == 4) {
                        gl2 gl2Var = (gl2) kbfVar.m.getValue();
                        this.c = 4;
                        Object objD4 = gl2Var.c.D(this);
                        if (objD4 != tb2Var) {
                            objD4 = c1eVar;
                        }
                        if (objD4 != tb2Var) {
                            return c1eVar;
                        }
                    } else {
                        ygf.a();
                    }
                    return tb2Var;
                }
                if (i2 == 1 || i2 == 2 || i2 == 3 || i2 == 4) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    int i5 = ebf.a[((paf) kbfVar.h.getValue()).ordinal()];
                    if (i5 == 1) {
                        ek2 ek2Var2 = (ek2) kbfVar.j.getValue();
                        this.c = 1;
                        if (ek2Var2.b(this) != tb2Var2) {
                            return c1eVar;
                        }
                    } else if (i5 == 2) {
                        zj2 zj2Var3 = (zj2) kbfVar.l.getValue();
                        this.c = 2;
                        if (zj2Var3.b(this) != tb2Var2) {
                            return c1eVar;
                        }
                    } else if (i5 == 3) {
                        zj2 zj2Var4 = (zj2) kbfVar.k.getValue();
                        this.c = 3;
                        if (zj2Var4.b(this) != tb2Var2) {
                            return c1eVar;
                        }
                    } else if (i5 == 4) {
                        gl2 gl2Var2 = (gl2) kbfVar.m.getValue();
                        this.c = 4;
                        Object objC0 = gl2Var2.c.c0(this);
                        if (objC0 != tb2Var2) {
                            objC0 = c1eVar;
                        }
                        if (objC0 != tb2Var2) {
                            return c1eVar;
                        }
                    } else {
                        ygf.a();
                    }
                    return tb2Var2;
                }
                if (i4 == 1 || i4 == 2 || i4 == 3 || i4 == 4) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    r6c r6cVar = kbfVar.f;
                    this.c = 1;
                    return r6cVar.a(naf.a, this) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i6 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
