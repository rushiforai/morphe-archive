package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b81 extends o81 {
    public final rg1 t;

    public b81(rg1 rg1Var) {
        rg1Var.getClass();
        this.t = rg1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b81) && g76.L(this.t, ((b81) obj).t);
    }

    public final int hashCode() {
        return this.t.hashCode();
    }

    public final String toString() {
        return "MakeCatalogPrivateConfirmation(catalogUiModel=" + this.t + ")";
    }
}
