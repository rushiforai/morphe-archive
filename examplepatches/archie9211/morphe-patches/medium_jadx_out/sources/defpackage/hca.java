package defpackage;

import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hca extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ do4 d;
    public /* synthetic */ Object e;
    public final /* synthetic */ lca f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hca(n92 n92Var, lca lcaVar, int i) {
        super(3, n92Var);
        this.b = i;
        this.f = lcaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        lca lcaVar = this.f;
        do4 do4Var = (do4) obj;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                hca hcaVar = new hca(n92Var, lcaVar, 0);
                hcaVar.d = do4Var;
                hcaVar.e = obj2;
                return hcaVar.invokeSuspend(c1eVar);
            case 1:
                hca hcaVar2 = new hca(n92Var, lcaVar, 1);
                hcaVar2.d = do4Var;
                hcaVar2.e = obj2;
                return hcaVar2.invokeSuspend(c1eVar);
            default:
                hca hcaVar3 = new hca(n92Var, lcaVar, 2);
                hcaVar3.d = do4Var;
                hcaVar3.e = obj2;
                return hcaVar3.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        bo4 u50Var;
        f09 f09Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        lca lcaVar = this.f;
        n92 n92Var = null;
        switch (i) {
            case 0:
                do4 do4Var = this.d;
                Object obj2 = this.e;
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
                u50 u50Var2 = new u50(12, new zo5(((bjb) obj2).a, lcaVar, n92Var, 21));
                this.d = null;
                this.e = null;
                this.c = 1;
                return wgf.l(do4Var, u50Var2, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                do4 do4Var2 = this.d;
                Object obj3 = this.e;
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
                uba ubaVar = (uba) obj3;
                Object obj4 = ubaVar.a;
                Throwable thB = bjb.b(obj4);
                if (thB == null) {
                    String str = (String) obj4;
                    hba hbaVar = lcaVar.e;
                    Integer num = ubaVar.b;
                    rba rbaVar = ubaVar.c;
                    String str2 = ubaVar.d;
                    tg tgVar = new tg(14, null, lcaVar);
                    hbaVar.getClass();
                    str.getClass();
                    rbaVar.getClass();
                    if (num != null) {
                        int iIntValue = num.intValue();
                        Calendar calendarG = pwd.G(null);
                        calendarG.set(iIntValue, 0, 1, 0, 0, 0);
                        calendarG.set(14, 0);
                        long timeInMillis = calendarG.getTimeInMillis();
                        calendarG.set(iIntValue, 11, 31, 23, 59, 59);
                        calendarG.set(14, 999);
                        f09Var = new f09(Long.valueOf(timeInMillis), Long.valueOf(calendarG.getTimeInMillis()));
                    } else {
                        f09Var = null;
                    }
                    u50Var = hbaVar.b.Q(new gba(hbaVar, str, rbaVar, f09Var, str2, tgVar, null));
                } else {
                    u50Var = new u50(7, new nz8(thB));
                }
                this.d = null;
                this.e = null;
                this.c = 1;
                return wgf.l(do4Var2, u50Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                do4 do4Var3 = this.d;
                Object obj5 = this.e;
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
                u50 u50Var3 = new u50(12, new uk8(((bjb) obj5).a, lcaVar, n92Var, 9));
                this.d = null;
                this.e = null;
                this.c = 1;
                return wgf.l(do4Var3, u50Var3, this) == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
