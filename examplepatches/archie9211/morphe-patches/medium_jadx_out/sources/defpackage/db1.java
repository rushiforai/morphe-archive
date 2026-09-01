package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class db1 implements bc1 {
    public final String a;
    public final String b;

    public db1(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof db1)) {
            return false;
        }
        db1 db1Var = (db1) obj;
        return g76.L(this.a, db1Var.a) && this.b.equals(db1Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("DeleteListConfirmation(catalogId=", this.a, ", source=", this.b, ")");
    }
}
