package defpackage;

import com.medium.android.graphql.type.PagingOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class x85 extends p4d implements d55 {
    public int b;
    public /* synthetic */ PagingOptions c;
    public /* synthetic */ yd4 d;
    public final /* synthetic */ y85 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x85(y85 y85Var, n92 n92Var) {
        super(4, n92Var);
        this.e = y85Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        PagingOptions pagingOptions = this.c;
        yd4 yd4Var = this.d;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            this.c = null;
            this.d = null;
            this.b = 1;
            objA = this.e.a(pagingOptions, yd4Var, this);
            if (objA == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
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
        ((Number) obj3).intValue();
        x85 x85Var = new x85(this.e, (n92) obj4);
        x85Var.c = (PagingOptions) obj;
        x85Var.d = (yd4) obj2;
        return x85Var.invokeSuspend(c1e.a);
    }
}
