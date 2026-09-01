package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sva implements lfc {
    public final cfc b;

    public sva(cfc cfcVar) {
        this.b = cfcVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof sva) && g76.L(this.b, ((sva) obj).b);
    }

    @Override // defpackage.lfc
    public final Object f(p92 p92Var) {
        return this.b;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    public final String toString() {
        return "RealSizeResolver(size=" + this.b + ')';
    }
}
