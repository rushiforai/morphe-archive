package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v71 extends s71 {
    public final rg1 t;

    public v71(rg1 rg1Var) {
        rg1Var.getClass();
        this.t = rg1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v71) && g76.L(this.t, ((v71) obj).t);
    }

    public final int hashCode() {
        return this.t.hashCode();
    }

    public final String toString() {
        return "EditCatalog(catalogUiModel=" + this.t + ")";
    }
}
