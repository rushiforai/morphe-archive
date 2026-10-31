package xk;

import java.util.ListIterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class t1 implements ListIterator {

    /* renamed from: a, reason: collision with root package name */
    public boolean f96015a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ListIterator f96016b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ u1 f96017c;

    public t1(u1 u1Var, ListIterator listIterator) {
        this.f96017c = u1Var;
        this.f96016b = listIterator;
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        ListIterator listIterator = this.f96016b;
        listIterator.add(obj);
        listIterator.previous();
        this.f96015a = false;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f96016b.hasPrevious();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f96016b.hasNext();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        ListIterator listIterator = this.f96016b;
        if (!listIterator.hasPrevious()) {
            throw new NoSuchElementException();
        }
        this.f96015a = true;
        return listIterator.previous();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f96017c.d(this.f96016b.nextIndex());
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        ListIterator listIterator = this.f96016b;
        if (!listIterator.hasNext()) {
            throw new NoSuchElementException();
        }
        this.f96015a = true;
        return listIterator.next();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return nextIndex() - 1;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        w20.e.f(this.f96015a);
        this.f96016b.remove();
        this.f96015a = false;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        if (!this.f96015a) {
            throw new IllegalStateException();
        }
        this.f96016b.set(obj);
    }
}
