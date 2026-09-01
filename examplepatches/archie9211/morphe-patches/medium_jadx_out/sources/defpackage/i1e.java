package defpackage;

import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i1e implements ListIterator {
    public final /* synthetic */ int a;
    public ListIterator b;

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        switch (this.a) {
        }
        return this.b.hasNext();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        switch (this.a) {
        }
        return this.b.hasPrevious();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        switch (this.a) {
        }
        return (String) this.b.next();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        switch (this.a) {
        }
        return this.b.nextIndex();
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        switch (this.a) {
        }
        return (String) this.b.previous();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        switch (this.a) {
        }
        return this.b.previousIndex();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }
}
