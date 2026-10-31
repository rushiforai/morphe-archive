package sb0;

import androidx.recyclerview.widget.u1;
import java.util.Collection;
import java.util.Iterator;
import java.util.Queue;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReferenceArray;
import ps.f;

/* loaded from: classes5.dex */
public final class c implements Queue {

    /* renamed from: i, reason: collision with root package name */
    public static final int f87109i = Integer.getInteger("jctools.spsc.max.lookahead.step", u1.FLAG_APPEARED_IN_PRE_LAYOUT).intValue();

    /* renamed from: j, reason: collision with root package name */
    public static final Object f87110j = new Object();

    /* renamed from: a, reason: collision with root package name */
    public final AtomicLong f87111a;

    /* renamed from: b, reason: collision with root package name */
    public final int f87112b;

    /* renamed from: c, reason: collision with root package name */
    public long f87113c;

    /* renamed from: d, reason: collision with root package name */
    public final int f87114d;

    /* renamed from: e, reason: collision with root package name */
    public AtomicReferenceArray f87115e;

    /* renamed from: f, reason: collision with root package name */
    public final int f87116f;

    /* renamed from: g, reason: collision with root package name */
    public AtomicReferenceArray f87117g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicLong f87118h;

    public c(int i5) {
        int iN = f.n(Math.max(8, i5));
        int i11 = iN - 1;
        AtomicLong atomicLong = new AtomicLong();
        this.f87111a = atomicLong;
        this.f87118h = new AtomicLong();
        AtomicReferenceArray atomicReferenceArray = new AtomicReferenceArray(iN + 1);
        this.f87115e = atomicReferenceArray;
        this.f87114d = i11;
        this.f87112b = Math.min(iN / 4, f87109i);
        this.f87117g = atomicReferenceArray;
        this.f87116f = i11;
        this.f87113c = iN - 2;
        atomicLong.lazySet(0L);
    }

    @Override // java.util.Queue, java.util.Collection
    public final boolean add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final void clear() {
        while (true) {
            if (poll() == null && isEmpty()) {
                return;
            }
        }
    }

    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final boolean containsAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Queue
    public final Object element() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        return this.f87111a.get() == this.f87118h.get();
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Queue
    public final boolean offer(Object obj) {
        obj.getClass();
        AtomicReferenceArray atomicReferenceArray = this.f87115e;
        AtomicLong atomicLong = this.f87111a;
        long j11 = atomicLong.get();
        int i5 = this.f87114d;
        int i11 = ((int) j11) & i5;
        if (j11 < this.f87113c) {
            atomicLong.lazySet(j11 + 1);
            atomicReferenceArray.lazySet(i11, obj);
            return true;
        }
        long j12 = this.f87112b + j11;
        if (atomicReferenceArray.get(((int) j12) & i5) == null) {
            this.f87113c = j12 - 1;
            atomicLong.lazySet(j11 + 1);
            atomicReferenceArray.lazySet(i11, obj);
            return true;
        }
        long j13 = j11 + 1;
        if (atomicReferenceArray.get(((int) j13) & i5) != null) {
            atomicLong.lazySet(j13);
            atomicReferenceArray.lazySet(i11, obj);
            return true;
        }
        AtomicReferenceArray atomicReferenceArray2 = new AtomicReferenceArray(atomicReferenceArray.length());
        this.f87115e = atomicReferenceArray2;
        this.f87113c = (j11 + i5) - 1;
        atomicLong.lazySet(j13);
        atomicReferenceArray2.lazySet(i11, obj);
        atomicReferenceArray.lazySet(atomicReferenceArray.length() - 1, atomicReferenceArray2);
        atomicReferenceArray.lazySet(i11, f87110j);
        return true;
    }

    @Override // java.util.Queue
    public final Object peek() {
        AtomicReferenceArray atomicReferenceArray = this.f87117g;
        int i5 = ((int) this.f87118h.get()) & this.f87116f;
        Object obj = atomicReferenceArray.get(i5);
        if (obj != f87110j) {
            return obj;
        }
        AtomicReferenceArray atomicReferenceArray2 = (AtomicReferenceArray) atomicReferenceArray.get(atomicReferenceArray.length() - 1);
        this.f87117g = atomicReferenceArray2;
        return atomicReferenceArray2.get(i5);
    }

    @Override // java.util.Queue
    public final Object poll() {
        AtomicReferenceArray atomicReferenceArray = this.f87117g;
        AtomicLong atomicLong = this.f87118h;
        long j11 = atomicLong.get();
        int i5 = this.f87116f & ((int) j11);
        Object obj = atomicReferenceArray.get(i5);
        boolean z11 = obj == f87110j;
        if (obj != null && !z11) {
            atomicLong.lazySet(j11 + 1);
            atomicReferenceArray.lazySet(i5, null);
            return obj;
        }
        if (z11) {
            AtomicReferenceArray atomicReferenceArray2 = (AtomicReferenceArray) atomicReferenceArray.get(atomicReferenceArray.length() - 1);
            this.f87117g = atomicReferenceArray2;
            Object obj2 = atomicReferenceArray2.get(i5);
            if (obj2 != null) {
                atomicLong.lazySet(j11 + 1);
                atomicReferenceArray2.lazySet(i5, null);
                return obj2;
            }
        }
        return null;
    }

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final int size() {
        AtomicLong atomicLong = this.f87118h;
        long j11 = atomicLong.get();
        while (true) {
            long j12 = this.f87111a.get();
            long j13 = atomicLong.get();
            if (j11 == j13) {
                return (int) (j12 - j13);
            }
            j11 = j13;
        }
    }

    @Override // java.util.Collection
    public final Object[] toArray() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Queue
    public final Object remove() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        throw new UnsupportedOperationException();
    }
}
