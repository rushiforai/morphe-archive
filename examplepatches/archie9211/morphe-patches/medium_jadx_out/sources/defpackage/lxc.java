package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lxc implements nxc {
    public final b24 a;

    public lxc(b24 b24Var) {
        this.a = b24Var;
    }

    @Override // defpackage.nxc
    public final boolean a() {
        return false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof lxc) && this.a.equals(((lxc) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode() + 38347;
    }

    public final String toString() {
        return ho2.E("Error(isRefreshing=false, errorState=", this.a, ")");
    }
}
