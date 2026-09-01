package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mkc implements Iterator, th6 {
    public final fgc a;
    public final int b;
    public final fp7 c;
    public final int d;
    public int e;

    public mkc(fgc fgcVar, int i, r65 r65Var, fp7 fp7Var) {
        this.a = fgcVar;
        this.b = i;
        this.c = fp7Var;
        this.d = fgcVar.h;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        throw null;
    }

    @Override // java.util.Iterator
    public final Object next() {
        throw null;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
