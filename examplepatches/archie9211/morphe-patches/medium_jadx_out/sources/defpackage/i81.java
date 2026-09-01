package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i81 extends g81 {
    public final Throwable t;

    public i81(Throwable th) {
        this.t = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof i81) && this.t.equals(((i81) obj).t);
    }

    public final int hashCode() {
        return this.t.hashCode();
    }

    public final String toString() {
        return y30.p("ReportCatalogFailure(exception=", ")", this.t);
    }
}
