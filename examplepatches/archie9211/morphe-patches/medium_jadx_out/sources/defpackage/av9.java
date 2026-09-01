package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class av9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sw9 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ av9(sw9 sw9Var, String str, String str2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sw9Var;
        this.e = str;
        this.f = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new av9(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new av9(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new av9(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new av9(this.d, this.e, this.f, n92Var, 3);
            case 4:
                return new av9(this.d, this.e, this.f, n92Var, 4);
            case 5:
                return new av9(this.d, this.e, this.f, n92Var, 5);
            case 6:
                return new av9(this.d, this.e, this.f, n92Var, 6);
            case 7:
                return new av9(this.d, this.e, this.f, n92Var, 7);
            case 8:
                return new av9(this.d, this.e, this.f, n92Var, 8);
            case 9:
                return new av9(this.d, this.e, this.f, n92Var, 9);
            case 10:
                return new av9(this.d, this.e, this.f, n92Var, 10);
            case 11:
                return new av9(this.d, this.e, this.f, n92Var, 11);
            case 12:
                return new av9(this.d, this.e, this.f, n92Var, 12);
            case 13:
                return new av9(this.d, this.e, this.f, n92Var, 13);
            case 14:
                return new av9(this.d, this.e, this.f, n92Var, 14);
            case 15:
                return new av9(this.d, this.e, this.f, n92Var, 15);
            case 16:
                return new av9(this.d, this.e, this.f, n92Var, 16);
            default:
                return new av9(this.d, this.e, this.f, n92Var, 17);
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
        return ((av9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objE0;
        Object objH;
        Object objJ0;
        int i = this.b;
        String str = this.f;
        String str2 = this.e;
        c1e c1eVar = c1e.a;
        sw9 sw9Var = this.d;
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
                r6c r6cVar = sw9Var.x0;
                ns9 ns9Var = new ns9(str2, str);
                this.c = 1;
                return r6cVar.a(ns9Var, this) == tb2Var ? tb2Var : c1eVar;
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
                n0c n0cVar = sw9Var.t;
                boolean z = sw9Var.H0;
                n0cVar.getClass();
                s71 s71VarV = n0c.v(str2, str, z);
                r6c r6cVar2 = sw9Var.x0;
                ks9 ks9Var = new ks9(s71VarV);
                this.c = 1;
                return r6cVar2.a(ks9Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = sw9Var.t;
                    boolean z2 = sw9Var.H0;
                    this.c = 1;
                    objE0 = n0cVar2.e0(str2, z2, this);
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
                r6c r6cVar3 = sw9Var.x0;
                ks9 ks9Var2 = new ks9((g81) objE0);
                this.c = 2;
                if (r6cVar3.a(ks9Var2, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
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
                r6c r6cVar4 = sw9Var.x0;
                jt9 jt9Var = new jt9(str2, str);
                this.c = 1;
                return r6cVar4.a(jt9Var, this) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar5 = sw9Var.x0;
                ss9 ss9Var = new ss9(str2, str);
                this.c = 1;
                return r6cVar5.a(ss9Var, this) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
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
                r6c r6cVar6 = sw9Var.x0;
                at9 at9Var = new at9(this.e, this.f, null, null, 12);
                this.c = 1;
                return r6cVar6.a(at9Var, this) == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
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
                r6c r6cVar7 = sw9Var.x0;
                it9 it9Var = new it9(str2, str);
                this.c = 1;
                return r6cVar7.a(it9Var, this) == tb2Var7 ? tb2Var7 : c1eVar;
            case 7:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 != 0) {
                    if (i9 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar8 = sw9Var.x0;
                jt9 jt9Var2 = new jt9(str2, str);
                this.c = 1;
                return r6cVar8.a(jt9Var2, this) == tb2Var8 ? tb2Var8 : c1eVar;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 == 0) {
                    br7.v(obj);
                    n0c n0cVar3 = sw9Var.t;
                    boolean z3 = sw9Var.H0;
                    String str3 = sw9Var.d;
                    String str4 = sw9Var.D0;
                    this.c = 1;
                    objH = n0cVar3.H(this, this.e, str3, this.f, str4, z3);
                    if (objH != tb2Var9) {
                    }
                    return tb2Var9;
                }
                if (i10 != 1) {
                    if (i10 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objH = obj;
                r6c r6cVar9 = sw9Var.x0;
                ks9 ks9Var3 = new ks9((x71) objH);
                this.c = 2;
                if (r6cVar9.a(ks9Var3, this) != tb2Var9) {
                    return c1eVar;
                }
                return tb2Var9;
            case 9:
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 != 0) {
                    if (i11 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar10 = sw9Var.x0;
                jt9 jt9Var3 = new jt9(str2, str);
                this.c = 1;
                return r6cVar10.a(jt9Var3, this) == tb2Var10 ? tb2Var10 : c1eVar;
            case 10:
                tb2 tb2Var11 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                if (i12 != 0) {
                    if (i12 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar11 = sw9Var.x0;
                gt9 gt9Var = new gt9(str2, str);
                this.c = 1;
                return r6cVar11.a(gt9Var, this) == tb2Var11 ? tb2Var11 : c1eVar;
            case 11:
                tb2 tb2Var12 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 != 0) {
                    if (i13 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xpc xpcVar = sw9Var.z0;
                or9 or9Var = new or9(new v53(str2), str);
                this.c = 1;
                xpcVar.a(or9Var, this);
                return c1eVar == tb2Var12 ? tb2Var12 : c1eVar;
            case 12:
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i14 = this.c;
                if (i14 != 0) {
                    if (i14 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar12 = sw9Var.x0;
                jt9 jt9Var4 = new jt9(str2, str);
                this.c = 1;
                return r6cVar12.a(jt9Var4, this) == tb2Var13 ? tb2Var13 : c1eVar;
            case 13:
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i15 = this.c;
                if (i15 != 0) {
                    if (i15 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar13 = sw9Var.x0;
                ps9 ps9Var = new ps9(str2, str);
                this.c = 1;
                return r6cVar13.a(ps9Var, this) == tb2Var14 ? tb2Var14 : c1eVar;
            case 14:
                tb2 tb2Var15 = tb2.COROUTINE_SUSPENDED;
                int i16 = this.c;
                if (i16 != 0) {
                    if (i16 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar14 = sw9Var.x0;
                at9 at9Var2 = new at9(this.e, this.f, null, sw9Var.c, 4);
                this.c = 1;
                return r6cVar14.a(at9Var2, this) == tb2Var15 ? tb2Var15 : c1eVar;
            case 15:
                tb2 tb2Var16 = tb2.COROUTINE_SUSPENDED;
                int i17 = this.c;
                if (i17 != 0) {
                    if (i17 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar15 = sw9Var.x0;
                jt9 jt9Var5 = new jt9(str2, str);
                this.c = 1;
                return r6cVar15.a(jt9Var5, this) == tb2Var16 ? tb2Var16 : c1eVar;
            case 16:
                tb2 tb2Var17 = tb2.COROUTINE_SUSPENDED;
                int i18 = this.c;
                if (i18 != 0) {
                    if (i18 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar16 = sw9Var.x0;
                ps9 ps9Var2 = new ps9(str2, str);
                this.c = 1;
                return r6cVar16.a(ps9Var2, this) == tb2Var17 ? tb2Var17 : c1eVar;
            default:
                tb2 tb2Var18 = tb2.COROUTINE_SUSPENDED;
                int i19 = this.c;
                if (i19 == 0) {
                    br7.v(obj);
                    n0c n0cVar4 = sw9Var.t;
                    boolean z4 = sw9Var.H0;
                    String str5 = sw9Var.d;
                    String str6 = sw9Var.D0;
                    this.c = 1;
                    objJ0 = n0cVar4.j0(this, this.e, str5, this.f, str6, z4);
                    if (objJ0 != tb2Var18) {
                    }
                    return tb2Var18;
                }
                if (i19 != 1) {
                    if (i19 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objJ0 = obj;
                r6c r6cVar17 = sw9Var.x0;
                ks9 ks9Var4 = new ks9((k81) objJ0);
                this.c = 2;
                if (r6cVar17.a(ks9Var4, this) != tb2Var18) {
                    return c1eVar;
                }
                return tb2Var18;
        }
    }
}
