package defpackage;

import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hxf extends ugf implements ListIterator {
    public final int b;
    public int c;
    public final ayf d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hxf(ayf ayfVar, int i) {
        super(5);
        int size = ayfVar.size();
        if (i < 0 || i > size) {
            z10.i(jq7.C(i, size, "index"));
            throw null;
        }
        this.b = size;
        this.c = i;
        this.d = ayfVar;
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    public final Object b(int i) {
        return this.d.get(i);
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final boolean hasNext() {
        return this.c < this.b;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.c > 0;
    }

    @Override // defpackage.ugf, java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        int i = this.c;
        this.c = i + 1;
        return b(i);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.c;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            ywb.n();
            return null;
        }
        int i = this.c - 1;
        this.c = i;
        return b(i);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.c - 1;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
