package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ta7 implements Iterator, th6 {
    public final long a;
    public boolean b;
    public long c;

    public ta7(long j, long j2) {
        this.a = j2;
        boolean z = j <= j2;
        this.b = z;
        this.c = z ? j : j2;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.b;
    }

    @Override // java.util.Iterator
    public final Object next() {
        long j = this.c;
        if (j != this.a) {
            this.c = 1 + j;
        } else {
            if (!this.b) {
                ywb.n();
                return null;
            }
            this.b = false;
        }
        return Long.valueOf(j);
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
