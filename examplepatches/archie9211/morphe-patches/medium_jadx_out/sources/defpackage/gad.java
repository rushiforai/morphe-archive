package defpackage;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gad extends p4d implements d55 {
    public /* synthetic */ l2b b;
    public /* synthetic */ qz8 c;
    public /* synthetic */ boolean d;

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        l2b l2bVar = this.b;
        qz8 qz8Var = this.c;
        boolean z = this.d;
        br7.v(obj);
        boolean z2 = l2bVar instanceof i2b;
        boolean z3 = true;
        if (z2 || (qz8Var instanceof nz8)) {
            Throwable th = z2 ? ((i2b) l2bVar).a : qz8Var instanceof nz8 ? ((nz8) qz8Var).a : null;
            return new aad(th != null ? m4.I(th) : new w14(null, true), z);
        }
        if ((l2bVar instanceof k2b) && !(qz8Var instanceof oz8)) {
            return new bad(z);
        }
        if (qz8Var instanceof pz8) {
            l2bVar.getClass();
            return new z9d(((w7d) ((j2b) l2bVar).a).c, ey3.a, true, z);
        }
        l2bVar.getClass();
        w7d w7dVar = (w7d) ((j2b) l2bVar).a;
        qz8Var.getClass();
        oz8 oz8Var = (oz8) qz8Var;
        String str = w7dVar.c;
        List list = oz8Var.a;
        HashSet hashSet = new HashSet();
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : list) {
            if (hashSet.add(((dr9) obj2).a)) {
                arrayList.add(obj2);
            }
        }
        boolean z4 = oz8Var.c;
        if (!z && !oz8Var.d) {
            z3 = false;
        }
        return new z9d(str, arrayList, z4, z3);
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        gad gadVar = new gad(4, (n92) obj4);
        gadVar.b = (l2b) obj;
        gadVar.c = (qz8) obj2;
        gadVar.d = zBooleanValue;
        return gadVar.invokeSuspend(c1e.a);
    }
}
