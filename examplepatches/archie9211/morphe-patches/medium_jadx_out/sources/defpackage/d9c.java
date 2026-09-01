package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class d9c implements e9c {
    public final String a;
    public final b24 b;

    public d9c(String str, b24 b24Var) {
        str.getClass();
        this.a = str;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d9c)) {
            return false;
        }
        d9c d9cVar = (d9c) obj;
        return g76.L(this.a, d9cVar.a) && this.b.equals(d9cVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "MuteCollectionFailed(collectionId=" + this.a + ", errorState=" + this.b + ")";
    }
}
