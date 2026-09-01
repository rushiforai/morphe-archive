package defpackage;

import com.medium.android.graphql.fragment.PageInfoData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ej7 extends p4d implements d55 {
    public int b;
    public /* synthetic */ PageInfoData c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public final /* synthetic */ fj7 f;
    public final /* synthetic */ int g;
    public final /* synthetic */ boolean h;
    public final /* synthetic */ c55 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ej7(fj7 fj7Var, int i, boolean z, c55 c55Var, n92 n92Var) {
        super(4, n92Var);
        this.f = fj7Var;
        this.g = i;
        this.h = z;
        this.i = c55Var;
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
            objA = this.f.a(this.g, pageInfoData, this.h, yd4Var, i, this.i, this);
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
        boolean z = this.h;
        c55 c55Var = this.i;
        ej7 ej7Var = new ej7(this.f, this.g, z, c55Var, (n92) obj4);
        ej7Var.c = (PageInfoData) obj;
        ej7Var.d = (yd4) obj2;
        ej7Var.e = iIntValue;
        return ej7Var.invokeSuspend(c1e.a);
    }
}
