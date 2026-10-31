package b3;

import androidx.compose.ui.Modifier$Node;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.function.UnaryOperator;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public final class u implements List, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final z.j0 f17374a = new z.j0(16);

    /* renamed from: b, reason: collision with root package name */
    public final z.e0 f17375b = new z.e0(16);

    /* renamed from: c, reason: collision with root package name */
    public int f17376c = -1;

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ void add(int i5, Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ void addFirst(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ void addLast(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x003d, code lost:
    
        android.support.v4.media.session.b.m0("Index must be between 0 and size");
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0043, code lost:
    
        throw null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long c() {
        long jK = ic.b.k(Float.POSITIVE_INFINITY, false, false);
        int i5 = this.f17376c + 1;
        int iK = ul.b.K(this);
        if (i5 > iK) {
            return jK;
        }
        while (true) {
            z.e0 e0Var = this.f17375b;
            if (i5 < 0) {
                e0Var.getClass();
                break;
            }
            if (i5 >= e0Var.f97814b) {
                break;
            }
            long j11 = e0Var.f97813a[i5];
            if (i30.j.n(j11, jK) < 0) {
                jK = j11;
            }
            if ((i30.j.E(jK) < 0.0f && i30.j.K(jK)) || i5 == iK) {
                break;
            }
            i5++;
        }
        return jK;
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        this.f17376c = -1;
        this.f17374a.i();
        this.f17375b.f97814b = 0;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        return (obj instanceof Modifier$Node) && indexOf((Modifier$Node) obj) != -1;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!contains((Modifier$Node) it.next())) {
                return false;
            }
        }
        return true;
    }

    public final void d(int i5, int i11) {
        if (i5 >= i11) {
            return;
        }
        this.f17374a.l(i5, i11);
        z.e0 e0Var = this.f17375b;
        if (i5 >= 0) {
            int i12 = e0Var.f97814b;
            if (i5 <= i12 && i11 >= 0 && i11 <= i12) {
                if (i11 < i5) {
                    android.support.v4.media.session.b.k0("The end index must be < start index");
                    throw null;
                }
                if (i11 != i5) {
                    if (i11 < i12) {
                        long[] jArr = e0Var.f97813a;
                        u90.b.s(jArr, jArr, i5, i11, i12);
                    }
                    e0Var.f97814b -= i11 - i5;
                    return;
                }
                return;
            }
        } else {
            e0Var.getClass();
        }
        android.support.v4.media.session.b.m0("Index must be between 0 and size");
        throw null;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        Object objB = this.f17374a.b(i5);
        Intrinsics.e(objB, "null cannot be cast to non-null type androidx.compose.ui.Modifier.Node");
        return (Modifier$Node) objB;
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Modifier$Node)) {
            return -1;
        }
        Modifier$Node modifier$Node = (Modifier$Node) obj;
        int iK = ul.b.K(this);
        if (iK >= 0) {
            int i5 = 0;
            while (!Intrinsics.b(this.f17374a.b(i5), modifier$Node)) {
                if (i5 != iK) {
                    i5++;
                }
            }
            return i5;
        }
        return -1;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return this.f17374a.d();
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new s(this, 0, 7);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        if (!(obj instanceof Modifier$Node)) {
            return -1;
        }
        Modifier$Node modifier$Node = (Modifier$Node) obj;
        for (int iK = ul.b.K(this); -1 < iK; iK--) {
            if (Intrinsics.b(this.f17374a.b(iK), modifier$Node)) {
                return iK;
            }
        }
        return -1;
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return new s(this, 0, 7);
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ Object removeFirst() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ Object removeLast() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final void replaceAll(UnaryOperator unaryOperator) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        return this.f17374a.f97841b;
    }

    @Override // java.util.List
    public final void sort(Comparator comparator) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        return new t(this, i5, i11);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    @Override // java.util.List, java.util.Collection
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i5) {
        return new s(this, i5, 6);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return CollectionToArray.b(this, objArr);
    }
}
