package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ggc implements n22, Iterable, th6 {
    public final fgc a;
    public final int b;
    public final int c;

    public ggc(fgc fgcVar, int i, int i2) {
        this.a = fgcVar;
        this.b = i;
        this.c = i2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ggc)) {
            return false;
        }
        ggc ggcVar = (ggc) obj;
        return ggcVar.b == this.b && ggcVar.c == this.c && ggcVar.a == this.a;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        fgc fgcVar = this.a;
        if (fgcVar.h != this.c) {
            hgc.e();
        }
        int i = this.b;
        fgcVar.r(i);
        return new yg5(fgcVar, i + 1, fgcVar.a[(i * 5) + 3] + i);
    }
}
