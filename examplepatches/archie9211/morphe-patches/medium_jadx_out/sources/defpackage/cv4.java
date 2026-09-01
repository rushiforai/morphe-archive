package defpackage;

import com.medium.android.graphql.fragment.PageInfoData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cv4 extends p4d implements d55 {
    public int b;
    public /* synthetic */ PageInfoData c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public final /* synthetic */ dv4 f;
    public final /* synthetic */ gef g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cv4(dv4 dv4Var, gef gefVar, n92 n92Var) {
        super(4, n92Var);
        this.f = dv4Var;
        this.g = gefVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        PageInfoData pageInfoData = this.c;
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
            objA = this.f.a(pageInfoData, yd4Var, i, this.g, this);
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
        cv4 cv4Var = new cv4(this.f, this.g, (n92) obj4);
        cv4Var.c = (PageInfoData) obj;
        cv4Var.d = (yd4) obj2;
        cv4Var.e = iIntValue;
        return cv4Var.invokeSuspend(c1e.a);
    }
}
