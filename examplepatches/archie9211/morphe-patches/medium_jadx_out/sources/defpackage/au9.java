package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class au9 implements ou9 {
    public final eg1 a;

    public au9(eg1 eg1Var) {
        eg1Var.getClass();
        this.a = eg1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof au9) && g76.L(this.a, ((au9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "ShareCatalog(catalogShareData=" + this.a + ")";
    }
}
