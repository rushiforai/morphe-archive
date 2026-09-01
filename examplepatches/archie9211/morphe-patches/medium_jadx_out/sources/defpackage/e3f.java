package defpackage;

import com.medium.android.graphql.fragment.PageInfoData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e3f extends p4d implements d55 {
    public int b;
    public /* synthetic */ PageInfoData c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public final /* synthetic */ f3f f;
    public final /* synthetic */ String g;
    public final /* synthetic */ int h;
    public final /* synthetic */ c55 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e3f(f3f f3fVar, String str, int i, c55 c55Var, n92 n92Var) {
        super(4, n92Var);
        this.f = f3fVar;
        this.g = str;
        this.h = i;
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
            objA = this.f.a(this.g, this.h, pageInfoData, yd4Var, this.i, i, this);
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
        int i = this.h;
        c55 c55Var = this.i;
        e3f e3fVar = new e3f(this.f, this.g, i, c55Var, (n92) obj4);
        e3fVar.c = (PageInfoData) obj;
        e3fVar.d = (yd4) obj2;
        e3fVar.e = iIntValue;
        return e3fVar.invokeSuspend(c1e.a);
    }
}
