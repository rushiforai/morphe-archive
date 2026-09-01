package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fx0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ v7c d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fx0(v7c v7cVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = v7cVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        v7c v7cVar = this.d;
        switch (i) {
            case 0:
                return new fx0(v7cVar, n92Var, 0);
            case 1:
                return new fx0(v7cVar, n92Var, 1);
            case 2:
                return new fx0(v7cVar, n92Var, 2);
            case 3:
                return new fx0(v7cVar, n92Var, 3);
            case 4:
                return new fx0(v7cVar, n92Var, 4);
            case 5:
                return new fx0(v7cVar, n92Var, 5);
            case 6:
                return new fx0(v7cVar, n92Var, 6);
            case 7:
                return new fx0(v7cVar, n92Var, 7);
            case 8:
                return new fx0(v7cVar, n92Var, 8);
            case 9:
                return new fx0(v7cVar, n92Var, 9);
            case 10:
                return new fx0(v7cVar, n92Var, 10);
            case 11:
                return new fx0(v7cVar, n92Var, 11);
            case 12:
                return new fx0(v7cVar, n92Var, 12);
            case 13:
                return new fx0(v7cVar, n92Var, 13);
            case 14:
                return new fx0(v7cVar, n92Var, 14);
            default:
                return new fx0(v7cVar, n92Var, 15);
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
        return ((fx0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        v7c v7cVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1 || i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (v7cVar.c) {
                    this.c = 2;
                    if (v7cVar.f(this) != tb2Var) {
                        return c1eVar;
                    }
                } else {
                    this.c = 1;
                    if (v7cVar.d(this) != tb2Var) {
                        return c1eVar;
                    }
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.b(this) == tb2Var2 ? tb2Var2 : c1eVar;
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
                    return v7cVar.g(this) == tb2Var3 ? tb2Var3 : c1eVar;
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
                    return v7cVar.b(this) == tb2Var4 ? tb2Var4 : c1eVar;
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
                if (i6 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.f(this) == tb2Var5 ? tb2Var5 : c1eVar;
                }
                if (i6 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.d(this) == tb2Var6 ? tb2Var6 : c1eVar;
                }
                if (i7 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 6:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.d(this) == tb2Var7 ? tb2Var7 : c1eVar;
                }
                if (i8 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 7:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.b(this) == tb2Var8 ? tb2Var8 : c1eVar;
                }
                if (i9 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.f(this) == tb2Var9 ? tb2Var9 : c1eVar;
                }
                if (i10 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 9:
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.d(this) == tb2Var10 ? tb2Var10 : c1eVar;
                }
                if (i11 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 10:
                tb2 tb2Var11 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                if (i12 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.g(this) == tb2Var11 ? tb2Var11 : c1eVar;
                }
                if (i12 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 11:
                tb2 tb2Var12 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.d(this) == tb2Var12 ? tb2Var12 : c1eVar;
                }
                if (i13 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 12:
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i14 = this.c;
                if (i14 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.b(this) == tb2Var13 ? tb2Var13 : c1eVar;
                }
                if (i14 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 13:
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i15 = this.c;
                if (i15 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.g(this) == tb2Var14 ? tb2Var14 : c1eVar;
                }
                if (i15 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 14:
                tb2 tb2Var15 = tb2.COROUTINE_SUSPENDED;
                int i16 = this.c;
                if (i16 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.b(this) == tb2Var15 ? tb2Var15 : c1eVar;
                }
                if (i16 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var16 = tb2.COROUTINE_SUSPENDED;
                int i17 = this.c;
                if (i17 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return v7cVar.f(this) == tb2Var16 ? tb2Var16 : c1eVar;
                }
                if (i17 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
