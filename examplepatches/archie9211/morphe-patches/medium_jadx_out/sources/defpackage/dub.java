package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dub extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ j78 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dub(j78 j78Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = j78Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new dub(this.d, n92Var, 0);
            case 1:
                return new dub(this.d, n92Var, 1);
            case 2:
                return new dub(this.d, n92Var, 2);
            case 3:
                return new dub(this.d, n92Var, 3);
            default:
                return new dub(this.d, n92Var, 4);
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
        return ((dub) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        j78 j78Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return j78Var.a(bx9.a, this) == tb2Var ? tb2Var : c1eVar;
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
                if (i3 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return j78Var.a(boe.a, this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return j78Var.a(fu1.a, this) == tb2Var3 ? tb2Var3 : c1eVar;
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
                    this.c = 1;
                    return j78Var.a(red.a, this) == tb2Var4 ? tb2Var4 : c1eVar;
                }
                if (i5 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return j78Var.a(ri1.a, this) == tb2Var5 ? tb2Var5 : c1eVar;
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
