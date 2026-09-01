package defpackage;

import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rb6 implements pj6 {
    public static final rb6 a = new rb6();
    public static final qb6 b = qb6.b;

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        ob6 ob6Var = (ob6) obj;
        ob6Var.getClass();
        k40.L(xtcVar);
        gc6 gc6Var = gc6.a;
        a0c a0cVar = gc6.b;
        a0cVar.getClass();
        q70 q70Var = new q70(a0cVar);
        List list = ob6Var.a;
        int size = list.size();
        xtc xtcVarA = xtcVar.a(q70Var);
        Iterator it2 = list.iterator();
        for (int i = 0; i < size; i++) {
            xtcVarA.o(q70Var, i, gc6Var, it2.next());
        }
        xtcVarA.s(q70Var);
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        k40.K(kw2Var);
        gc6 gc6Var = gc6.a;
        return new ob6((List) new r70().i(kw2Var));
    }
}
