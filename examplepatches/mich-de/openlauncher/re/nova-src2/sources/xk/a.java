package xk;

import java.util.ListIterator;
import java.util.NoSuchElementException;

/* loaded from: classes.dex */
public abstract class a extends lh.h implements ListIterator {

    /* renamed from: b, reason: collision with root package name */
    public final int f95846b;

    /* renamed from: c, reason: collision with root package name */
    public int f95847c;

    public a(int i5, int i11) {
        super(1);
        vk.b0.h(i11, i5);
        this.f95846b = i5;
        this.f95847c = i11;
    }

    public abstract Object a(int i5);

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final boolean hasNext() {
        return this.f95847c < this.f95846b;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f95847c > 0;
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f95847c;
        this.f95847c = i5 + 1;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f95847c;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f95847c - 1;
        this.f95847c = i5;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f95847c - 1;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
