package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yg5 implements Iterator, th6 {
    public final fgc a;
    public final int b;
    public int c;
    public final int d;

    public yg5(fgc fgcVar, int i, int i2) {
        this.a = fgcVar;
        this.b = i2;
        this.c = i;
        this.d = fgcVar.h;
        if (fgcVar.g) {
            hgc.e();
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.c < this.b;
    }

    @Override // java.util.Iterator
    public final Object next() {
        fgc fgcVar = this.a;
        int i = fgcVar.h;
        int i2 = this.d;
        if (i != i2) {
            hgc.e();
        }
        int i3 = this.c;
        this.c = fgcVar.a[(i3 * 5) + 3] + i3;
        return new ggc(fgcVar, i3, i2);
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
