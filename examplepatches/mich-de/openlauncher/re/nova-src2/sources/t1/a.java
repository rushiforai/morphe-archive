package t1;

import java.util.ListIterator;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public abstract class a implements ListIterator, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public int f88431a;

    /* renamed from: b, reason: collision with root package name */
    public int f88432b;

    public a(int i5, int i11) {
        this.f88431a = i5;
        this.f88432b = i11;
    }

    @Override // java.util.ListIterator
    public void add(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f88431a < this.f88432b;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f88431a > 0;
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f88431a;
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f88431a - 1;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.ListIterator
    public void set(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
