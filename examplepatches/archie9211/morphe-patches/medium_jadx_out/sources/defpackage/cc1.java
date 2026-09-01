package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cc1 implements ec1 {
    public final String a;
    public final String b;

    public cc1(String str) {
        str.getClass();
        this.a = str;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof cc1) && g76.L(this.a, ((cc1) obj).a);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.b;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ev6.x("Deleted(itemId=", this.a, ")");
    }
}
