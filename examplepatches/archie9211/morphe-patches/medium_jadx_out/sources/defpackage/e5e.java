package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e5e extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ h5e d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e5e(h5e h5eVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = h5eVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new e5e(this.d, n92Var, 0);
            case 1:
                return new e5e(this.d, n92Var, 1);
            case 2:
                return new e5e(this.d, n92Var, 2);
            case 3:
                return new e5e(this.d, n92Var, 3);
            case 4:
                return new e5e(this.d, n92Var, 4);
            case 5:
                return new e5e(this.d, n92Var, 5);
            default:
                return new e5e(this.d, n92Var, 6);
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
        return ((e5e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        boolean z;
        int i = this.b;
        t4e t4eVar = t4e.a;
        c1e c1eVar = c1e.a;
        h5e h5eVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    r6c r6cVar = h5eVar.q;
                    this.c = 1;
                    return r6cVar.a(t4eVar, this) == tb2Var ? tb2Var : c1eVar;
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
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xpc xpcVar = h5eVar.o;
                this.c = 1;
                xpcVar.a(null, this);
                return c1eVar == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return h5eVar.e(this) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i4 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    r6c r6cVar2 = h5eVar.q;
                    this.c = 1;
                    return r6cVar2.a(t4eVar, this) == tb2Var4 ? tb2Var4 : c1eVar;
                }
                if (i5 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1 || i6 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (h5eVar.l || !(z = h5eVar.i)) {
                    this.c = 2;
                    if (h5eVar.e(this) != tb2Var5) {
                        return c1eVar;
                    }
                } else {
                    xpc xpcVar2 = h5eVar.o;
                    w4e w4eVar = new w4e(h5eVar.g, h5eVar.h, z);
                    this.c = 1;
                    xpcVar2.a(w4eVar, this);
                    if (c1eVar != tb2Var5) {
                        return c1eVar;
                    }
                }
                return tb2Var5;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    r6c r6cVar3 = h5eVar.q;
                    this.c = 1;
                    return r6cVar3.a(t4eVar, this) == tb2Var6 ? tb2Var6 : c1eVar;
                }
                if (i7 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    r6c r6cVar4 = h5eVar.q;
                    this.c = 1;
                    return r6cVar4.a(u4e.a, this) == tb2Var7 ? tb2Var7 : c1eVar;
                }
                if (i8 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
