package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gdf {
    public final d04 a;

    public gdf(d04 d04Var) {
        this.a = d04Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof gdf) && g76.L(this.a, ((gdf) obj).a);
    }

    public final int hashCode() {
        d04 d04Var = this.a;
        if (d04Var == null) {
            return 0;
        }
        return d04Var.hashCode();
    }

    public final String toString() {
        return "EntityFeed(entityId=" + this.a + ")";
    }
}
