package defpackage;

import com.medium.android.graphql.fragment.UserBlockData;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ebb extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ jbb d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ebb(jbb jbbVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = jbbVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new ebb(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new ebb(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new ebb(this.d, this.e, this.f, n92Var, 2);
            default:
                return new ebb(this.d, this.e, this.f, n92Var, 3);
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
        return ((ebb) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objA2;
        Object objH;
        int i = this.b;
        String str = this.e;
        SourceParameter sourceParameter = this.f;
        c1e c1eVar = c1e.a;
        jbb jbbVar = this.d;
        switch (i) {
            case 0:
                r6c r6cVar = jbbVar.m;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    f88 f88Var = jbbVar.f;
                    String strU = gp7.u(sourceParameter);
                    String str2 = jbbVar.c;
                    String str3 = jbbVar.s;
                    String str4 = sourceParameter.post_id;
                    this.c = 1;
                    objA = f88Var.a(this, this.e, strU, str2, str3, str4, true);
                    if (objA != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2 || i2 == 3) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objA = ((bjb) obj).a;
                Throwable thB = bjb.b(objA);
                if (thB == null) {
                    rab rabVar = new rab(sourceParameter, str, ((UserBlockData) objA).getName());
                    this.c = 2;
                    if (r6cVar.a(rabVar, this) != tb2Var) {
                        return c1eVar;
                    }
                } else {
                    qab qabVar = new qab(str, sourceParameter, m4.I(thB));
                    this.c = 3;
                    if (r6cVar.a(qabVar, this) != tb2Var) {
                        return c1eVar;
                    }
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
                xpc xpcVar = jbbVar.o;
                pab pabVar = new pab(new ms0(str, sourceParameter));
                this.c = 1;
                xpcVar.a(pabVar, this);
                return c1eVar == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                r6c r6cVar2 = jbbVar.m;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    f88 f88Var2 = jbbVar.f;
                    String strU2 = gp7.u(sourceParameter);
                    String str5 = jbbVar.c;
                    String str6 = jbbVar.s;
                    String str7 = sourceParameter.post_id;
                    this.c = 1;
                    objA2 = f88Var2.a(this, this.e, strU2, str5, str6, str7, false);
                    if (objA2 != tb2Var3) {
                    }
                    return tb2Var3;
                }
                if (i4 != 1) {
                    if (i4 == 2 || i4 == 3) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objA2 = ((bjb) obj).a;
                Throwable thB2 = bjb.b(objA2);
                if (thB2 == null) {
                    uab uabVar = new uab(sourceParameter, str, ((UserBlockData) objA2).getName());
                    this.c = 2;
                    if (r6cVar2.a(uabVar, this) != tb2Var3) {
                        return c1eVar;
                    }
                } else {
                    tab tabVar = new tab(str, sourceParameter, m4.I(thB2));
                    this.c = 3;
                    if (r6cVar2.a(tabVar, this) != tb2Var3) {
                        return c1eVar;
                    }
                }
                return tb2Var3;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    kbe kbeVar = jbbVar.i;
                    String str8 = jbbVar.c;
                    String str9 = jbbVar.s;
                    this.c = 1;
                    objH = kbeVar.h(this, this.f, this.e, str8, str9);
                    if (objH != tb2Var4) {
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
                objH = obj;
                r6c r6cVar3 = jbbVar.m;
                wab wabVar = new wab((b8e) objH);
                this.c = 2;
                if (r6cVar3.a(wabVar, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
        }
    }
}
