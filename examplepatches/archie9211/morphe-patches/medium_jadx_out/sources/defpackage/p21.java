package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p21 implements Iterator {
    public q21 a;
    public int b;

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.b < this.a.e.size();
    }

    @Override // java.util.Iterator
    public final Object next() {
        n21 n21Var = (n21) this.a.e.get(this.b);
        this.b++;
        return n21Var;
    }
}
