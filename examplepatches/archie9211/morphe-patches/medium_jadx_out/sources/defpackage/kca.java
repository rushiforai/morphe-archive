package defpackage;

import java.io.Serializable;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kca extends p4d implements g55 {
    public /* synthetic */ Object b;
    public /* synthetic */ Integer c;
    public /* synthetic */ rba d;
    public /* synthetic */ zba e;
    public /* synthetic */ String f;
    public /* synthetic */ List g;

    public kca(n92 n92Var) {
        super(7, n92Var);
    }

    @Override // defpackage.g55
    public final Object e(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Serializable serializable) {
        Object obj7 = ((bjb) obj).a;
        kca kcaVar = new kca((n92) serializable);
        kcaVar.b = obj7;
        kcaVar.c = (Integer) obj2;
        kcaVar.d = (rba) obj3;
        kcaVar.e = (zba) obj4;
        kcaVar.f = (String) obj5;
        kcaVar.g = (List) obj6;
        return kcaVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object obj2 = this.b;
        Integer num = this.c;
        rba rbaVar = this.d;
        zba zbaVar = this.e;
        String str = this.f;
        List list = this.g;
        br7.v(obj);
        Throwable thB = bjb.b(obj2);
        if (thB == null) {
            return new aca((List) obj2, num, rbaVar, list, str, zbaVar);
        }
        wld.a.e(thB, "Failed to get publication timeline", new Object[0]);
        return bca.a;
    }
}
