package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nkc implements n22, Iterable, th6 {
    public final fgc a;
    public final int b;
    public final d3b c;

    public nkc(fgc fgcVar, int i, r65 r65Var, d3b d3bVar) {
        this.a = fgcVar;
        this.b = i;
        this.c = d3bVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof nkc)) {
            return false;
        }
        nkc nkcVar = (nkc) obj;
        return nkcVar.b == this.b && nkcVar.a == this.a && nkcVar.c.equals(this.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.a.hashCode() + (this.b * 31)) * 31);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new mkc(this.a, this.b, null, this.c);
    }
}
