package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a74 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a74(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                a74 a74Var = new a74(2, 0, n92Var);
                a74Var.d = obj;
                return a74Var;
            case 1:
                a74 a74Var2 = new a74(2, 1, n92Var);
                a74Var2.d = obj;
                return a74Var2;
            case 2:
                a74 a74Var3 = new a74(2, 2, n92Var);
                a74Var3.d = obj;
                return a74Var3;
            case 3:
                a74 a74Var4 = new a74(2, 3, n92Var);
                a74Var4.d = obj;
                return a74Var4;
            case 4:
                a74 a74Var5 = new a74(2, 4, n92Var);
                a74Var5.d = obj;
                return a74Var5;
            case 5:
                a74 a74Var6 = new a74(2, 5, n92Var);
                a74Var6.d = obj;
                return a74Var6;
            case 6:
                a74 a74Var7 = new a74(2, 6, n92Var);
                a74Var7.d = obj;
                return a74Var7;
            case 7:
                a74 a74Var8 = new a74(2, 7, n92Var);
                a74Var8.d = obj;
                return a74Var8;
            case 8:
                a74 a74Var9 = new a74(2, 8, n92Var);
                a74Var9.d = obj;
                return a74Var9;
            default:
                a74 a74Var10 = new a74(2, 9, n92Var);
                a74Var10.d = obj;
                return a74Var10;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((a74) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        sb2 sb2Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                do4 do4Var = (do4) this.d;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return do4Var.a(kgc.b, this) == tb2Var ? tb2Var : c1eVar;
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
                    sb2Var = (sb2) this.d;
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    sb2Var = (sb2) this.d;
                    br7.v(obj);
                }
                while (bo.V(sb2Var.Q())) {
                    hb8 hb8Var = new hb8(7);
                    this.d = sb2Var;
                    this.c = 1;
                    if (gr7.o(getContext()).a(hb8Var, this) == tb2Var2) {
                        return tb2Var2;
                    }
                }
                return c1eVar;
            case 2:
                do4 do4Var2 = (do4) this.d;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return do4Var2.a(pz8.a, this) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i4 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 3:
                do4 do4Var3 = (do4) this.d;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return do4Var3.a(c1eVar, this) == tb2Var4 ? tb2Var4 : c1eVar;
                }
                if (i5 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 4:
                do4 do4Var4 = (do4) this.d;
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return do4Var4.a(k2b.a, this) == tb2Var5 ? tb2Var5 : c1eVar;
                }
                if (i6 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 5:
                do4 do4Var5 = (do4) this.d;
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Boolean bool = Boolean.FALSE;
                this.d = null;
                this.c = 1;
                return do4Var5.a(bool, this) == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
                do4 do4Var6 = (do4) this.d;
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Boolean bool2 = Boolean.FALSE;
                this.d = null;
                this.c = 1;
                return do4Var6.a(bool2, this) == tb2Var7 ? tb2Var7 : c1eVar;
            case 7:
                do4 do4Var7 = (do4) this.d;
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return do4Var7.a(tcd.a, this) == tb2Var8 ? tb2Var8 : c1eVar;
                }
                if (i9 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 8:
                do4 do4Var8 = (do4) this.d;
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return do4Var8.a(r8e.a, this) == tb2Var9 ? tb2Var9 : c1eVar;
                }
                if (i10 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 == 0) {
                    br7.v(obj);
                    do4 do4Var9 = (do4) this.d;
                    this.c = 1;
                    return do4Var9.a(c1eVar, this) == tb2Var10 ? tb2Var10 : c1eVar;
                }
                if (i11 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
