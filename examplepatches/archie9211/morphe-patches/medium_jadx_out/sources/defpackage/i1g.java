package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i1g extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ m1g e;
    public final /* synthetic */ String f;
    public final /* synthetic */ arf g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i1g(m1g m1gVar, String str, arf arfVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = m1gVar;
        this.f = str;
        this.g = arfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                i1g i1gVar = new i1g(this.e, this.f, this.g, n92Var, 0);
                i1gVar.d = obj;
                return i1gVar;
            default:
                i1g i1gVar2 = new i1g(this.e, this.f, this.g, n92Var, 1);
                i1gVar2.d = obj;
                return i1gVar2;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((i1g) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((i1g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        xbg xbgVar;
        switch (this.b) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i = this.c;
                if (i == 0) {
                    br7.v(obj);
                    xbg xbgVar2 = (xbg) this.d;
                    this.d = xbgVar2;
                    this.c = 1;
                    ycg ycgVarA = this.e.a(this.g);
                    if (ycgVarA != tb2Var) {
                        xbgVar = xbgVar2;
                        obj = ycgVarA;
                    }
                    return tb2Var;
                }
                if (i != 1) {
                    br7.v(obj);
                    return obj;
                }
                xbgVar = (xbg) this.d;
                br7.v(obj);
                this.d = null;
                this.c = 2;
                Object objInvoke = ((ycg) obj).a.invoke(xbgVar.a, this);
                if (objInvoke != tb2Var) {
                    return objInvoke;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                m1g m1gVar = this.e;
                try {
                } catch (Exception e) {
                    this.c = 2;
                    obj = m1gVar.f(e, this);
                    if (obj == tb2Var2) {
                        return tb2Var2;
                    }
                }
                if (i2 == 0) {
                    br7.v(obj);
                    fdg fdgVar = (fdg) this.d;
                    Integer num = new Integer(m1gVar.zza());
                    i1g i1gVar = new i1g(m1gVar, this.f, this.g, null, 0);
                    this.c = 1;
                    fdgVar.getClass();
                    obj = new wcg(37, i1gVar, num).a(fdgVar, this);
                    if (obj == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i2 != 1) {
                        br7.v(obj);
                        return (q1g) obj;
                    }
                    br7.v(obj);
                }
                return (q1g) obj;
        }
    }
}
