package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rj0 {
    public final String a;
    public final String b;

    public rj0(String str, String str2) {
        this.a = str;
        if (str2 != null) {
            this.b = str2;
        } else {
            z72.c("Null version");
            throw null;
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof rj0)) {
            return false;
        }
        rj0 rj0Var = (rj0) obj;
        return this.a.equals(rj0Var.a) && this.b.equals(rj0Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() ^ ((this.a.hashCode() ^ 1000003) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LibraryVersion{libraryName=");
        sb.append(this.a);
        sb.append(", version=");
        return ka1.v(sb, this.b, "}");
    }
}
