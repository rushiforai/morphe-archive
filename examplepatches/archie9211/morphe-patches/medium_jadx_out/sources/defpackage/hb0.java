package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hb0 implements jb0 {
    public final b24 a;

    public hb0(b24 b24Var) {
        this.a = b24Var;
    }

    @Override // defpackage.jb0
    public final boolean a() {
        return false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof hb0) && this.a.equals(((hb0) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode() + 38347;
    }

    public final String toString() {
        return ho2.E("Error(isRefreshing=false, errorState=", this.a, ")");
    }
}
