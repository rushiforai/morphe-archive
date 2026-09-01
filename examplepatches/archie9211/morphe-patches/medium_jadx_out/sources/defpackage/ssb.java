package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ssb extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public long c;
    public int d;
    public final /* synthetic */ long e;
    public Object f;
    public Object g;
    public Object h;
    public final /* synthetic */ Object i;
    public /* synthetic */ Object j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ssb(vsb vsbVar, qya qyaVar, long j, n92 n92Var) {
        super(2, n92Var);
        this.g = vsbVar;
        this.i = qyaVar;
        this.e = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.i;
        switch (i) {
            case 0:
                ssb ssbVar = new ssb((vsb) this.g, (qya) obj2, this.e, n92Var);
                ssbVar.j = obj;
                return ssbVar;
            default:
                return new ssb((x7g) obj2, this.e, (awa) this.j, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((ssb) create((tsb) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((ssb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        vsb vsbVar;
        Object objA;
        qya qyaVar;
        vsb vsbVar2;
        long j;
        x7g x7gVar;
        awa awaVar;
        y88 y88Var;
        long j2;
        y88 y88Var2;
        Object objInvoke;
        int i = this.b;
        long j3 = this.e;
        Object obj2 = this.i;
        int i2 = 1;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.d;
                if (i3 == 0) {
                    br7.v(obj);
                    tsb tsbVar = (tsb) this.j;
                    vsbVar = (vsb) this.g;
                    al alVar = new al(vsbVar, i2, tsbVar);
                    qya qyaVar2 = (qya) obj2;
                    dn4 dn4Var = vsbVar.c;
                    long j4 = qyaVar2.a;
                    float fD = vsbVar.d(vsbVar.d == hw8.Horizontal ? qre.b(j3) : qre.c(j3));
                    this.j = vsbVar;
                    this.f = vsbVar;
                    this.h = qyaVar2;
                    this.c = j4;
                    this.d = 1;
                    objA = dn4Var.a(alVar, fD, this);
                    if (objA == tb2Var) {
                        return tb2Var;
                    }
                    qyaVar = qyaVar2;
                    vsbVar2 = vsbVar;
                    j = j4;
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    j = this.c;
                    qyaVar = (qya) this.h;
                    vsbVar2 = (vsb) this.f;
                    vsb vsbVar3 = (vsb) this.j;
                    br7.v(obj);
                    vsbVar = vsbVar3;
                    objA = obj;
                }
                float fD2 = vsbVar.d(((Number) objA).floatValue());
                qyaVar.a = vsbVar2.d == hw8.Horizontal ? qre.a(j, fD2, 0.0f, 2) : qre.a(j, 0.0f, fD2, 1);
                return c1e.a;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.d;
                try {
                    if (i4 == 0) {
                        br7.v(obj);
                        x7g x7gVar2 = (x7g) obj2;
                        awa awaVar2 = (awa) this.j;
                        a98 a98Var = x7gVar2.d;
                        this.f = a98Var;
                        this.g = x7gVar2;
                        this.h = awaVar2;
                        this.c = j3;
                        this.d = 1;
                        if (a98Var.m(this, null) == tb2Var2) {
                            return tb2Var2;
                        }
                        x7gVar = x7gVar2;
                        awaVar = awaVar2;
                        y88Var = a98Var;
                    } else {
                        if (i4 != 1) {
                            y88Var2 = (y88) this.f;
                            try {
                                br7.v(obj);
                                objInvoke = obj;
                                bjb bjbVar = (bjb) objInvoke;
                                Object obj3 = bjbVar.a;
                                y88Var2.f(null);
                                return bjbVar;
                            } catch (Throwable th) {
                                th = th;
                                y88Var2.f(null);
                                throw th;
                            }
                        }
                        j3 = this.c;
                        awa awaVar3 = (awa) this.h;
                        x7g x7gVar3 = (x7g) this.g;
                        y88Var = (y88) this.f;
                        br7.v(obj);
                        awaVar = awaVar3;
                        x7gVar = x7gVar3;
                    }
                    adg adgVar = x7gVar.c;
                    l7g l7gVar = new l7g(x7gVar, j2, awaVar, null, 1);
                    this.f = y88Var;
                    this.g = null;
                    this.h = null;
                    this.d = 2;
                    objInvoke = l7gVar.invoke(adgVar, this);
                    if (objInvoke == tb2Var2) {
                        return tb2Var2;
                    }
                    y88Var2 = y88Var;
                    bjb bjbVar2 = (bjb) objInvoke;
                    Object obj32 = bjbVar2.a;
                    y88Var2.f(null);
                    return bjbVar2;
                } catch (Throwable th2) {
                    th = th2;
                    y88Var2 = y88Var;
                    y88Var2.f(null);
                    throw th;
                }
                j2 = j3;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ssb(x7g x7gVar, long j, awa awaVar, n92 n92Var) {
        super(2, n92Var);
        this.i = x7gVar;
        this.e = j;
        this.j = awaVar;
    }
}
