package z;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.jvm.internal.markers.KMutableSet;

/* loaded from: classes.dex */
public final class r0 implements KMutableSet, Set, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final p0 f97827a;

    /* renamed from: b, reason: collision with root package name */
    public final p0 f97828b;

    public r0(p0 p0Var) {
        this.f97827a = p0Var;
        this.f97828b = p0Var;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean add(Object obj) {
        return this.f97828b.d(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        p0 p0Var = this.f97828b;
        int i5 = p0Var.f97743d;
        Iterator it = elements.iterator();
        while (it.hasNext()) {
            p0Var.j(it.next());
        }
        return i5 != p0Var.f97743d;
    }

    @Override // java.util.Set, java.util.Collection
    public final void clear() {
        this.f97828b.e();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean contains(Object obj) {
        return this.f97827a.a(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        Iterator it = elements.iterator();
        while (it.hasNext()) {
            if (!this.f97827a.a(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || r0.class != obj.getClass()) {
            return false;
        }
        return this.f97827a.equals(((r0) obj).f97827a);
    }

    @Override // java.util.Set, java.util.Collection
    public final int hashCode() {
        return this.f97827a.hashCode();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return this.f97827a.b();
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new m0(this);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        return this.f97828b.l(obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean removeAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        p0 p0Var = this.f97828b;
        p0Var.getClass();
        int i5 = p0Var.f97743d;
        Iterator it = elements.iterator();
        while (it.hasNext()) {
            p0Var.i(it.next());
        }
        return i5 != p0Var.f97743d;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection elements) {
        boolean z11;
        Intrinsics.g(elements, "elements");
        p0 p0Var = this.f97828b;
        p0Var.getClass();
        Object[] objArr = p0Var.f97741b;
        int i5 = p0Var.f97743d;
        long[] jArr = p0Var.f97740a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i11 = 0;
            while (true) {
                long j11 = jArr[i11];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i12 = 8 - ((~(i11 - length)) >>> 31);
                    for (int i13 = 0; i13 < i12; i13++) {
                        if ((255 & j11) < 128) {
                            int i14 = (i11 << 3) + i13;
                            if (!b70.g.O0(elements, objArr[i14])) {
                                p0Var.m(i14);
                            }
                        }
                        j11 >>= 8;
                    }
                    z11 = false;
                    if (i12 != 8) {
                        break;
                    }
                } else {
                    z11 = false;
                }
                if (i11 == length) {
                    break;
                }
                i11++;
            }
        } else {
            z11 = false;
        }
        if (i5 != p0Var.f97743d) {
            return true;
        }
        return z11;
    }

    @Override // java.util.Set, java.util.Collection
    public final int size() {
        return this.f97827a.f97743d;
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    public final String toString() {
        return this.f97827a.toString();
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray(Object[] array) {
        Intrinsics.g(array, "array");
        return CollectionToArray.b(this, array);
    }
}
