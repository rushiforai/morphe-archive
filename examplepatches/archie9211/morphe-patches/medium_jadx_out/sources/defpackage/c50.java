package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c50 {
    public final String a;
    public final String b;
    public final String c;

    public c50(String str, String str2, String str3) {
        this.a = str;
        this.b = str2;
        this.c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c50)) {
            return false;
        }
        c50 c50Var = (c50) obj;
        return this.a.equals(c50Var.a) && this.b.equals(c50Var.b) && this.c.equals(c50Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CloudBridgeCredentials(datasetID=");
        sb.append(this.a);
        sb.append(", cloudBridgeURL=");
        sb.append(this.b);
        sb.append(", accessKey=");
        return ev6.z(sb, this.c, ')');
    }
}
