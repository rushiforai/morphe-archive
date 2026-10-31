package xk;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public final class s0 extends rg.m {
    public final void e(List list) {
        if (list instanceof Collection) {
            List list2 = list;
            d(list2.size() + this.f85892a);
            if (list2 instanceof q0) {
                this.f85892a = ((q0) list2).d(this.f85894c, this.f85892a);
                return;
            }
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            a(it.next());
        }
    }

    public final r2 f() {
        this.f85893b = true;
        return v0.k(this.f85892a, this.f85894c);
    }
}
