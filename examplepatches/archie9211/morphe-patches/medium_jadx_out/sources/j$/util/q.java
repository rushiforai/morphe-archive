package j$.util;

import j$.util.Collection;
import j$.util.stream.Stream;
import j$.util.stream.a5;
import j$.util.stream.y6;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class q extends t {
    private static final long serialVersionUID = 7854390611657943733L;

    @Override // j$.util.k, java.util.Collection
    public final boolean contains(Object obj) {
        if (obj instanceof Map.Entry) {
            return this.a.contains(new o((Map.Entry) obj));
        }
        return false;
    }

    @Override // j$.util.k, java.util.Collection
    public final boolean containsAll(java.util.Collection collection) {
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            if (!contains(it2.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // j$.util.t, java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof java.util.Set)) {
            return false;
        }
        java.util.Set set = (java.util.Set) obj;
        if (set.size() != this.a.size()) {
            return false;
        }
        return containsAll(set);
    }

    @Override // j$.util.k, java.lang.Iterable, j$.util.Collection
    public final void forEach(Consumer consumer) {
        Objects.requireNonNull(consumer);
        Collection.EL.a(this.a, new n(0, consumer));
    }

    @Override // j$.util.k, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new j(this);
    }

    @Override // j$.util.k, java.util.Collection, j$.util.Collection
    public final Stream parallelStream() {
        Spliterator spliterator = spliterator();
        Objects.requireNonNull(spliterator);
        return new a5(spliterator, y6.j(spliterator), true);
    }

    @Override // j$.util.k, java.util.Collection, java.lang.Iterable, j$.util.Collection
    public final Spliterator spliterator() {
        return new p(Collection.EL.c(this.a));
    }

    @Override // j$.util.k, java.util.Collection, j$.util.Collection
    public final Stream stream() {
        Spliterator spliterator = spliterator();
        Objects.requireNonNull(spliterator);
        return new a5(spliterator, y6.j(spliterator), false);
    }

    @Override // j$.util.k, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        Object[] array = this.a.toArray(objArr.length == 0 ? objArr : Arrays.copyOf(objArr, 0));
        for (int i = 0; i < array.length; i++) {
            array[i] = new o((Map.Entry) array[i]);
        }
        if (array.length > objArr.length) {
            return array;
        }
        System.arraycopy(array, 0, objArr, 0, array.length);
        if (objArr.length > array.length) {
            objArr[array.length] = null;
        }
        return objArr;
    }

    @Override // j$.util.k, java.util.Collection
    public final Object[] toArray() {
        Object[] array = this.a.toArray();
        for (int i = 0; i < array.length; i++) {
            array[i] = new o((Map.Entry) array[i]);
        }
        return array;
    }
}
