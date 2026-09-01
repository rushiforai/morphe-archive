package j$.util;

import j$.util.Collection;
import j$.util.Spliterator;
import j$.util.stream.Stream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Iterator;
import java.util.function.Consumer;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.stream.Stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class g implements java.util.Collection, Serializable, Collection {
    private static final long serialVersionUID = 3053995032091335093L;
    public final java.util.Collection a;
    public final Object b;

    public g(java.util.Collection collection, h hVar) {
        this.a = (java.util.Collection) Objects.requireNonNull(collection);
        this.b = Objects.requireNonNull(hVar);
    }

    private void writeObject(ObjectOutputStream objectOutputStream) {
        synchronized (this.b) {
            objectOutputStream.defaultWriteObject();
        }
    }

    @Override // java.util.Collection
    public final boolean add(Object obj) {
        boolean zAdd;
        synchronized (this.b) {
            zAdd = this.a.add(obj);
        }
        return zAdd;
    }

    @Override // java.util.Collection
    public final boolean addAll(java.util.Collection collection) {
        boolean zAddAll;
        synchronized (this.b) {
            zAddAll = this.a.addAll(collection);
        }
        return zAddAll;
    }

    @Override // java.util.Collection
    public final void clear() {
        synchronized (this.b) {
            this.a.clear();
        }
    }

    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        boolean zContains;
        synchronized (this.b) {
            zContains = this.a.contains(obj);
        }
        return zContains;
    }

    @Override // java.util.Collection
    public final boolean containsAll(java.util.Collection collection) {
        boolean zContainsAll;
        synchronized (this.b) {
            zContainsAll = this.a.containsAll(collection);
        }
        return zContainsAll;
    }

    @Override // java.lang.Iterable, j$.util.Collection
    public final void forEach(Consumer consumer) {
        synchronized (this.b) {
            Collection.EL.a(this.a, consumer);
        }
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        boolean zIsEmpty;
        synchronized (this.b) {
            zIsEmpty = this.a.isEmpty();
        }
        return zIsEmpty;
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return this.a.iterator();
    }

    @Override // java.util.Collection
    public final Stream parallelStream() {
        return Stream.Wrapper.convert(Collection.EL.b(this.a));
    }

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        boolean zRemove;
        synchronized (this.b) {
            zRemove = this.a.remove(obj);
        }
        return zRemove;
    }

    @Override // java.util.Collection
    public final boolean removeAll(java.util.Collection collection) {
        boolean zRemoveAll;
        synchronized (this.b) {
            zRemoveAll = this.a.removeAll(collection);
        }
        return zRemoveAll;
    }

    @Override // java.util.Collection, j$.util.Collection
    public final boolean removeIf(Predicate predicate) {
        boolean zRemoveIf;
        synchronized (this.b) {
            zRemoveIf = Collection.EL.removeIf(this.a, predicate);
        }
        return zRemoveIf;
    }

    @Override // java.util.Collection
    public final boolean retainAll(java.util.Collection collection) {
        boolean zRetainAll;
        synchronized (this.b) {
            zRetainAll = this.a.retainAll(collection);
        }
        return zRetainAll;
    }

    @Override // java.util.Collection
    public final int size() {
        int size;
        synchronized (this.b) {
            size = this.a.size();
        }
        return size;
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final java.util.Spliterator spliterator() {
        return Spliterator.Wrapper.convert(Collection.EL.c(this.a));
    }

    @Override // java.util.Collection
    public final java.util.stream.Stream stream() {
        return Stream.Wrapper.convert(Collection.EL.d(this.a));
    }

    @Override // java.util.Collection
    public final Object[] toArray() {
        Object[] array;
        synchronized (this.b) {
            array = this.a.toArray();
        }
        return array;
    }

    public final String toString() {
        String string;
        synchronized (this.b) {
            string = this.a.toString();
        }
        return string;
    }

    @Override // java.util.Collection, j$.util.Collection
    public final j$.util.stream.Stream parallelStream() {
        return Collection.EL.b(this.a);
    }

    @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection
    public final Spliterator spliterator() {
        return Collection.EL.c(this.a);
    }

    @Override // java.util.Collection, j$.util.Collection
    public final j$.util.stream.Stream stream() {
        return Collection.EL.d(this.a);
    }

    @Override // java.util.Collection, j$.util.Collection
    public final /* synthetic */ Object[] toArray(IntFunction intFunction) {
        return toArray((Object[]) intFunction.apply(0));
    }

    @Override // java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        Object[] array;
        synchronized (this.b) {
            array = this.a.toArray(objArr);
        }
        return array;
    }

    public g(java.util.Collection collection) {
        this.a = (java.util.Collection) Objects.requireNonNull(collection);
        this.b = this;
    }
}
