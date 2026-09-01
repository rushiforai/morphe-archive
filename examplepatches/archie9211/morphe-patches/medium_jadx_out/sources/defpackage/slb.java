package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class slb implements Iterator {
    public final rlb a;
    public x11 b;
    public int c;

    public slb(tlb tlbVar) {
        rlb rlbVar = new rlb(tlbVar);
        this.a = rlbVar;
        this.b = new x11(rlbVar.a());
        this.c = tlbVar.b;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.c > 0;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!this.b.hasNext()) {
            this.b = new x11(this.a.a());
        }
        this.c--;
        return Byte.valueOf(this.b.a());
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
