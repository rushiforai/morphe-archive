package defpackage;

import com.medium.proto.event.PostClientUnread;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jua extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nua d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jua(nua nuaVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nuaVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new jua(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new jua(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new jua(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new jua(this.d, this.e, this.f, n92Var, 3);
            default:
                return new jua(this.d, this.e, this.f, n92Var, 4);
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
        return ((jua) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objF;
        Object objT;
        Object objV;
        Object objW;
        int i = this.b;
        c1e c1eVar = c1e.a;
        nua nuaVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    tl tlVar = nuaVar.e;
                    String str = nuaVar.b;
                    String str2 = nuaVar.i;
                    this.c = 1;
                    objF = tlVar.f(this, this.f, this.e, str, str2);
                    if (objF != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objF = obj;
                r6c r6cVar = nuaVar.l;
                cua cuaVar = new cua((xs4) objF);
                this.c = 2;
                if (r6cVar.a(cuaVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
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
                ty2 ty2Var = nuaVar.f;
                String str3 = nuaVar.b;
                String strU = gp7.u(this.f);
                String str4 = nuaVar.i;
                ty2Var.getClass();
                str3.getClass();
                str4.getClass();
                rqd rqdVar = ty2Var.a;
                String str5 = this.e;
                rqd.a(rqdVar, new PostClientUnread(null, str5, strU, null, 9, null), str3, strU, true, null, str4, 16);
                zta ztaVar = nuaVar.g;
                ov5 ov5Var = new ov5(str5, 22);
                this.c = 1;
                Object objD0 = ztaVar.b.d0(ov5Var, this);
                if (objD0 != tb2Var2) {
                    objD0 = c1eVar;
                }
                return objD0 == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    tl tlVar2 = nuaVar.e;
                    String str6 = nuaVar.b;
                    String str7 = nuaVar.i;
                    this.c = 1;
                    objT = tlVar2.t(this, this.f, this.e, str6, str7);
                    if (objT != tb2Var3) {
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
                objT = obj;
                r6c r6cVar2 = nuaVar.l;
                cua cuaVar2 = new cua((a0e) objT);
                this.c = 2;
                if (r6cVar2.a(cuaVar2, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    tl tlVar3 = nuaVar.e;
                    String str8 = nuaVar.b;
                    String str9 = nuaVar.i;
                    this.c = 1;
                    objV = tlVar3.v(this, this.f, this.e, str8, str9);
                    if (objV != tb2Var4) {
                    }
                    return tb2Var4;
                }
                if (i5 != 1) {
                    if (i5 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objV = obj;
                r6c r6cVar3 = nuaVar.l;
                cua cuaVar3 = new cua((k0e) objV);
                this.c = 2;
                if (r6cVar3.a(cuaVar3, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            default:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    tl tlVar4 = nuaVar.e;
                    String str10 = nuaVar.b;
                    String str11 = nuaVar.i;
                    this.c = 1;
                    objW = tlVar4.w(this, this.f, this.e, str10, str11);
                    if (objW != tb2Var5) {
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
                objW = obj;
                r6c r6cVar4 = nuaVar.l;
                cua cuaVar4 = new cua((t0e) objW);
                this.c = 2;
                if (r6cVar4.a(cuaVar4, this) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
        }
    }
}
