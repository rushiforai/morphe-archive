package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wi1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ bo4 d;
    public final /* synthetic */ kv6 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wi1(bo4 bo4Var, kv6 kv6Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = bo4Var;
        this.e = kv6Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        kv6 kv6Var = this.e;
        bo4 bo4Var = this.d;
        switch (i) {
            case 0:
                return new wi1(bo4Var, kv6Var, n92Var, 0);
            case 1:
                return new wi1(bo4Var, kv6Var, n92Var, 1);
            case 2:
                return new wi1(bo4Var, kv6Var, n92Var, 2);
            case 3:
                return new wi1(bo4Var, kv6Var, n92Var, 3);
            case 4:
                return new wi1(bo4Var, kv6Var, n92Var, 4);
            case 5:
                return new wi1(bo4Var, kv6Var, n92Var, 5);
            case 6:
                return new wi1(bo4Var, kv6Var, n92Var, 6);
            case 7:
                return new wi1(bo4Var, kv6Var, n92Var, 7);
            case 8:
                return new wi1(bo4Var, kv6Var, n92Var, 8);
            case 9:
                return new wi1(bo4Var, kv6Var, n92Var, 9);
            case 10:
                return new wi1(bo4Var, kv6Var, n92Var, 10);
            case 11:
                return new wi1(bo4Var, kv6Var, n92Var, 11);
            case 12:
                return new wi1(bo4Var, kv6Var, n92Var, 12);
            default:
                return new wi1(bo4Var, kv6Var, n92Var, 13);
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
        return ((wi1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        kv6 kv6Var = this.e;
        bo4 bo4Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    vi1 vi1Var = new vi1(kv6Var, 0);
                    this.c = 1;
                    return bo4Var.b(vi1Var, this) == tb2Var ? tb2Var : c1eVar;
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
                    vi1 vi1Var2 = new vi1(kv6Var, 1);
                    this.c = 1;
                    return bo4Var.b(vi1Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
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
                    vi1 vi1Var3 = new vi1(kv6Var, 2);
                    this.c = 1;
                    return bo4Var.b(vi1Var3, this) == tb2Var3 ? tb2Var3 : c1eVar;
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
                    vi1 vi1Var4 = new vi1(kv6Var, 3);
                    this.c = 1;
                    return bo4Var.b(vi1Var4, this) == tb2Var4 ? tb2Var4 : c1eVar;
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
                    vi1 vi1Var5 = new vi1(kv6Var, 4);
                    this.c = 1;
                    return bo4Var.b(vi1Var5, this) == tb2Var5 ? tb2Var5 : c1eVar;
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
                    vi1 vi1Var6 = new vi1(kv6Var, 5);
                    this.c = 1;
                    return bo4Var.b(vi1Var6, this) == tb2Var6 ? tb2Var6 : c1eVar;
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
                    vi1 vi1Var7 = new vi1(kv6Var, 6);
                    this.c = 1;
                    return bo4Var.b(vi1Var7, this) == tb2Var7 ? tb2Var7 : c1eVar;
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
                    vi1 vi1Var8 = new vi1(kv6Var, 7);
                    this.c = 1;
                    return bo4Var.b(vi1Var8, this) == tb2Var8 ? tb2Var8 : c1eVar;
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
                    vi1 vi1Var9 = new vi1(kv6Var, 8);
                    this.c = 1;
                    return bo4Var.b(vi1Var9, this) == tb2Var9 ? tb2Var9 : c1eVar;
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
                    vi1 vi1Var10 = new vi1(kv6Var, 9);
                    this.c = 1;
                    return bo4Var.b(vi1Var10, this) == tb2Var10 ? tb2Var10 : c1eVar;
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
                    vi1 vi1Var11 = new vi1(kv6Var, 10);
                    this.c = 1;
                    return bo4Var.b(vi1Var11, this) == tb2Var11 ? tb2Var11 : c1eVar;
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
                    vi1 vi1Var12 = new vi1(kv6Var, 11);
                    this.c = 1;
                    return bo4Var.b(vi1Var12, this) == tb2Var12 ? tb2Var12 : c1eVar;
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
                    vi1 vi1Var13 = new vi1(kv6Var, 12);
                    this.c = 1;
                    return bo4Var.b(vi1Var13, this) == tb2Var13 ? tb2Var13 : c1eVar;
                }
                if (i14 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i15 = this.c;
                if (i15 == 0) {
                    br7.v(obj);
                    vi1 vi1Var14 = new vi1(kv6Var, 13);
                    this.c = 1;
                    return bo4Var.b(vi1Var14, this) == tb2Var14 ? tb2Var14 : c1eVar;
                }
                if (i15 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
