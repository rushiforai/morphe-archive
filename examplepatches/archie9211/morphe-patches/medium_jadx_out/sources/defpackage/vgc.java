package defpackage;

import java.util.AbstractList;
import java.util.ConcurrentModificationException;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vgc implements Iterator {
    public boolean a;
    public final int b;
    public final /* synthetic */ wgc c;

    public vgc(wgc wgcVar) {
        this.c = wgcVar;
        this.b = ((AbstractList) wgcVar).modCount;
    }

    public final void a() {
        wgc wgcVar = this.c;
        int i = ((AbstractList) wgcVar).modCount;
        int i2 = this.b;
        if (i == i2) {
            return;
        }
        throw new ConcurrentModificationException("ModCount: " + ((AbstractList) wgcVar).modCount + "; expected: " + i2);
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return !this.a;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.a) {
            ywb.n();
            return null;
        }
        this.a = true;
        a();
        return this.c.b;
    }

    @Override // java.util.Iterator
    public final void remove() {
        a();
        this.c.clear();
    }
}
