package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fs9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sw9 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ SourceParameter g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fs9(sw9 sw9Var, String str, String str2, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sw9Var;
        this.e = str;
        this.f = str2;
        this.g = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 0);
            case 1:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 1);
            case 2:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 2);
            case 3:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 3);
            case 4:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 4);
            case 5:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 5);
            case 6:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 6);
            case 7:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 7);
            case 8:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 8);
            default:
                return new fs9(this.d, this.e, this.f, this.g, n92Var, 9);
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
        return ((fs9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objU;
        Object objS;
        Object objS2;
        Object objS3;
        Object objS4;
        int i = this.b;
        String str = this.f;
        String str2 = this.e;
        SourceParameter sourceParameter = this.g;
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
                tl tlVar = sw9Var.s;
                String str3 = sw9Var.d;
                SourceParameter sourceParameter2 = this.g;
                String str4 = sw9Var.D0;
                String str5 = this.e;
                String str6 = this.f;
                tlVar.r(sourceParameter2, str5, str6, str3, str4);
                r6c r6cVar = sw9Var.x0;
                us9 us9Var = new us9(sourceParameter, str5, str6);
                this.c = 1;
                return r6cVar.a(us9Var, this) == tb2Var ? tb2Var : c1eVar;
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
                vs9 vs9Var = new vs9(str2, EntityType.AUTHOR, str, sourceParameter);
                this.c = 1;
                return r6cVar2.a(vs9Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
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
                bt9 bt9Var = new bt9(str2, str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar3.a(bt9Var, this) == tb2Var3 ? tb2Var3 : c1eVar;
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
                tl tlVar2 = sw9Var.s;
                String str7 = sw9Var.d;
                SourceParameter sourceParameter3 = this.g;
                String str8 = sw9Var.D0;
                String str9 = this.e;
                String str10 = this.f;
                tlVar2.s(sourceParameter3, str9, str10, str7, str8);
                r6c r6cVar4 = sw9Var.x0;
                us9 us9Var2 = new us9(sourceParameter, str9, str10);
                this.c = 1;
                return r6cVar4.a(us9Var2, this) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    tl tlVar3 = sw9Var.s;
                    String str11 = sw9Var.d;
                    String str12 = sw9Var.D0;
                    this.c = 1;
                    objU = tlVar3.u(this.e, this.f, this.g, str12, str11, this);
                    if (objU != tb2Var5) {
                    }
                    return tb2Var5;
                }
                if (i6 != 1) {
                    if (i6 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objU = obj;
                r6c r6cVar5 = sw9Var.x0;
                qt9 qt9Var = new qt9((g0e) objU);
                this.c = 2;
                if (r6cVar5.a(qt9Var, this) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    ku3 ku3Var = sw9Var.Q;
                    EntityType entityType = EntityType.AUTHOR;
                    String str13 = sw9Var.d;
                    String str14 = sw9Var.D0;
                    this.c = 1;
                    ku3Var.getClass();
                    objS = o7f.s(new yu4(ku3Var, this.f, str13, this.g, str14, this.e, entityType, (n92) null), this);
                    if (objS != tb2Var6) {
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
                objS = obj;
                r6c r6cVar6 = sw9Var.x0;
                ls9 ls9Var = new ls9((uu4) objS);
                this.c = 2;
                if (r6cVar6.a(ls9Var, this) != tb2Var6) {
                    return c1eVar;
                }
                return tb2Var6;
            case 6:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    o2b o2bVar = sw9Var.R;
                    EntityType entityType2 = EntityType.AUTHOR;
                    String str15 = sw9Var.d;
                    String str16 = sw9Var.D0;
                    this.c = 1;
                    o2bVar.getClass();
                    objS2 = o7f.s(new yu4(this.f, o2bVar, str15, this.g, str16, this.e, entityType2, (n92) null), this);
                    if (objS2 != tb2Var7) {
                    }
                    return tb2Var7;
                }
                if (i8 != 1) {
                    if (i8 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objS2 = obj;
                r6c r6cVar7 = sw9Var.x0;
                ju9 ju9Var = new ju9((r0e) objS2);
                this.c = 2;
                if (r6cVar7.a(ju9Var, this) != tb2Var7) {
                    return c1eVar;
                }
                return tb2Var7;
            case 7:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    ku3 ku3Var2 = sw9Var.Q;
                    EntityType entityType3 = EntityType.AUTHOR;
                    String str17 = sw9Var.d;
                    String str18 = sw9Var.D0;
                    this.c = 1;
                    ku3Var2.getClass();
                    objS3 = o7f.s(new yu4(ku3Var2, this.f, str17, this.g, str18, this.e, entityType3, (n92) null), this);
                    if (objS3 != tb2Var8) {
                    }
                    return tb2Var8;
                }
                if (i9 != 1) {
                    if (i9 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objS3 = obj;
                r6c r6cVar8 = sw9Var.x0;
                ls9 ls9Var2 = new ls9((uu4) objS3);
                this.c = 2;
                if (r6cVar8.a(ls9Var2, this) != tb2Var8) {
                    return c1eVar;
                }
                return tb2Var8;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 == 0) {
                    br7.v(obj);
                    o2b o2bVar2 = sw9Var.R;
                    EntityType entityType4 = EntityType.AUTHOR;
                    String str19 = sw9Var.d;
                    String str20 = sw9Var.D0;
                    this.c = 1;
                    o2bVar2.getClass();
                    objS4 = o7f.s(new yu4(this.f, o2bVar2, str19, this.g, str20, this.e, entityType4, (n92) null), this);
                    if (objS4 != tb2Var9) {
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
                objS4 = obj;
                r6c r6cVar9 = sw9Var.x0;
                ju9 ju9Var2 = new ju9((r0e) objS4);
                this.c = 2;
                if (r6cVar9.a(ju9Var2, this) != tb2Var9) {
                    return c1eVar;
                }
                return tb2Var9;
            default:
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
                ot9 ot9Var = new ot9(str2, str, gp7.u(sourceParameter));
                this.c = 1;
                return r6cVar10.a(ot9Var, this) == tb2Var10 ? tb2Var10 : c1eVar;
        }
    }
}
