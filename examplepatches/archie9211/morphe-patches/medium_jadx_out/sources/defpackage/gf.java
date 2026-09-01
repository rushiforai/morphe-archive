package defpackage;

import com.medium.android.graphql.type.PagingOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gf extends p4d implements d55 {
    public int b;
    public /* synthetic */ PagingOptions c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public final /* synthetic */ hf f;
    public final /* synthetic */ pf g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gf(hf hfVar, pf pfVar, n92 n92Var) {
        super(4, n92Var);
        this.f = hfVar;
        this.g = pfVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        PagingOptions pagingOptions = this.c;
        yd4 yd4Var = this.d;
        int i = this.e;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i2 = this.b;
        if (i2 == 0) {
            br7.v(obj);
            this.c = null;
            this.d = null;
            this.e = i;
            this.b = 1;
            objA = this.f.a(pagingOptions, yd4Var, this.g, i, this);
            if (objA == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i2 != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objA = ((bjb) obj).a;
        }
        return new bjb(objA);
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int iIntValue = ((Number) obj3).intValue();
        gf gfVar = new gf(this.f, this.g, (n92) obj4);
        gfVar.c = (PagingOptions) obj;
        gfVar.d = (yd4) obj2;
        gfVar.e = iIntValue;
        return gfVar.invokeSuspend(c1e.a);
    }
}
