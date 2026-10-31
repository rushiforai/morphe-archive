package z1;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import kotlin.Unit;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.markers.KMutableList;
import kotlin.ranges.IntProgressionIterator;
import p1.o1;

/* loaded from: classes2.dex */
public final class d0 implements List, KMutableList {

    /* renamed from: a, reason: collision with root package name */
    public final SnapshotStateList f97908a;

    /* renamed from: b, reason: collision with root package name */
    public final int f97909b;

    /* renamed from: c, reason: collision with root package name */
    public int f97910c;

    /* renamed from: d, reason: collision with root package name */
    public int f97911d;

    public d0(SnapshotStateList snapshotStateList, int i5, int i11) {
        this.f97908a = snapshotStateList;
        this.f97909b = i5;
        this.f97910c = q.d(snapshotStateList);
        this.f97911d = i11 - i5;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean add(Object obj) {
        c();
        int i5 = this.f97909b + this.f97911d;
        SnapshotStateList snapshotStateList = this.f97908a;
        snapshotStateList.add(i5, obj);
        this.f97911d++;
        this.f97910c = q.d(snapshotStateList);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        return addAll(this.f97911d, collection);
    }

    public final void c() {
        if (q.d(this.f97908a) != this.f97910c) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        if (this.f97911d > 0) {
            c();
            int i5 = this.f97911d;
            int i11 = this.f97909b;
            SnapshotStateList snapshotStateList = this.f97908a;
            snapshotStateList.b(i11, i5 + i11);
            this.f97911d = 0;
            this.f97910c = q.d(snapshotStateList);
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
        Iterator it = collection2.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        c();
        q.a(i5, this.f97911d);
        return this.f97908a.get(this.f97909b + i5);
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        c();
        int i5 = this.f97911d;
        int i11 = this.f97909b;
        IntProgressionIterator it = kotlin.ranges.a.m0(i11, i5 + i11).iterator();
        while (it.f71911c) {
            int iNextInt = it.nextInt();
            if (Intrinsics.b(obj, this.f97908a.get(iNextInt))) {
                return iNextInt - i11;
            }
        }
        return -1;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return this.f97911d == 0;
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        c();
        int i5 = this.f97911d;
        int i11 = this.f97909b;
        for (int i12 = (i5 + i11) - 1; i12 >= i11; i12--) {
            if (Intrinsics.b(obj, this.f97908a.get(i12))) {
                return i12 - i11;
            }
        }
        return -1;
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

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        Iterator it = collection.iterator();
        while (true) {
            boolean z11 = false;
            while (it.hasNext()) {
                if (remove(it.next()) || z11) {
                    z11 = true;
                }
            }
            return z11;
        }
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        int i5;
        s1.d dVar;
        f fVarK;
        boolean zB;
        c();
        SnapshotStateList snapshotStateList = this.f97908a;
        int i11 = this.f97909b;
        int i12 = this.f97911d + i11;
        int size = snapshotStateList.size();
        do {
            synchronized (q.f97955a) {
                w wVar = snapshotStateList.f14112a;
                Intrinsics.e(wVar, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.withCurrent>");
                w wVar2 = (w) k.i(wVar);
                i5 = wVar2.f97986d;
                dVar = wVar2.f97985c;
                Unit unit = Unit.f71706a;
            }
            Intrinsics.d(dVar);
            t1.f fVarBuilder = dVar.builder();
            fVarBuilder.subList(i11, i12).retainAll(collection);
            s1.d dVarE = fVarBuilder.e();
            if (Intrinsics.b(dVarE, dVar)) {
                break;
            }
            w wVar3 = snapshotStateList.f14112a;
            Intrinsics.e(wVar3, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateListKt.writable>");
            synchronized (k.f97943c) {
                fVarK = k.k();
                zB = q.b((w) k.w(wVar3, snapshotStateList, fVarK), i5, dVarE, true);
            }
            k.n(fVarK, snapshotStateList);
        } while (!zB);
        int size2 = size - snapshotStateList.size();
        if (size2 > 0) {
            this.f97910c = q.d(this.f97908a);
            this.f97911d -= size2;
        }
        return size2 > 0;
    }

    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        q.a(i5, this.f97911d);
        c();
        int i11 = i5 + this.f97909b;
        SnapshotStateList snapshotStateList = this.f97908a;
        Object obj2 = snapshotStateList.set(i11, obj);
        this.f97910c = q.d(snapshotStateList);
        return obj2;
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        return this.f97911d;
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        if (!(i5 >= 0 && i5 <= i11 && i11 <= this.f97911d)) {
            o1.a("fromIndex or toIndex are out of bounds");
        }
        c();
        int i12 = this.f97909b;
        return new d0(this.f97908a, i5 + i12, i11 + i12);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i5) {
        c();
        Ref.IntRef intRef = new Ref.IntRef();
        intRef.f71861a = i5 - 1;
        return new c0(intRef, this);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return CollectionToArray.b(this, objArr);
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        c();
        int i11 = i5 + this.f97909b;
        SnapshotStateList snapshotStateList = this.f97908a;
        boolean zAddAll = snapshotStateList.addAll(i11, collection);
        if (zAddAll) {
            this.f97911d = collection.size() + this.f97911d;
            this.f97910c = q.d(snapshotStateList);
        }
        return zAddAll;
    }

    @Override // java.util.List
    public final Object remove(int i5) {
        c();
        int i11 = this.f97909b + i5;
        SnapshotStateList snapshotStateList = this.f97908a;
        Object objRemove = snapshotStateList.remove(i11);
        this.f97911d--;
        this.f97910c = q.d(snapshotStateList);
        return objRemove;
    }

    @Override // java.util.List
    public final void add(int i5, Object obj) {
        c();
        int i11 = this.f97909b + i5;
        SnapshotStateList snapshotStateList = this.f97908a;
        snapshotStateList.add(i11, obj);
        this.f97911d++;
        this.f97910c = q.d(snapshotStateList);
    }
}
