package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ks6 implements zx8 {
    public final n0c a;
    public final r67 b;

    public ks6(k96 k96Var) {
        this.a = new n0c(k96Var, u3b.m, new t16(null));
        this.b = new r67(k96Var.a, new ConcurrentHashMap(3, 1.0f, 2), new zkc(26), 0);
    }

    @Override // defpackage.zx8
    public final boolean a(y05 y05Var) {
        y05Var.getClass();
        return false;
    }

    @Override // defpackage.zx8
    public final void b(y05 y05Var, ArrayList arrayList) {
        y05Var.getClass();
        arrayList.add(c(y05Var));
    }

    public final js6 c(y05 y05Var) {
        y05Var.getClass();
        Object objInvoke = this.b.invoke(new s67(y05Var, new a3(this, new a1b(y05Var), false, 18)));
        if (objInvoke != null) {
            return (js6) objInvoke;
        }
        r67.a(3);
        throw null;
    }

    @Override // defpackage.zx8
    public final Collection k(y05 y05Var, x45 x45Var) {
        y05Var.getClass();
        List list = (List) c(y05Var).l.invoke();
        return list == null ? ey3.a : list;
    }

    public final String toString() {
        return "LazyJavaPackageFragmentProvider of module " + ((k96) this.a.b).h;
    }
}
