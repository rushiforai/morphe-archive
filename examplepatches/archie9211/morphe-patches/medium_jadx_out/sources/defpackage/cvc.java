package defpackage;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cvc implements List, vh6 {
    public final ejc a;
    public final int b;
    public int c;
    public int d;

    public cvc(ejc ejcVar, int i, int i2) {
        this.a = ejcVar;
        this.b = i;
        this.c = g01.S(ejcVar);
        this.d = i2 - i;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean add(Object obj) {
        d();
        int i = this.b + this.d;
        ejc ejcVar = this.a;
        ejcVar.add(i, obj);
        this.d++;
        this.c = g01.S(ejcVar);
        return true;
    }

    @Override // java.util.List
    public final boolean addAll(int i, Collection collection) {
        d();
        int i2 = i + this.b;
        ejc ejcVar = this.a;
        boolean zAddAll = ejcVar.addAll(i2, collection);
        if (zAddAll) {
            this.d = collection.size() + this.d;
            this.c = g01.S(ejcVar);
        }
        return zAddAll;
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        if (this.d > 0) {
            d();
            int i = this.d;
            int i2 = this.b;
            ejc ejcVar = this.a;
            ejcVar.p(i2, i + i2);
            this.d = 0;
            this.c = g01.S(ejcVar);
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        return indexOf(obj) >= 0;
    }

    @Override // java.util.List, java.util.Collection
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

    public final void d() {
        if (g01.S(this.a) == this.c) {
            return;
        }
        z10.g();
    }

    @Override // java.util.List
    public final Object get(int i) {
        d();
        g01.V(i, this.d);
        return this.a.get(this.b + i);
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        d();
        int i = this.d;
        int i2 = this.b;
        Iterator it2 = iq7.W(i2, i + i2).iterator();
        while (((m46) it2).c) {
            int iNextInt = ((g46) it2).nextInt();
            if (g76.L(obj, this.a.get(iNextInt))) {
                return iNextInt - i2;
            }
        }
        return -1;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return this.d == 0;
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        d();
        int i = this.d;
        int i2 = this.b;
        for (int i3 = (i + i2) - 1; i3 >= i2; i3--) {
            if (g76.L(obj, this.a.get(i3))) {
                return i3 - i2;
            }
        }
        return -1;
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i) {
        d();
        pya pyaVar = new pya();
        pyaVar.a = i - 1;
        return new vjb(pyaVar, this);
    }

    @Override // java.util.List
    public final Object remove(int i) {
        d();
        int i2 = this.b + i;
        ejc ejcVar = this.a;
        Object objRemove = ejcVar.remove(i2);
        this.d--;
        this.c = g01.S(ejcVar);
        return objRemove;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        Iterator it2 = collection.iterator();
        while (true) {
            boolean z = false;
            while (it2.hasNext()) {
                if (remove(it2.next()) || z) {
                    z = true;
                }
            }
            return z;
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        int i;
        y1 y1Var;
        oic oicVarH;
        boolean zK;
        d();
        ejc ejcVar = this.a;
        int i2 = this.b;
        int i3 = this.d + i2;
        int size = ejcVar.size();
        do {
            synchronized (g01.r) {
                bqc bqcVar = ejcVar.a;
                bqcVar.getClass();
                bqc bqcVar2 = (bqc) uic.f(bqcVar);
                i = bqcVar2.d;
                y1Var = bqcVar2.c;
            }
            y1Var.getClass();
            x89 x89VarP = y1Var.p();
            x89VarP.subList(i2, i3).retainAll(collection);
            y1 y1VarD = x89VarP.d();
            if (g76.L(y1VarD, y1Var)) {
                break;
            }
            bqc bqcVar3 = ejcVar.a;
            bqcVar3.getClass();
            synchronized (uic.c) {
                oicVarH = uic.h();
                zK = g01.K((bqc) uic.x(bqcVar3, ejcVar, oicVarH), i, y1VarD, true);
            }
            uic.m(oicVarH, ejcVar);
        } while (!zK);
        int size2 = size - ejcVar.size();
        if (size2 > 0) {
            this.c = g01.S(this.a);
            this.d -= size2;
        }
        return size2 > 0;
    }

    @Override // java.util.List
    public final Object set(int i, Object obj) {
        g01.V(i, this.d);
        d();
        int i2 = i + this.b;
        ejc ejcVar = this.a;
        Object obj2 = ejcVar.set(i2, obj);
        this.c = g01.S(ejcVar);
        return obj2;
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        return this.d;
    }

    @Override // java.util.List
    public final List subList(int i, int i2) {
        if (i < 0 || i > i2 || i2 > this.d) {
            xx9.a("fromIndex or toIndex are out of bounds");
        }
        d();
        int i3 = this.b;
        return new cvc(this.a, i + i3, i2 + i3);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return kng.N(this);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return kng.O(this, objArr);
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        int iIndexOf = indexOf(obj);
        if (iIndexOf < 0) {
            return false;
        }
        remove(iIndexOf);
        return true;
    }

    @Override // java.util.List
    public final void add(int i, Object obj) {
        d();
        int i2 = this.b + i;
        ejc ejcVar = this.a;
        ejcVar.add(i2, obj);
        this.d++;
        this.c = g01.S(ejcVar);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        return addAll(this.d, collection);
    }
}
