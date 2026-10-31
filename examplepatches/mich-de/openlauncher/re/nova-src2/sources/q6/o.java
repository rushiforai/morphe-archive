package q6;

import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;
import p6.e0;
import p6.n0;
import p6.y0;
import p6.z0;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0002B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lq6/o;", "Lp6/z0;", "Lq6/n;", "<init>", "()V", "navigation-compose_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
@y0("dialog")
/* loaded from: classes2.dex */
public final class o extends z0 {
    @Override // p6.z0
    public final e0 a() {
        x1.e eVar = e.f83694a;
        return new n(this);
    }

    @Override // p6.z0
    public final void d(List list, n0 n0Var) {
        Iterator it = list.iterator();
        while (it.hasNext()) {
            b().f((p6.n) it.next());
        }
    }

    @Override // p6.z0
    public final void e(p6.n nVar, boolean z11) {
        b().e(nVar, z11);
        int iA1 = b70.g.a1((Iterable) b().f82216f.f93973a.getValue(), nVar);
        int i5 = 0;
        for (Object obj : (Iterable) b().f82216f.f93973a.getValue()) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            p6.n nVar2 = (p6.n) obj;
            if (i5 > iA1) {
                b().b(nVar2);
            }
            i5 = i11;
        }
    }
}
