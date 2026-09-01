package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pb6 extends dc6 implements Iterable {
    public final ArrayList a;

    public pb6() {
        this.a = new ArrayList();
    }

    @Override // defpackage.dc6
    public final int d() {
        return q().d();
    }

    public final boolean equals(Object obj) {
        if (obj != this) {
            return (obj instanceof pb6) && ((pb6) obj).a.equals(this.a);
        }
        return true;
    }

    @Override // defpackage.dc6
    public final long f() {
        return q().f();
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return this.a.iterator();
    }

    @Override // defpackage.dc6
    public final String m() {
        return q().m();
    }

    public final void p(dc6 dc6Var) {
        if (dc6Var == null) {
            dc6Var = pc6.a;
        }
        this.a.add(dc6Var);
    }

    public final dc6 q() {
        ArrayList arrayList = this.a;
        int size = arrayList.size();
        if (size == 1) {
            return (dc6) arrayList.get(0);
        }
        ygf.f(b09.w(size, "Array must have size 1, but has size "));
        return null;
    }

    public pb6(int i) {
        this.a = new ArrayList(i);
    }
}
