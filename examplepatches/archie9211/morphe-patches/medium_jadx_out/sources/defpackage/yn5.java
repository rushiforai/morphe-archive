package defpackage;

import j$.lang.Iterable$CC;
import j$.util.Collection;
import j$.util.List;
import j$.util.Spliterator;
import j$.util.stream.Stream;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;
import java.util.stream.Stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yn5 implements List, th6, j$.util.List {
    public final x68 a = new x68(16);
    public final o68 b = new o68(16);
    public int c = -1;

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ void add(int i, Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final boolean addAll(int i, Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ void addFirst(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ void addLast(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        this.c = -1;
        this.a.d();
        this.b.b = 0;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        return (obj instanceof q28) && indexOf((q28) obj) != -1;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            if (!contains((q28) it2.next())) {
                return false;
            }
        }
        return true;
    }

    public final long d() {
        long jV = k50.v(Float.POSITIVE_INFINITY, false, false);
        int i = this.c + 1;
        int i2 = this.a.b - 1;
        if (i > i2) {
            return jV;
        }
        while (i >= 0) {
            o68 o68Var = this.b;
            if (i >= o68Var.b) {
                break;
            }
            long j = o68Var.a[i];
            if (op8.L(j, jV) < 0) {
                jV = j;
            }
            if ((op8.W(jV) < 0.0f && op8.d0(jV)) || i == i2) {
                return jV;
            }
            i++;
        }
        z10.i("Index must be between 0 and size");
        return 0L;
    }

    public final void f(int i, int i2) {
        o68 o68Var;
        int i3;
        if (i >= i2) {
            return;
        }
        this.a.l(i, i2);
        if (i < 0 || i > (i3 = (o68Var = this.b).b) || i2 < 0 || i2 > i3) {
            z10.i("Index must be between 0 and size");
            return;
        }
        if (i2 < i) {
            ay0.e("The end index must be < start index");
        } else if (i2 != i) {
            if (i2 < i3) {
                long[] jArr = o68Var.a;
                k80.i0(jArr, jArr, i, i2, i3);
            }
            o68Var.b -= i2 - i;
        }
    }

    @Override // java.lang.Iterable, j$.util.Collection
    public /* synthetic */ void forEach(Consumer consumer) {
        Iterable$CC.$default$forEach(this, consumer);
    }

    @Override // java.util.List
    public final Object get(int i) {
        Object objF = this.a.f(i);
        objF.getClass();
        return (q28) objF;
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof q28)) {
            return -1;
        }
        q28 q28Var = (q28) obj;
        x68 x68Var = this.a;
        int i = x68Var.b - 1;
        if (i < 0) {
            return -1;
        }
        int i2 = 0;
        while (!g76.L(x68Var.f(i2), q28Var)) {
            if (i2 == i) {
                return -1;
            }
            i2++;
        }
        return i2;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return this.a.h();
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new wn5(this, 0, 7);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        if (obj instanceof q28) {
            q28 q28Var = (q28) obj;
            x68 x68Var = this.a;
            for (int i = x68Var.b - 1; -1 < i; i--) {
                if (g76.L(x68Var.f(i), q28Var)) {
                    return i;
                }
            }
        }
        return -1;
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return new wn5(this, 0, 7);
    }

    @Override // java.util.Collection
    public /* synthetic */ Stream parallelStream() {
        return Stream.Wrapper.convert(parallelStream());
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ Object removeFirst() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ boolean removeIf(Predicate predicate) {
        return Collection.CC.$default$removeIf(this, predicate);
    }

    public final /* bridge */ /* synthetic */ Object removeLast() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, j$.util.List
    public final void replaceAll(UnaryOperator unaryOperator) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(java.util.Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i, Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        return this.a.b;
    }

    @Override // java.util.List, j$.util.List
    public final void sort(Comparator comparator) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public /* synthetic */ Spliterator spliterator() {
        return Spliterator.Wrapper.convert(spliterator());
    }

    @Override // java.util.Collection
    public /* synthetic */ java.util.stream.Stream stream() {
        return Stream.Wrapper.convert(stream());
    }

    @Override // java.util.List
    public final List subList(int i, int i2) {
        return new xn5(this, i, i2);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return kng.N(this);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ Object[] toArray(IntFunction intFunction) {
        return toArray((Object[]) intFunction.apply(0));
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return kng.O(this, objArr);
    }

    @Override // java.util.List, java.util.Collection
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(java.util.Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i) {
        return new wn5(this, i, 6);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ j$.util.stream.Stream parallelStream() {
        return Collection.CC.$default$parallelStream(this);
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable, j$.util.List, j$.util.Collection
    public /* synthetic */ j$.util.Spliterator spliterator() {
        return List.CC.$default$spliterator(this);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ j$.util.stream.Stream stream() {
        return Collection.CC.$default$stream(this);
    }
}
