package mh;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ListIterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class g extends a0 implements ListIterator {

    /* renamed from: a, reason: collision with root package name */
    public final int f76335a;

    /* renamed from: b, reason: collision with root package name */
    public int f76336b;

    /* renamed from: c, reason: collision with root package name */
    public final j f76337c;

    public g(j jVar, int i5) {
        int size = jVar.size();
        if (i5 < 0 || i5 > size) {
            throw new IndexOutOfBoundsException(a.n(i5, size, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX));
        }
        this.f76335a = size;
        this.f76336b = i5;
        this.f76337c = jVar;
    }

    public final Object a(int i5) {
        return this.f76337c.get(i5);
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final boolean hasNext() {
        return this.f76336b < this.f76335a;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f76336b > 0;
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f76336b;
        this.f76336b = i5 + 1;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f76336b;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f76336b - 1;
        this.f76336b = i5;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f76336b - 1;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
