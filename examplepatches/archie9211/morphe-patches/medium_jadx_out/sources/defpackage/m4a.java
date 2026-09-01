package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class m4a extends p4d implements e55 {
    public /* synthetic */ String b;
    public /* synthetic */ List c;
    public /* synthetic */ List d;
    public /* synthetic */ boolean e;
    public final /* synthetic */ n4a f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m4a(n4a n4aVar, n92 n92Var) {
        super(5, n92Var);
        this.f = n4aVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        List list;
        String str = this.b;
        List list2 = this.c;
        List list3 = this.d;
        boolean z = this.e;
        br7.v(obj);
        if (str.length() == 0) {
            list = ey3.a;
        } else {
            ArrayList arrayList = new ArrayList();
            for (Object obj2 : list3) {
                if (!list2.contains((String) obj2)) {
                    arrayList.add(obj2);
                }
            }
            ArrayList arrayList2 = new ArrayList();
            for (Object obj3 : arrayList) {
                if (tuc.N((String) obj3, str, true)) {
                    arrayList2.add(obj3);
                }
            }
            list = arrayList2;
        }
        return new l4a(str, list, list2, z, this.f.c);
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        boolean zBooleanValue = ((Boolean) obj4).booleanValue();
        m4a m4aVar = new m4a(this.f, (n92) obj5);
        m4aVar.b = (String) obj;
        m4aVar.c = (List) obj2;
        m4aVar.d = (List) obj3;
        m4aVar.e = zBooleanValue;
        return m4aVar.invokeSuspend(c1e.a);
    }
}
