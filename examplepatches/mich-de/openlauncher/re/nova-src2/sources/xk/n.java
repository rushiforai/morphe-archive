package xk;

import java.util.AbstractCollection;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public class n extends AbstractCollection implements List {

    /* renamed from: a, reason: collision with root package name */
    public final Object f95967a;

    /* renamed from: b, reason: collision with root package name */
    public Collection f95968b;

    /* renamed from: c, reason: collision with root package name */
    public final n f95969c;

    /* renamed from: d, reason: collision with root package name */
    public final Collection f95970d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ d2 f95971e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ d2 f95972f;

    public n(d2 d2Var, Object obj, List list, n nVar) {
        this.f95972f = d2Var;
        this.f95971e = d2Var;
        this.f95967a = obj;
        this.f95968b = list;
        this.f95969c = nVar;
        this.f95970d = nVar == null ? null : nVar.f95968b;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d();
        boolean zIsEmpty = this.f95968b.isEmpty();
        boolean zAdd = this.f95968b.add(obj);
        if (zAdd) {
            this.f95971e.f95894e++;
            if (zIsEmpty) {
                c();
            }
        }
        return zAdd;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        if (collection.isEmpty()) {
            return false;
        }
        int size = size();
        boolean zAddAll = this.f95968b.addAll(collection);
        if (zAddAll) {
            this.f95971e.f95894e += this.f95968b.size() - size;
            if (size == 0) {
                c();
            }
        }
        return zAddAll;
    }

    public final void c() {
        n nVar = this.f95969c;
        if (nVar != null) {
            nVar.c();
        } else {
            this.f95971e.f95893d.put(this.f95967a, this.f95968b);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        int size = size();
        if (size == 0) {
            return;
        }
        this.f95968b.clear();
        this.f95971e.f95894e -= size;
        e();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        d();
        return this.f95968b.contains(obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean containsAll(Collection collection) {
        d();
        return this.f95968b.containsAll(collection);
    }

    public final void d() {
        Collection collection;
        n nVar = this.f95969c;
        if (nVar != null) {
            nVar.d();
            if (nVar.f95968b != this.f95970d) {
                throw new ConcurrentModificationException();
            }
        } else {
            if (!this.f95968b.isEmpty() || (collection = (Collection) this.f95971e.f95893d.get(this.f95967a)) == null) {
                return;
            }
            this.f95968b = collection;
        }
    }

    public final void e() {
        n nVar = this.f95969c;
        if (nVar != null) {
            nVar.e();
        } else if (this.f95968b.isEmpty()) {
            this.f95971e.f95893d.remove(this.f95967a);
        }
    }

    @Override // java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        d();
        return this.f95968b.equals(obj);
    }

    @Override // java.util.List
    public final Object get(int i5) {
        d();
        return ((List) this.f95968b).get(i5);
    }

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        d();
        return this.f95968b.hashCode();
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        d();
        return ((List) this.f95968b).indexOf(obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        d();
        return new e(this);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        d();
        return ((List) this.f95968b).lastIndexOf(obj);
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        d();
        return new m(this);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean remove(Object obj) {
        d();
        boolean zRemove = this.f95968b.remove(obj);
        if (zRemove) {
            d2 d2Var = this.f95971e;
            d2Var.f95894e--;
            e();
        }
        return zRemove;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean removeAll(Collection collection) {
        if (collection.isEmpty()) {
            return false;
        }
        int size = size();
        boolean zRemoveAll = this.f95968b.removeAll(collection);
        if (zRemoveAll) {
            this.f95971e.f95894e += this.f95968b.size() - size;
            e();
        }
        return zRemoveAll;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean retainAll(Collection collection) {
        collection.getClass();
        int size = size();
        boolean zRetainAll = this.f95968b.retainAll(collection);
        if (zRetainAll) {
            this.f95971e.f95894e += this.f95968b.size() - size;
            e();
        }
        return zRetainAll;
    }

    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        d();
        return ((List) this.f95968b).set(i5, obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        d();
        return this.f95968b.size();
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        d();
        List listSubList = ((List) this.f95968b).subList(i5, i11);
        n nVar = this.f95969c;
        if (nVar == null) {
            nVar = this;
        }
        boolean z11 = listSubList instanceof RandomAccess;
        d2 d2Var = this.f95972f;
        Object obj = this.f95967a;
        return z11 ? new j(d2Var, obj, listSubList, nVar) : new n(d2Var, obj, listSubList, nVar);
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        d();
        return this.f95968b.toString();
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i5) {
        d();
        return new m(this, i5);
    }

    @Override // java.util.List
    public final Object remove(int i5) {
        d();
        Object objRemove = ((List) this.f95968b).remove(i5);
        d2 d2Var = this.f95972f;
        d2Var.f95894e--;
        e();
        return objRemove;
    }

    @Override // java.util.List
    public final void add(int i5, Object obj) {
        d();
        boolean zIsEmpty = this.f95968b.isEmpty();
        ((List) this.f95968b).add(i5, obj);
        this.f95972f.f95894e++;
        if (zIsEmpty) {
            c();
        }
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        if (collection.isEmpty()) {
            return false;
        }
        int size = size();
        boolean zAddAll = ((List) this.f95968b).addAll(i5, collection);
        if (zAddAll) {
            this.f95972f.f95894e += this.f95968b.size() - size;
            if (size == 0) {
                c();
            }
        }
        return zAddAll;
    }
}
