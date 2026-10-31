package q6;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import p1.e1;
import p1.s2;
import p6.e0;
import p6.n0;
import p6.y0;
import p6.z0;
import w70.i2;
import w70.o1;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0002B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lq6/i;", "Lp6/z0;", "Lq6/h;", "<init>", "()V", "navigation-compose_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
@y0("composable")
/* loaded from: classes2.dex */
public final class i extends z0 {

    /* renamed from: c, reason: collision with root package name */
    public final e1 f83696c = androidx.compose.runtime.d.k(Boolean.FALSE);

    @Override // p6.z0
    public final e0 a() {
        return new h(this, c.f83692a);
    }

    @Override // p6.z0
    public final void d(List list, n0 n0Var) {
        Iterator it = list.iterator();
        while (it.hasNext()) {
            p6.n backStackEntry = (p6.n) it.next();
            p6.o oVarB = b();
            o1 o1Var = oVarB.f82215e;
            Intrinsics.g(backStackEntry, "backStackEntry");
            i2 i2Var = oVarB.f82213c;
            Iterable iterable = (Iterable) i2Var.getValue();
            if (!(iterable instanceof Collection) || !((Collection) iterable).isEmpty()) {
                Iterator it2 = iterable.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    if (((p6.n) it2.next()) == backStackEntry) {
                        Iterable iterable2 = (Iterable) o1Var.f93973a.getValue();
                        if (!(iterable2 instanceof Collection) || !((Collection) iterable2).isEmpty()) {
                            Iterator it3 = iterable2.iterator();
                            while (it3.hasNext()) {
                                if (((p6.n) it3.next()) == backStackEntry) {
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            p6.n nVar = (p6.n) b70.g.i1((List) o1Var.f93973a.getValue());
            if (nVar != null) {
                i2Var.k(null, b70.n.c0((Set) i2Var.getValue(), nVar));
            }
            i2Var.k(null, b70.n.c0((Set) i2Var.getValue(), backStackEntry));
            oVarB.f(backStackEntry);
        }
        ((s2) this.f83696c).setValue(Boolean.FALSE);
    }

    @Override // p6.z0
    public final void e(p6.n nVar, boolean z11) {
        b().e(nVar, z11);
        ((s2) this.f83696c).setValue(Boolean.TRUE);
    }

    public final void g(p6.n entry) {
        p6.o oVarB = b();
        Intrinsics.g(entry, "entry");
        i2 i2Var = oVarB.f82213c;
        i2Var.k(null, b70.n.c0((Set) i2Var.getValue(), entry));
        if (!oVarB.f82218h.f82258g.contains(entry)) {
            throw new IllegalStateException("Cannot transition entry that is not in the back stack");
        }
        entry.b(h6.t.f59443d);
    }
}
