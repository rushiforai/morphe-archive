package defpackage;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ibb extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ qz8 c;
    public /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ibb(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 3;
        qz8 qz8Var = (qz8) obj;
        bjb bjbVar = (bjb) obj2;
        switch (i) {
            case 0:
                Object obj4 = bjbVar.a;
                ibb ibbVar = new ibb(i2, 0, (n92) obj3);
                ibbVar.c = qz8Var;
                ibbVar.d = obj4;
                return ibbVar.invokeSuspend(c1eVar);
            default:
                Object obj5 = bjbVar.a;
                ibb ibbVar2 = new ibb(i2, 1, (n92) obj3);
                ibbVar2.c = qz8Var;
                ibbVar2.d = obj5;
                return ibbVar2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Long l;
        Long l2;
        switch (this.b) {
            case 0:
                qz8 qz8Var = this.c;
                Object obj2 = this.d;
                br7.v(obj);
                if (obj2 instanceof ajb) {
                    obj2 = null;
                }
                Integer num = (Integer) obj2;
                if (!(qz8Var instanceof nz8)) {
                    if (!(qz8Var instanceof pz8)) {
                        if (qz8Var instanceof oz8) {
                            oz8 oz8Var = (oz8) qz8Var;
                            boolean z = oz8Var.c;
                            boolean z2 = oz8Var.d;
                            List list = oz8Var.a;
                            HashSet hashSet = new HashSet();
                            ArrayList arrayList = new ArrayList();
                            for (Object obj3 : list) {
                                if (hashSet.add(((dab) obj3).getKey())) {
                                    arrayList.add(obj3);
                                }
                            }
                        } else {
                            ygf.a();
                        }
                    }
                }
                break;
            default:
                qz8 qz8Var2 = this.c;
                Object obj4 = this.d;
                br7.v(obj);
                if (obj4 instanceof ajb) {
                    obj4 = null;
                }
                r3e r3eVar = (r3e) obj4;
                if (!(qz8Var2 instanceof nz8)) {
                    if (!(qz8Var2 instanceof pz8)) {
                        if (qz8Var2 instanceof oz8) {
                            Long l3 = (r3eVar == null || (l2 = r3eVar.a) == null || l2.longValue() <= 0) ? null : l2;
                            Long l4 = (r3eVar == null || (l = r3eVar.b) == null || l.longValue() <= 0) ? null : l;
                            oz8 oz8Var2 = (oz8) qz8Var2;
                            boolean z3 = oz8Var2.c;
                            boolean z4 = oz8Var2.d;
                            List list2 = oz8Var2.a;
                            HashSet hashSet2 = new HashSet();
                            ArrayList arrayList2 = new ArrayList();
                            for (Object obj5 : list2) {
                                if (hashSet2.add(((hne) obj5).a)) {
                                    arrayList2.add(obj5);
                                }
                            }
                        } else {
                            ygf.a();
                        }
                    }
                }
                break;
        }
        return null;
    }
}
