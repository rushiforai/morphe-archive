package xk;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Set;

/* loaded from: classes3.dex */
public final class a3 extends k1 {

    /* renamed from: h, reason: collision with root package name */
    public static final a3 f95859h;

    /* renamed from: g, reason: collision with root package name */
    public final transient v0 f95860g;

    static {
        l0 l0Var = v0.f96030b;
        f95859h = new a3(r2.f96007e, i2.f95937b);
    }

    public a3(v0 v0Var, Comparator comparator) {
        super(comparator);
        this.f95860g = v0Var;
    }

    @Override // xk.d1, xk.q0
    public final v0 c() {
        return this.f95860g;
    }

    @Override // java.util.NavigableSet
    public final Object ceiling(Object obj) {
        int iY = y(obj, true);
        v0 v0Var = this.f95860g;
        if (iY == v0Var.size()) {
            return null;
        }
        return v0Var.get(iY);
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj != null) {
            try {
                if (Collections.binarySearch(this.f95860g, obj, this.f95950d) >= 0) {
                    return true;
                }
            } catch (ClassCastException unused) {
            }
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean containsAll(Collection collection) {
        if (collection instanceof f2) {
            collection = ((f2) collection).a0();
        }
        Comparator comparator = this.f95950d;
        if (!w.k(comparator, collection) || collection.size() <= 1) {
            return super.containsAll(collection);
        }
        lh.h it = iterator();
        Iterator it2 = collection.iterator();
        a aVar = (a) it;
        if (!aVar.hasNext()) {
            return false;
        }
        Object next = it2.next();
        Object next2 = aVar.next();
        while (true) {
            try {
                int iCompare = comparator.compare(next2, next);
                if (iCompare < 0) {
                    if (!aVar.hasNext()) {
                        return false;
                    }
                    next2 = aVar.next();
                } else if (iCompare == 0) {
                    if (!it2.hasNext()) {
                        return true;
                    }
                    next = it2.next();
                } else if (iCompare > 0) {
                    return false;
                }
            } catch (ClassCastException | NullPointerException unused) {
                return false;
            }
        }
    }

    @Override // xk.q0
    public final int d(Object[] objArr, int i5) {
        return this.f95860g.d(objArr, i5);
    }

    @Override // java.util.NavigableSet
    public final Iterator descendingIterator() {
        return this.f95860g.u().listIterator(0);
    }

    @Override // xk.q0
    public final Object[] e() {
        return this.f95860g.e();
    }

    @Override // xk.d1, java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        Object next;
        Object next2;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Set)) {
            return false;
        }
        Set set = (Set) obj;
        if (this.f95860g.size() != set.size()) {
            return false;
        }
        if (isEmpty()) {
            return true;
        }
        Comparator comparator = this.f95950d;
        if (!w.k(comparator, set)) {
            return containsAll(set);
        }
        Iterator it = set.iterator();
        try {
            lh.h it2 = iterator();
            do {
                a aVar = (a) it2;
                if (!aVar.hasNext()) {
                    return true;
                }
                next = aVar.next();
                next2 = it.next();
                if (next2 == null) {
                    return false;
                }
            } while (comparator.compare(next, next2) == 0);
            return false;
        } catch (ClassCastException | NoSuchElementException unused) {
            return false;
        }
    }

    @Override // xk.q0
    public final int f() {
        return this.f95860g.f();
    }

    @Override // java.util.SortedSet
    public final Object first() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }
        return this.f95860g.get(0);
    }

    @Override // java.util.NavigableSet
    public final Object floor(Object obj) {
        int iX = x(obj, true) - 1;
        if (iX == -1) {
            return null;
        }
        return this.f95860g.get(iX);
    }

    @Override // xk.q0
    public final int g() {
        return this.f95860g.g();
    }

    @Override // xk.q0
    public final boolean h() {
        return this.f95860g.h();
    }

    @Override // java.util.NavigableSet
    public final Object higher(Object obj) {
        int iY = y(obj, false);
        v0 v0Var = this.f95860g;
        if (iY == v0Var.size()) {
            return null;
        }
        return v0Var.get(iY);
    }

    @Override // xk.q0
    /* renamed from: j */
    public final lh.h iterator() {
        return this.f95860g.listIterator(0);
    }

    @Override // java.util.SortedSet
    public final Object last() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }
        return this.f95860g.get(r0.size() - 1);
    }

    @Override // java.util.NavigableSet
    public final Object lower(Object obj) {
        int iX = x(obj, false) - 1;
        if (iX == -1) {
            return null;
        }
        return this.f95860g.get(iX);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f95860g.size();
    }

    public final a3 w(int i5, int i11) {
        v0 v0Var = this.f95860g;
        if (i5 == 0 && i11 == v0Var.size()) {
            return this;
        }
        Comparator comparator = this.f95950d;
        return i5 < i11 ? new a3(v0Var.subList(i5, i11), comparator) : k1.u(comparator);
    }

    public final int x(Object obj, boolean z11) {
        obj.getClass();
        int iBinarySearch = Collections.binarySearch(this.f95860g, obj, this.f95950d);
        return iBinarySearch >= 0 ? z11 ? iBinarySearch + 1 : iBinarySearch : ~iBinarySearch;
    }

    public final int y(Object obj, boolean z11) {
        obj.getClass();
        int iBinarySearch = Collections.binarySearch(this.f95860g, obj, this.f95950d);
        return iBinarySearch >= 0 ? z11 ? iBinarySearch : iBinarySearch + 1 : ~iBinarySearch;
    }
}
