package io.sentry;

import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.Collection;
import java.util.Iterator;
import java.util.Queue;

/* loaded from: classes4.dex */
public final class o4 implements Queue, Collection, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final AbstractCollection f67427a;

    /* renamed from: b, reason: collision with root package name */
    public final o4 f67428b = this;

    /* JADX WARN: Multi-variable type inference failed */
    public o4(Queue queue) {
        this.f67427a = (AbstractCollection) queue;
    }

    @Override // java.util.Queue, java.util.Collection
    public final boolean add(Object obj) {
        boolean zAdd;
        synchronized (this.f67428b) {
            zAdd = ((Queue) this.f67427a).add(obj);
        }
        return zAdd;
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection collection) {
        boolean zAddAll;
        synchronized (this.f67428b) {
            zAddAll = ((Queue) this.f67427a).addAll(collection);
        }
        return zAddAll;
    }

    @Override // java.util.Collection
    public final void clear() {
        synchronized (this.f67428b) {
            ((Queue) this.f67427a).clear();
        }
    }

    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        boolean zContains;
        synchronized (this.f67428b) {
            zContains = ((Queue) this.f67427a).contains(obj);
        }
        return zContains;
    }

    @Override // java.util.Collection
    public final boolean containsAll(Collection collection) {
        boolean zContainsAll;
        synchronized (this.f67428b) {
            zContainsAll = ((Queue) this.f67427a).containsAll(collection);
        }
        return zContainsAll;
    }

    @Override // java.util.Queue
    public final Object element() {
        Object objElement;
        synchronized (this.f67428b) {
            objElement = ((Queue) this.f67427a).element();
        }
        return objElement;
    }

    @Override // java.util.Collection
    public final boolean equals(Object obj) {
        boolean zEquals;
        if (obj == this) {
            return true;
        }
        synchronized (this.f67428b) {
            zEquals = ((Queue) this.f67427a).equals(obj);
        }
        return zEquals;
    }

    @Override // java.util.Collection
    public final int hashCode() {
        int iHashCode;
        synchronized (this.f67428b) {
            iHashCode = ((Queue) this.f67427a).hashCode();
        }
        return iHashCode;
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        boolean zIsEmpty;
        synchronized (this.f67428b) {
            zIsEmpty = ((Queue) this.f67427a).isEmpty();
        }
        return zIsEmpty;
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return ((Queue) this.f67427a).iterator();
    }

    @Override // java.util.Queue
    public final boolean offer(Object obj) {
        boolean zOffer;
        synchronized (this.f67428b) {
            zOffer = ((Queue) this.f67427a).offer(obj);
        }
        return zOffer;
    }

    @Override // java.util.Queue
    public final Object peek() {
        Object objPeek;
        synchronized (this.f67428b) {
            objPeek = ((Queue) this.f67427a).peek();
        }
        return objPeek;
    }

    @Override // java.util.Queue
    public final Object poll() {
        Object objPoll;
        synchronized (this.f67428b) {
            objPoll = ((Queue) this.f67427a).poll();
        }
        return objPoll;
    }

    @Override // java.util.Queue
    public final Object remove() {
        Object objRemove;
        synchronized (this.f67428b) {
            objRemove = ((Queue) this.f67427a).remove();
        }
        return objRemove;
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection collection) {
        boolean zRemoveAll;
        synchronized (this.f67428b) {
            zRemoveAll = ((Queue) this.f67427a).removeAll(collection);
        }
        return zRemoveAll;
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection collection) {
        boolean zRetainAll;
        synchronized (this.f67428b) {
            zRetainAll = ((Queue) this.f67427a).retainAll(collection);
        }
        return zRetainAll;
    }

    @Override // java.util.Collection
    public final int size() {
        int size;
        synchronized (this.f67428b) {
            size = ((Queue) this.f67427a).size();
        }
        return size;
    }

    @Override // java.util.Collection
    public final Object[] toArray() {
        Object[] array;
        synchronized (this.f67428b) {
            array = ((Queue) this.f67427a).toArray();
        }
        return array;
    }

    public final String toString() {
        String string;
        synchronized (this.f67428b) {
            string = ((Queue) this.f67427a).toString();
        }
        return string;
    }

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        boolean zRemove;
        synchronized (this.f67428b) {
            zRemove = ((Queue) this.f67427a).remove(obj);
        }
        return zRemove;
    }

    @Override // java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        Object[] array;
        synchronized (this.f67428b) {
            array = ((Queue) this.f67427a).toArray(objArr);
        }
        return array;
    }
}
