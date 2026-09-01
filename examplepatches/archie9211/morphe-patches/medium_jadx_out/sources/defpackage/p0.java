package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ r0 d;
    public final /* synthetic */ h0a e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p0(r0 r0Var, h0a h0aVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = r0Var;
        this.e = h0aVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        h0a h0aVar = this.e;
        r0 r0Var = this.d;
        switch (i) {
            case 0:
                return new p0(r0Var, h0aVar, n92Var, 0);
            case 1:
                return new p0(r0Var, h0aVar, n92Var, 1);
            case 2:
                return new p0(r0Var, h0aVar, n92Var, 2);
            default:
                return new p0(r0Var, h0aVar, n92Var, 3);
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
        return ((p0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        h0a h0aVar = this.e;
        r0 r0Var = this.d;
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
                m68 m68Var = r0Var.q;
                if (m68Var == null) {
                    return c1eVar;
                }
                g0a g0aVar = new g0a(h0aVar);
                this.c = 1;
                return m68Var.b(g0aVar, this) == tb2Var ? tb2Var : c1eVar;
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
                m68 m68Var2 = r0Var.q;
                if (m68Var2 == null) {
                    return c1eVar;
                }
                g0a g0aVar2 = new g0a(h0aVar);
                this.c = 1;
                return m68Var2.b(g0aVar2, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
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
                m68 m68Var3 = r0Var.q;
                if (m68Var3 == null) {
                    return c1eVar;
                }
                this.c = 1;
                return m68Var3.b(h0aVar, this) == tb2Var3 ? tb2Var3 : c1eVar;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                m68 m68Var4 = r0Var.q;
                if (m68Var4 == null) {
                    return c1eVar;
                }
                i0a i0aVar = new i0a(h0aVar);
                this.c = 1;
                return m68Var4.b(i0aVar, this) == tb2Var4 ? tb2Var4 : c1eVar;
        }
    }
}
