package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class y1 extends k1 {
    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    @Override // defpackage.t0, java.util.Collection
    public final boolean containsAll(Collection collection) {
        Collection collection2 = collection;
        if ((collection2 instanceof Collection) && collection2.isEmpty()) {
            return true;
        }
        Iterator it2 = collection2.iterator();
        while (it2.hasNext()) {
            if (!contains(it2.next())) {
                return false;
            }
        }
        return true;
    }

    public abstract y1 d(int i, Object obj);

    public abstract y1 f(Object obj);

    @Override // defpackage.k1, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // defpackage.k1, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    public y1 m(Collection collection) {
        x89 x89VarP = p();
        x89VarP.addAll(collection);
        return x89VarP.d();
    }

    public abstract x89 p();

    public abstract y1 q(w1 w1Var);

    public abstract y1 r(int i);

    public abstract y1 s(int i, Object obj);

    @Override // defpackage.k1, java.util.List
    public final List subList(int i, int i2) {
        return new zy5(this, i, i2);
    }
}
