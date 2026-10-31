package io.sentry;

import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Queue;

/* loaded from: classes4.dex */
public final class g extends AbstractCollection implements Queue, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final transient Object[] f67240a;

    /* renamed from: b, reason: collision with root package name */
    public transient int f67241b = 0;

    /* renamed from: c, reason: collision with root package name */
    public transient int f67242c = 0;

    /* renamed from: d, reason: collision with root package name */
    public transient boolean f67243d = false;

    /* renamed from: e, reason: collision with root package name */
    public final int f67244e;

    public g(int i5) {
        if (i5 <= 0) {
            throw new IllegalArgumentException("The size must be greater than 0");
        }
        this.f67240a = new Object[i5];
        this.f67244e = i5;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Queue
    public final boolean add(Object obj) {
        if (obj == null) {
            throw new NullPointerException("Attempted to add null object to queue");
        }
        int size = size();
        int i5 = this.f67244e;
        if (size == i5) {
            remove();
        }
        int i11 = this.f67242c;
        int i12 = i11 + 1;
        this.f67242c = i12;
        this.f67240a[i11] = obj;
        if (i12 >= i5) {
            this.f67242c = 0;
        }
        if (this.f67242c == this.f67241b) {
            this.f67243d = true;
        }
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        this.f67243d = false;
        this.f67241b = 0;
        this.f67242c = 0;
        Arrays.fill(this.f67240a, (Object) null);
    }

    @Override // java.util.Queue
    public final Object element() {
        if (isEmpty()) {
            throw new NoSuchElementException("queue is empty");
        }
        return peek();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean isEmpty() {
        return size() == 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new f(this);
    }

    @Override // java.util.Queue
    public final boolean offer(Object obj) {
        add(obj);
        return true;
    }

    @Override // java.util.Queue
    public final Object peek() {
        if (isEmpty()) {
            return null;
        }
        return this.f67240a[this.f67241b];
    }

    @Override // java.util.Queue
    public final Object poll() {
        if (isEmpty()) {
            return null;
        }
        return remove();
    }

    @Override // java.util.Queue
    public final Object remove() {
        if (isEmpty()) {
            throw new NoSuchElementException("queue is empty");
        }
        int i5 = this.f67241b;
        Object[] objArr = this.f67240a;
        Object obj = objArr[i5];
        if (obj != null) {
            int i11 = i5 + 1;
            this.f67241b = i11;
            objArr[i5] = null;
            if (i11 >= this.f67244e) {
                this.f67241b = 0;
            }
            this.f67243d = false;
        }
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        int i5 = this.f67242c;
        int i11 = this.f67241b;
        int i12 = this.f67244e;
        if (i5 < i11) {
            return (i12 - i11) + i5;
        }
        if (i5 != i11) {
            return i5 - i11;
        }
        if (this.f67243d) {
            return i12;
        }
        return 0;
    }
}
