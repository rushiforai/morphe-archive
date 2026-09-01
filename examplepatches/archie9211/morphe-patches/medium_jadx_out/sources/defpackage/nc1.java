package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nc1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ id1 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ SourceParameter g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nc1(id1 id1Var, String str, String str2, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = id1Var;
        this.e = str;
        this.f = str2;
        this.g = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new nc1(this.d, this.e, this.f, this.g, n92Var, 0);
            case 1:
                return new nc1(this.d, this.e, this.f, this.g, n92Var, 1);
            default:
                return new nc1(this.d, this.e, this.f, this.g, n92Var, 2);
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
        return ((nc1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objS;
        Object objU;
        Object objS2;
        int i = this.b;
        c1e c1eVar = c1e.a;
        id1 id1Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    ku3 ku3Var = id1Var.u;
                    EntityType entityType = EntityType.AUTHOR;
                    String str = id1Var.c;
                    String strG = id1Var.g();
                    this.c = 1;
                    ku3Var.getClass();
                    objS = o7f.s(new yu4(ku3Var, this.f, str, this.g, strG, this.e, entityType, (n92) null), this);
                    if (objS != tb2Var) {
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
                objS = obj;
                r6c r6cVar = id1Var.L;
                ib1 ib1Var = new ib1((uu4) objS);
                this.c = 2;
                if (r6cVar.a(ib1Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    tl tlVar = id1Var.C;
                    String str2 = id1Var.c;
                    String strG2 = id1Var.g();
                    this.c = 1;
                    objU = tlVar.u(this.e, this.f, this.g, strG2, str2, this);
                    if (objU != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objU = obj;
                r6c r6cVar2 = id1Var.L;
                pb1 pb1Var = new pb1((g0e) objU);
                this.c = 2;
                if (r6cVar2.a(pb1Var, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    o2b o2bVar = id1Var.v;
                    EntityType entityType2 = EntityType.AUTHOR;
                    String str3 = id1Var.c;
                    String strG3 = id1Var.g();
                    this.c = 1;
                    o2bVar.getClass();
                    objS2 = o7f.s(new yu4(this.f, o2bVar, str3, this.g, strG3, this.e, entityType2, (n92) null), this);
                    if (objS2 != tb2Var3) {
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
                objS2 = obj;
                r6c r6cVar3 = id1Var.L;
                yb1 yb1Var = new yb1((r0e) objS2);
                this.c = 2;
                if (r6cVar3.a(yb1Var, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
        }
    }
}
