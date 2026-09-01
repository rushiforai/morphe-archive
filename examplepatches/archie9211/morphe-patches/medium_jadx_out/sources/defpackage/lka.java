package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lka extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ pka d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ SourceParameter g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lka(pka pkaVar, String str, String str2, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = pkaVar;
        this.e = str;
        this.f = str2;
        this.g = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new lka(this.d, this.e, this.f, this.g, n92Var, 0);
            default:
                return new lka(this.d, this.e, this.f, this.g, n92Var, 1);
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
        return ((lka) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objU;
        Object objU2;
        lka lkaVar = this;
        int i = lkaVar.b;
        c1e c1eVar = c1e.a;
        pka pkaVar = lkaVar.d;
        switch (i) {
            case 0:
                r6c r6cVar = pkaVar.l;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = lkaVar.c;
                if (i2 == 0) {
                    br7.v(obj);
                    o2b o2bVar = pkaVar.f;
                    EntityType entityType = EntityType.COLLECTION;
                    String str = pkaVar.b;
                    Boolean bool = Boolean.FALSE;
                    lkaVar.c = 1;
                    objU = o2bVar.u(lkaVar, entityType, bool, lkaVar.e, str, false);
                    if (objU != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2 || i2 == 3 || i2 == 4) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objU = obj;
                swc swcVar = (swc) objU;
                boolean zL = g76.L(swcVar, pwc.a);
                String str2 = lkaVar.f;
                String str3 = lkaVar.e;
                SourceParameter sourceParameter = lkaVar.g;
                if (zL) {
                    zja zjaVar = new zja(sourceParameter, pkaVar.b, str2, str3);
                    lkaVar.c = 2;
                    if (r6cVar.a(zjaVar, lkaVar) != tb2Var) {
                        return c1eVar;
                    }
                } else if (swcVar instanceof qwc) {
                    bka bkaVar = new bka(str3, str2, m4.I(((qwc) swcVar).a), sourceParameter);
                    lkaVar.c = 3;
                    if (r6cVar.a(bkaVar, lkaVar) != tb2Var) {
                        return c1eVar;
                    }
                } else {
                    if (!(swcVar instanceof rwc)) {
                        ygf.a();
                        return null;
                    }
                    cka ckaVar = new cka(sourceParameter, str3, str2);
                    lkaVar.c = 4;
                    if (r6cVar.a(ckaVar, lkaVar) != tb2Var) {
                        return c1eVar;
                    }
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = lkaVar.c;
                if (i3 == 0) {
                    br7.v(obj);
                    tl tlVar = pkaVar.i;
                    String str4 = pkaVar.c;
                    String str5 = pkaVar.o;
                    lkaVar.c = 1;
                    objU2 = tlVar.u(lkaVar.e, lkaVar.f, lkaVar.g, str5, str4, lkaVar);
                    lkaVar = lkaVar;
                    if (objU2 != tb2Var2) {
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
                objU2 = obj;
                r6c r6cVar2 = pkaVar.l;
                aka akaVar = new aka((g0e) objU2);
                lkaVar.c = 2;
                if (r6cVar2.a(akaVar, lkaVar) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
