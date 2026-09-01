package defpackage;

import com.medium.android.graphql.type.CatalogItemType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gs9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sw9 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gs9(sw9 sw9Var, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sw9Var;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new gs9(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new gs9(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new gs9(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new gs9(this.d, this.e, this.f, n92Var, 3);
            case 4:
                return new gs9(this.d, this.e, this.f, n92Var, 4);
            case 5:
                return new gs9(this.d, this.e, this.f, n92Var, 5);
            case 6:
                return new gs9(this.d, this.e, this.f, n92Var, 6);
            case 7:
                return new gs9(this.d, this.e, this.f, n92Var, 7);
            case 8:
                return new gs9(this.d, this.e, this.f, n92Var, 8);
            case 9:
                return new gs9(this.d, this.e, this.f, n92Var, 9);
            case 10:
                return new gs9(this.d, this.e, this.f, n92Var, 10);
            case 11:
                return new gs9(this.d, this.e, this.f, n92Var, 11);
            case 12:
                return new gs9(this.d, this.e, this.f, n92Var, 12);
            case 13:
                return new gs9(this.d, this.e, this.f, n92Var, 13);
            case 14:
                return new gs9(this.d, this.e, this.f, n92Var, 14);
            case 15:
                return new gs9(this.d, this.e, this.f, n92Var, 15);
            case 16:
                return new gs9(this.d, this.e, this.f, n92Var, 16);
            case 17:
                return new gs9(this.d, this.e, this.f, n92Var, 17);
            case 18:
                return new gs9(this.d, this.e, this.f, n92Var, 18);
            default:
                return new gs9(this.d, this.e, this.f, n92Var, 19);
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
        return ((gs9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objW;
        Object objW2;
        Object objW3;
        Object objF;
        Object objT;
        Object objV;
        int i = this.b;
        String str = this.e;
        SourceParameter sourceParameter = this.f;
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
                jt9 jt9Var = new jt9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar.a(jt9Var, this) == tb2Var ? tb2Var : c1eVar;
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
                r6c r6cVar2 = sw9Var.x0;
                os9 os9Var = new os9(CatalogItemType.POST, str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar2.a(os9Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
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
                r6c r6cVar3 = sw9Var.x0;
                ps9 ps9Var = new ps9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar3.a(ps9Var, this) == tb2Var3 ? tb2Var3 : c1eVar;
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
                at9 at9Var = new at9(this.e, gp7.u(sourceParameter), null, null, 12);
                this.c = 1;
                return r6cVar4.a(at9Var, this) == tb2Var4 ? tb2Var4 : c1eVar;
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
                et9 et9Var = new et9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar5.a(et9Var, this) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    tl tlVar = sw9Var.s;
                    String str2 = sw9Var.d;
                    String str3 = sw9Var.D0;
                    this.c = 1;
                    objW = tlVar.w(this, this.f, this.e, str2, str3);
                    if (objW != tb2Var6) {
                    }
                    return tb2Var6;
                }
                if (i7 != 1) {
                    if (i7 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objW = obj;
                r6c r6cVar6 = sw9Var.x0;
                qt9 qt9Var = new qt9((t0e) objW);
                this.c = 2;
                if (r6cVar6.a(qt9Var, this) != tb2Var6) {
                    return c1eVar;
                }
                return tb2Var6;
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
                kt9 kt9Var = new kt9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar7.a(kt9Var, this) == tb2Var7 ? tb2Var7 : c1eVar;
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
                lt9 lt9Var = new lt9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar8.a(lt9Var, this) == tb2Var8 ? tb2Var8 : c1eVar;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 != 0) {
                    if (i10 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar9 = sw9Var.x0;
                jt9 jt9Var2 = new jt9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar9.a(jt9Var2, this) == tb2Var9 ? tb2Var9 : c1eVar;
            case 9:
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 == 0) {
                    br7.v(obj);
                    tl tlVar2 = sw9Var.s;
                    String str4 = sw9Var.d;
                    String str5 = sw9Var.D0;
                    this.c = 1;
                    objW2 = tlVar2.w(this, this.f, this.e, str4, str5);
                    if (objW2 != tb2Var10) {
                    }
                    return tb2Var10;
                }
                if (i11 != 1) {
                    if (i11 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objW2 = obj;
                r6c r6cVar10 = sw9Var.x0;
                qt9 qt9Var2 = new qt9((t0e) objW2);
                this.c = 2;
                if (r6cVar10.a(qt9Var2, this) != tb2Var10) {
                    return c1eVar;
                }
                return tb2Var10;
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
                jt9 jt9Var3 = new jt9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar11.a(jt9Var3, this) == tb2Var11 ? tb2Var11 : c1eVar;
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
                r6c r6cVar12 = sw9Var.x0;
                rs9 rs9Var = new rs9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar12.a(rs9Var, this) == tb2Var12 ? tb2Var12 : c1eVar;
            case 12:
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i14 = this.c;
                if (i14 == 0) {
                    br7.v(obj);
                    tl tlVar3 = sw9Var.s;
                    String str6 = sw9Var.d;
                    String str7 = sw9Var.D0;
                    this.c = 1;
                    objW3 = tlVar3.w(this, this.f, this.e, str6, str7);
                    if (objW3 != tb2Var13) {
                    }
                    return tb2Var13;
                }
                if (i14 != 1) {
                    if (i14 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objW3 = obj;
                r6c r6cVar13 = sw9Var.x0;
                qt9 qt9Var3 = new qt9((t0e) objW3);
                this.c = 2;
                if (r6cVar13.a(qt9Var3, this) != tb2Var13) {
                    return c1eVar;
                }
                return tb2Var13;
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
                r6c r6cVar14 = sw9Var.x0;
                at9 at9Var2 = new at9(this.e, gp7.u(sourceParameter), null, null, 12);
                this.c = 1;
                return r6cVar14.a(at9Var2, this) == tb2Var14 ? tb2Var14 : c1eVar;
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
                r6c r6cVar15 = sw9Var.x0;
                ps9 ps9Var2 = new ps9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar15.a(ps9Var2, this) == tb2Var15 ? tb2Var15 : c1eVar;
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
                r6c r6cVar16 = sw9Var.x0;
                qs9 qs9Var = new qs9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar16.a(qs9Var, this) == tb2Var16 ? tb2Var16 : c1eVar;
            case 16:
                tb2 tb2Var17 = tb2.COROUTINE_SUSPENDED;
                int i18 = this.c;
                if (i18 == 0) {
                    br7.v(obj);
                    tl tlVar4 = sw9Var.s;
                    String str8 = sw9Var.d;
                    String str9 = sw9Var.D0;
                    this.c = 1;
                    objF = tlVar4.f(this, this.f, this.e, str8, str9);
                    if (objF != tb2Var17) {
                    }
                    return tb2Var17;
                }
                if (i18 != 1) {
                    if (i18 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objF = obj;
                r6c r6cVar17 = sw9Var.x0;
                qt9 qt9Var4 = new qt9((xs4) objF);
                this.c = 2;
                if (r6cVar17.a(qt9Var4, this) != tb2Var17) {
                    return c1eVar;
                }
                return tb2Var17;
            case 17:
                tb2 tb2Var18 = tb2.COROUTINE_SUSPENDED;
                int i19 = this.c;
                if (i19 != 0) {
                    if (i19 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar18 = sw9Var.x0;
                et9 et9Var2 = new et9(str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar18.a(et9Var2, this) == tb2Var18 ? tb2Var18 : c1eVar;
            case 18:
                tb2 tb2Var19 = tb2.COROUTINE_SUSPENDED;
                int i20 = this.c;
                if (i20 == 0) {
                    br7.v(obj);
                    tl tlVar5 = sw9Var.s;
                    String str10 = sw9Var.d;
                    String str11 = sw9Var.D0;
                    this.c = 1;
                    objT = tlVar5.t(this, this.f, this.e, str10, str11);
                    if (objT != tb2Var19) {
                    }
                    return tb2Var19;
                }
                if (i20 != 1) {
                    if (i20 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objT = obj;
                r6c r6cVar19 = sw9Var.x0;
                qt9 qt9Var5 = new qt9((a0e) objT);
                this.c = 2;
                if (r6cVar19.a(qt9Var5, this) != tb2Var19) {
                    return c1eVar;
                }
                return tb2Var19;
            default:
                tb2 tb2Var20 = tb2.COROUTINE_SUSPENDED;
                int i21 = this.c;
                if (i21 == 0) {
                    br7.v(obj);
                    tl tlVar6 = sw9Var.s;
                    String str12 = sw9Var.d;
                    String str13 = sw9Var.D0;
                    this.c = 1;
                    objV = tlVar6.v(this, this.f, this.e, str12, str13);
                    if (objV != tb2Var20) {
                    }
                    return tb2Var20;
                }
                if (i21 != 1) {
                    if (i21 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objV = obj;
                r6c r6cVar20 = sw9Var.x0;
                qt9 qt9Var6 = new qt9((k0e) objV);
                this.c = 2;
                if (r6cVar20.a(qt9Var6, this) != tb2Var20) {
                    return c1eVar;
                }
                return tb2Var20;
        }
    }
}
