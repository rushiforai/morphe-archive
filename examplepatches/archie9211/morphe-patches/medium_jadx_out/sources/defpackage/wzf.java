package defpackage;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wzf extends ryf {
    public static final wzf k;
    public final transient ayf j;

    static {
        hxf hxfVar = ayf.f;
        k = new wzf(hzf.i, czf.b);
    }

    public wzf(ayf ayfVar, Comparator comparator) {
        super(comparator);
        this.j = ayfVar;
    }

    @Override // defpackage.fyf
    public final ayf A() {
        return this.j;
    }

    public final int F(Object obj, boolean z) {
        obj.getClass();
        int iBinarySearch = Collections.binarySearch(this.j, obj, this.h);
        return iBinarySearch >= 0 ? z ? iBinarySearch + 1 : iBinarySearch : ~iBinarySearch;
    }

    public final int G(Object obj, boolean z) {
        obj.getClass();
        int iBinarySearch = Collections.binarySearch(this.j, obj, this.h);
        return iBinarySearch >= 0 ? z ? iBinarySearch : iBinarySearch + 1 : ~iBinarySearch;
    }

    public final wzf H(int i, int i2) {
        ayf ayfVar = this.j;
        if (i == 0) {
            if (i2 == ayfVar.size()) {
                return this;
            }
            i = 0;
        }
        Comparator comparator = this.h;
        return i < i2 ? new wzf(ayfVar.subList(i, i2), comparator) : ryf.E(comparator);
    }

    @Override // java.util.NavigableSet
    public final Object ceiling(Object obj) {
        int iG = G(obj, true);
        ayf ayfVar = this.j;
        if (iG == ayfVar.size()) {
            return null;
        }
        return ayfVar.get(iG);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj != null) {
            try {
                if (Collections.binarySearch(this.j, obj, this.h) >= 0) {
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
        if (collection instanceof azf) {
            collection = ((azf) collection).zza();
        }
        Comparator comparator = this.h;
        if (!ok7.N(comparator, collection) || collection.size() <= 1) {
            return super.containsAll(collection);
        }
        hxf hxfVarListIterator = this.j.listIterator(0);
        Iterator it2 = collection.iterator();
        if (hxfVarListIterator.hasNext()) {
            Object next = it2.next();
            Object next2 = hxfVarListIterator.next();
            while (true) {
                try {
                    int iCompare = comparator.compare(next2, next);
                    if (iCompare >= 0) {
                        if (iCompare != 0) {
                            break;
                        }
                        if (!it2.hasNext()) {
                            return true;
                        }
                        next = it2.next();
                    } else {
                        if (!hxfVarListIterator.hasNext()) {
                            break;
                        }
                        next2 = hxfVarListIterator.next();
                    }
                } catch (ClassCastException | NullPointerException unused) {
                }
            }
        }
        return false;
    }

    @Override // java.util.NavigableSet
    public final Iterator descendingIterator() {
        return this.j.y().listIterator(0);
    }

    @Override // defpackage.fyf, java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof Set) {
            Set set = (Set) obj;
            ayf ayfVar = this.j;
            if (ayfVar.size() == set.size()) {
                if (isEmpty()) {
                    return true;
                }
                Comparator comparator = this.h;
                if (!ok7.N(comparator, set)) {
                    return containsAll(set);
                }
                Iterator it2 = set.iterator();
                try {
                    hxf hxfVarListIterator = ayfVar.listIterator(0);
                    while (hxfVarListIterator.hasNext()) {
                        Object next = hxfVarListIterator.next();
                        Object next2 = it2.next();
                        if (next2 == null || comparator.compare(next, next2) != 0) {
                        }
                    }
                    return true;
                } catch (ClassCastException | NoSuchElementException unused) {
                }
            }
        }
        return false;
    }

    @Override // defpackage.ryf, java.util.SortedSet
    public final Object first() {
        if (!isEmpty()) {
            return this.j.get(0);
        }
        ywb.n();
        return null;
    }

    @Override // java.util.NavigableSet
    public final Object floor(Object obj) {
        int iF = F(obj, true) - 1;
        if (iF == -1) {
            return null;
        }
        return this.j.get(iF);
    }

    @Override // java.util.NavigableSet
    public final Object higher(Object obj) {
        int iG = G(obj, false);
        ayf ayfVar = this.j;
        if (iG == ayfVar.size()) {
            return null;
        }
        return ayfVar.get(iG);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set, java.util.NavigableSet
    public final /* synthetic */ Iterator iterator() {
        return this.j.listIterator(0);
    }

    @Override // defpackage.ryf, java.util.SortedSet
    public final Object last() {
        if (isEmpty()) {
            ywb.n();
            return null;
        }
        return this.j.get(r1.size() - 1);
    }

    @Override // java.util.NavigableSet
    public final Object lower(Object obj) {
        int iF = F(obj, false) - 1;
        if (iF == -1) {
            return null;
        }
        return this.j.get(iF);
    }

    @Override // defpackage.ogf
    public final int q(Object[] objArr) {
        return this.j.q(objArr);
    }

    @Override // defpackage.ogf
    public final int r() {
        return this.j.r();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.j.size();
    }

    @Override // defpackage.ogf
    public final int t() {
        return this.j.t();
    }

    @Override // defpackage.ogf
    public final ugf v() {
        return this.j.listIterator(0);
    }

    @Override // defpackage.ogf
    public final Object[] w() {
        return this.j.w();
    }
}
