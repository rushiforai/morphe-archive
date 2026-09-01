package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eyf extends p4d implements b55 {
    public final /* synthetic */ int b;
    public xbg c;
    public int d;
    public final /* synthetic */ xbg e;
    public final /* synthetic */ nig f;
    public final /* synthetic */ long g;
    public final /* synthetic */ jrf h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ eyf(xbg xbgVar, nig nigVar, long j, jrf jrfVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = xbgVar;
        this.f = nigVar;
        this.g = j;
        this.h = jrfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new eyf(this.e, this.f, this.g, this.h, n92Var, 0);
            default:
                return new eyf(this.e, this.f, this.g, this.h, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((eyf) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        nig nigVar = this.f;
        xbg xbgVar = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.d;
                if (i2 == 0) {
                    br7.v(obj);
                    nec necVar = (nec) nigVar.b;
                    this.c = xbgVar;
                    this.d = 1;
                    obj = new ycg(new m0(necVar, this.g, this.h, (n92) null, 6));
                    if (obj != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                xbgVar = this.c;
                br7.v(obj);
                this.c = null;
                this.d = 2;
                if (((ycg) obj).a.invoke(xbgVar.a, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.d;
                if (i3 == 0) {
                    br7.v(obj);
                    eoc eocVar = (eoc) nigVar.a;
                    this.c = xbgVar;
                    this.d = 1;
                    obj = eocVar.b(this.g, this.h);
                    if (obj != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                xbgVar = this.c;
                br7.v(obj);
                this.c = null;
                this.d = 2;
                if (((wcg) obj).a(xbgVar.a, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
