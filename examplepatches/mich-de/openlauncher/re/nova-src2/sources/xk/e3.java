package xk;

import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.RandomAccess;
import java.util.Set;

/* loaded from: classes3.dex */
public class e3 extends AbstractCollection implements Set {

    /* renamed from: a, reason: collision with root package name */
    public final Set f95904a;

    /* renamed from: b, reason: collision with root package name */
    public final vk.m f95905b;

    public e3(Set set, vk.m mVar) {
        this.f95904a = set;
        this.f95905b = mVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        vk.b0.c(this.f95905b.apply(obj));
        return this.f95904a.add(obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean addAll(Collection collection) {
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            vk.b0.c(this.f95905b.apply(it.next()));
        }
        return this.f95904a.addAll(collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        Set set = this.f95904a;
        boolean z11 = set instanceof RandomAccess;
        vk.m mVar = this.f95905b;
        if (!z11 || !(set instanceof List)) {
            Iterator it = set.iterator();
            mVar.getClass();
            while (it.hasNext()) {
                if (mVar.apply(it.next())) {
                    it.remove();
                }
            }
            return;
        }
        List list = (List) set;
        mVar.getClass();
        int i5 = 0;
        for (int i11 = 0; i11 < list.size(); i11++) {
            Object obj = list.get(i11);
            if (!mVar.apply(obj)) {
                if (i11 > i5) {
                    try {
                        list.set(i5, obj);
                    } catch (IllegalArgumentException unused) {
                        v30.e.t(list, mVar, i5, i11);
                        return;
                    } catch (UnsupportedOperationException unused2) {
                        v30.e.t(list, mVar, i5, i11);
                        return;
                    }
                }
                i5++;
            }
        }
        list.subList(i5, list.size()).clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        boolean zContains;
        Set set = this.f95904a;
        set.getClass();
        try {
            zContains = set.contains(obj);
        } catch (ClassCastException | NullPointerException unused) {
            zContains = false;
        }
        if (zContains) {
            return this.f95905b.apply(obj);
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean containsAll(Collection collection) {
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        return w.h(this, obj);
    }

    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        return w.l(this);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        Iterator it = this.f95904a.iterator();
        vk.m mVar = this.f95905b;
        vk.b0.g(mVar, "predicate");
        int i5 = 0;
        while (true) {
            if (!it.hasNext()) {
                i5 = -1;
                break;
            }
            if (mVar.apply(it.next())) {
                break;
            }
            i5++;
        }
        return true ^ (i5 != -1);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        Iterator it = this.f95904a.iterator();
        it.getClass();
        vk.m mVar = this.f95905b;
        mVar.getClass();
        return new n1(it, mVar);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        return contains(obj) && this.f95904a.remove(obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean removeAll(Collection collection) {
        Iterator it = this.f95904a.iterator();
        boolean z11 = false;
        while (it.hasNext()) {
            Object next = it.next();
            if (this.f95905b.apply(next) && collection.contains(next)) {
                it.remove();
                z11 = true;
            }
        }
        return z11;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean retainAll(Collection collection) {
        Iterator it = this.f95904a.iterator();
        boolean z11 = false;
        while (it.hasNext()) {
            Object next = it.next();
            if (this.f95905b.apply(next) && !collection.contains(next)) {
                it.remove();
                z11 = true;
            }
        }
        return z11;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        Iterator it = this.f95904a.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            if (this.f95905b.apply(it.next())) {
                i5++;
            }
        }
        return i5;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final Object[] toArray() {
        Iterator it = iterator();
        ArrayList arrayList = new ArrayList();
        v4.a.b(arrayList, it);
        return arrayList.toArray();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final Object[] toArray(Object[] objArr) {
        Iterator it = iterator();
        ArrayList arrayList = new ArrayList();
        v4.a.b(arrayList, it);
        return arrayList.toArray(objArr);
    }
}
