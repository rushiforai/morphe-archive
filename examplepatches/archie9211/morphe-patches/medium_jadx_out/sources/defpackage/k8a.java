package defpackage;

import com.medium.android.core.navigation.PublicationStatsReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class k8a extends p4d implements d55 {
    public int b;
    public /* synthetic */ String c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public final /* synthetic */ l8a f;
    public final /* synthetic */ PublicationStatsReference g;
    public final /* synthetic */ s9a h;
    public final /* synthetic */ xqc i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k8a(l8a l8aVar, PublicationStatsReference publicationStatsReference, s9a s9aVar, xqc xqcVar, n92 n92Var) {
        super(4, n92Var);
        this.f = l8aVar;
        this.g = publicationStatsReference;
        this.h = s9aVar;
        this.i = xqcVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        String str = this.c;
        yd4 yd4Var = this.d;
        int i = this.e;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i2 = this.b;
        if (i2 == 0) {
            br7.v(obj);
            if (str == null) {
                str = "";
            }
            this.c = null;
            this.d = null;
            this.e = i;
            this.b = 1;
            objA = this.f.a(this.g, this.h, str, i, this.i, yd4Var, this);
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
        s9a s9aVar = this.h;
        xqc xqcVar = this.i;
        k8a k8aVar = new k8a(this.f, this.g, s9aVar, xqcVar, (n92) obj4);
        k8aVar.c = (String) obj;
        k8aVar.d = (yd4) obj2;
        k8aVar.e = iIntValue;
        return k8aVar.invokeSuspend(c1e.a);
    }
}
