package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yr3 implements as3 {
    public final rg1 a;

    public yr3(rg1 rg1Var) {
        this.a = rg1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof yr3) && this.a.equals(((yr3) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "MakeCatalogPrivateConfirmation(catalogUiModel=" + this.a + ")";
    }
}
