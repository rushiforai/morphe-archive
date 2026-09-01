package defpackage;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dj4 extends p4d implements f55 {
    public /* synthetic */ qz8 b;
    public /* synthetic */ boolean c;
    public /* synthetic */ boolean d;
    public /* synthetic */ boolean e;
    public /* synthetic */ boolean f;
    public final /* synthetic */ fj4 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dj4(fj4 fj4Var, n92 n92Var) {
        super(6, n92Var);
        this.g = fj4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        qz8 qz8Var = this.b;
        boolean z = this.c;
        boolean z2 = this.d;
        boolean z3 = this.e;
        boolean z4 = this.f;
        br7.v(obj);
        boolean z5 = qz8Var instanceof pz8;
        if (z5 && z3) {
            return ui4.a;
        }
        if (z5) {
            return pi4.a;
        }
        if (qz8Var instanceof nz8) {
            return new oi4(m4.I(((nz8) qz8Var).a));
        }
        if (!(qz8Var instanceof oz8)) {
            ygf.a();
            return null;
        }
        oz8 oz8Var = (oz8) qz8Var;
        List list = oz8Var.a;
        if (list.isEmpty()) {
            return new vi4(z4);
        }
        si4 ri4Var = (list.size() > 100 || oz8Var.b) ? new ri4() : new qi4(list.size());
        HashSet hashSet = new HashSet();
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : list) {
            if (hashSet.add(((hne) obj2).a)) {
                arrayList.add(obj2);
            }
        }
        return new ti4(ri4Var, arrayList, oz8Var.d, oz8Var.c, z2, z, z4, this.g.A);
    }

    @Override // defpackage.f55
    public final Object p(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        boolean zBooleanValue = ((Boolean) obj2).booleanValue();
        boolean zBooleanValue2 = ((Boolean) obj3).booleanValue();
        boolean zBooleanValue3 = ((Boolean) obj4).booleanValue();
        boolean zBooleanValue4 = ((Boolean) obj5).booleanValue();
        dj4 dj4Var = new dj4(this.g, (n92) obj6);
        dj4Var.b = (qz8) obj;
        dj4Var.c = zBooleanValue;
        dj4Var.d = zBooleanValue2;
        dj4Var.e = zBooleanValue3;
        dj4Var.f = zBooleanValue4;
        return dj4Var.invokeSuspend(c1e.a);
    }
}
