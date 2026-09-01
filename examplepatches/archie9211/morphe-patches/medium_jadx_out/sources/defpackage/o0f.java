package defpackage;

import com.medium.android.graphql.type.PagingOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o0f extends p4d implements d55 {
    public int b;
    public /* synthetic */ PagingOptions c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public final /* synthetic */ p0f f;
    public final /* synthetic */ String g;
    public final /* synthetic */ pxc h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o0f(p0f p0fVar, String str, pxc pxcVar, n92 n92Var) {
        super(4, n92Var);
        this.f = p0fVar;
        this.g = str;
        this.h = pxcVar;
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
            if (pagingOptions == null) {
                ay0.e("Required value was null.");
                return null;
            }
            this.c = null;
            this.d = null;
            this.e = i;
            this.b = 1;
            objA = this.f.a(this.g, pagingOptions, yd4Var, i, this.h, this);
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
        String str = this.g;
        pxc pxcVar = this.h;
        o0f o0fVar = new o0f(this.f, str, pxcVar, (n92) obj4);
        o0fVar.c = (PagingOptions) obj;
        o0fVar.d = (yd4) obj2;
        o0fVar.e = iIntValue;
        return o0fVar.invokeSuspend(c1e.a);
    }
}
