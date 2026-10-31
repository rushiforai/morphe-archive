package mh;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Set;

/* loaded from: classes3.dex */
public final class w extends p {

    /* renamed from: g, reason: collision with root package name */
    public static final w f76396g;

    /* renamed from: f, reason: collision with root package name */
    public final transient j f76397f;

    static {
        g gVar = j.f76346b;
        f76396g = new w(u.f76380e, s.f76375b);
    }

    public w(j jVar, Comparator comparator) {
        super(comparator);
        this.f76397f = jVar;
    }

    @Override // mh.f
    public final int b(Object[] objArr) {
        return this.f76397f.b(objArr);
    }

    @Override // mh.f
    public final int c() {
        return this.f76397f.c();
    }

    @Override // java.util.NavigableSet
    public final Object ceiling(Object obj) {
        int iO = o(obj, true);
        j jVar = this.f76397f;
        if (iO == jVar.size()) {
            return null;
        }
        return jVar.get(iO);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj != null) {
            try {
                if (Collections.binarySearch(this.f76397f, obj, this.f76367d) >= 0) {
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
        if (collection instanceof r) {
            collection = ((r) collection).zza();
        }
        Comparator comparator = this.f76367d;
        if (!a.i(comparator, collection) || collection.size() <= 1) {
            return super.containsAll(collection);
        }
        g gVarListIterator = this.f76397f.listIterator(0);
        Iterator it = collection.iterator();
        if (gVarListIterator.hasNext()) {
            Object next = it.next();
            Object next2 = gVarListIterator.next();
            while (true) {
                try {
                    int iCompare = comparator.compare(next2, next);
                    if (iCompare >= 0) {
                        if (iCompare != 0) {
                            break;
                        }
                        if (!it.hasNext()) {
                            return true;
                        }
                        next = it.next();
                    } else {
                        if (!gVarListIterator.hasNext()) {
                            break;
                        }
                        next2 = gVarListIterator.next();
                    }
                } catch (ClassCastException | NullPointerException unused) {
                }
            }
        }
        return false;
    }

    @Override // mh.f
    public final int d() {
        return this.f76397f.d();
    }

    @Override // java.util.NavigableSet
    public final Iterator descendingIterator() {
        return this.f76397f.g().listIterator(0);
    }

    @Override // mh.f
    public final a0 e() {
        return this.f76397f.listIterator(0);
    }

    @Override // mh.l, java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof Set) {
            Set set = (Set) obj;
            j jVar = this.f76397f;
            if (jVar.size() == set.size()) {
                if (isEmpty()) {
                    return true;
                }
                Comparator comparator = this.f76367d;
                if (!a.i(comparator, set)) {
                    return containsAll(set);
                }
                Iterator it = set.iterator();
                try {
                    g gVarListIterator = jVar.listIterator(0);
                    while (gVarListIterator.hasNext()) {
                        Object next = gVarListIterator.next();
                        Object next2 = it.next();
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

    @Override // mh.f
    public final Object[] f() {
        return this.f76397f.f();
    }

    @Override // mh.p, java.util.SortedSet
    public final Object first() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }
        return this.f76397f.get(0);
    }

    @Override // java.util.NavigableSet
    public final Object floor(Object obj) {
        int iN = n(obj, true) - 1;
        if (iN == -1) {
            return null;
        }
        return this.f76397f.get(iN);
    }

    @Override // mh.l
    public final j g() {
        return this.f76397f;
    }

    @Override // java.util.NavigableSet
    public final Object higher(Object obj) {
        int iO = o(obj, false);
        j jVar = this.f76397f;
        if (iO == jVar.size()) {
            return null;
        }
        return jVar.get(iO);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set, java.util.NavigableSet
    public final /* synthetic */ Iterator iterator() {
        return this.f76397f.listIterator(0);
    }

    @Override // mh.p, java.util.SortedSet
    public final Object last() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }
        return this.f76397f.get(r0.size() - 1);
    }

    @Override // java.util.NavigableSet
    public final Object lower(Object obj) {
        int iN = n(obj, false) - 1;
        if (iN == -1) {
            return null;
        }
        return this.f76397f.get(iN);
    }

    public final int n(Object obj, boolean z11) {
        obj.getClass();
        int iBinarySearch = Collections.binarySearch(this.f76397f, obj, this.f76367d);
        return iBinarySearch >= 0 ? z11 ? iBinarySearch + 1 : iBinarySearch : ~iBinarySearch;
    }

    public final int o(Object obj, boolean z11) {
        obj.getClass();
        int iBinarySearch = Collections.binarySearch(this.f76397f, obj, this.f76367d);
        return iBinarySearch >= 0 ? z11 ? iBinarySearch : iBinarySearch + 1 : ~iBinarySearch;
    }

    public final w p(int i5, int i11) {
        j jVar = this.f76397f;
        if (i5 == 0) {
            if (i11 == jVar.size()) {
                return this;
            }
            i5 = 0;
        }
        Comparator comparator = this.f76367d;
        return i5 < i11 ? new w(jVar.subList(i5, i11), comparator) : p.l(comparator);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f76397f.size();
    }
}
