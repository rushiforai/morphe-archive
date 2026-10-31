package xk;

import java.util.AbstractCollection;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/* loaded from: classes.dex */
public abstract class t extends AbstractCollection implements f2 {

    /* renamed from: a, reason: collision with root package name */
    public transient d f96012a;

    /* renamed from: b, reason: collision with root package name */
    public transient s f96013b;

    @Override // xk.f2
    public final Set a0() {
        d dVar = this.f96012a;
        if (dVar != null) {
            return dVar;
        }
        d dVar2 = new d(this, 1);
        this.f96012a = dVar2;
        return dVar2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean add(Object obj) {
        ((n0) this).b(1, obj);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean addAll(Collection collection) {
        collection.getClass();
        if (collection instanceof f2) {
            f2 f2Var = (f2) collection;
            if (f2Var instanceof n0) {
                n0 n0Var = (n0) f2Var;
                if (!n0Var.isEmpty()) {
                    k2 k2Var = n0Var.f95973c;
                    int i5 = k2Var.f95954c == 0 ? -1 : 0;
                    while (i5 >= 0) {
                        vk.b0.e(i5, k2Var.f95954c);
                        ((n0) this).b(k2Var.b(i5), k2Var.f95952a[i5]);
                        i5++;
                        if (i5 >= k2Var.f95954c) {
                            i5 = -1;
                        }
                    }
                    return true;
                }
            } else if (!f2Var.isEmpty()) {
                Iterator it = f2Var.entrySet().iterator();
                while (it.hasNext()) {
                    j2 j2Var = (j2) ((e2) it.next());
                    ((n0) this).b(j2Var.a(), j2Var.b());
                }
                return true;
            }
        } else if (!collection.isEmpty()) {
            return v4.a.b(this, collection.iterator());
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        return ((n0) this).f95973c.a(obj) > 0;
    }

    @Override // xk.f2
    public final Set entrySet() {
        s sVar = this.f96013b;
        if (sVar != null) {
            return sVar;
        }
        s sVar2 = new s(this);
        this.f96013b = sVar2;
        return sVar2;
    }

    @Override // java.util.Collection
    public final boolean equals(Object obj) {
        return w.b.i(this, obj);
    }

    @Override // java.util.Collection
    public final int hashCode() {
        return ((AbstractSet) entrySet()).hashCode();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean isEmpty() {
        return ((AbstractCollection) entrySet()).isEmpty();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean remove(Object obj) {
        return ((n0) this).d(1, obj) > 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean removeAll(Collection collection) {
        if (collection instanceof f2) {
            collection = ((f2) collection).a0();
        }
        return w.x((g3) a0(), collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean retainAll(Collection collection) {
        collection.getClass();
        if (collection instanceof f2) {
            collection = ((f2) collection).a0();
        }
        return ((g3) a0()).retainAll(collection);
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return entrySet().toString();
    }
}
