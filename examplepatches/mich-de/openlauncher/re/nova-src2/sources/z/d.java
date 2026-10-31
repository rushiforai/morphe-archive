package z;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class d implements Collection {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f97754a;

    public d(e eVar) {
        this.f97754a = eVar;
    }

    @Override // java.util.Collection
    public final boolean add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final void clear() {
        this.f97754a.clear();
    }

    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        return this.f97754a.a(obj) >= 0;
    }

    @Override // java.util.Collection
    public final boolean containsAll(Collection collection) {
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        return this.f97754a.isEmpty();
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new a(this.f97754a, 1);
    }

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        e eVar = this.f97754a;
        int iA = eVar.a(obj);
        if (iA < 0) {
            return false;
        }
        eVar.h(iA);
        return true;
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection collection) {
        e eVar = this.f97754a;
        int i5 = eVar.f97753c;
        int i11 = 0;
        boolean z11 = false;
        while (i11 < i5) {
            if (collection.contains(eVar.j(i11))) {
                eVar.h(i11);
                i11--;
                i5--;
                z11 = true;
            }
            i11++;
        }
        return z11;
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection collection) {
        e eVar = this.f97754a;
        int i5 = eVar.f97753c;
        int i11 = 0;
        boolean z11 = false;
        while (i11 < i5) {
            if (!collection.contains(eVar.j(i11))) {
                eVar.h(i11);
                i11--;
                i5--;
                z11 = true;
            }
            i11++;
        }
        return z11;
    }

    @Override // java.util.Collection
    public final int size() {
        return this.f97754a.f97753c;
    }

    @Override // java.util.Collection
    public final Object[] toArray() {
        e eVar = this.f97754a;
        int i5 = eVar.f97753c;
        Object[] objArr = new Object[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            objArr[i11] = eVar.j(i11);
        }
        return objArr;
    }

    @Override // java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        e eVar = this.f97754a;
        int i5 = eVar.f97753c;
        if (objArr.length < i5) {
            objArr = (Object[]) Array.newInstance(objArr.getClass().getComponentType(), i5);
        }
        for (int i11 = 0; i11 < i5; i11++) {
            objArr[i11] = eVar.j(i11);
        }
        if (objArr.length > i5) {
            objArr[i5] = null;
        }
        return objArr;
    }
}
