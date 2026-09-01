package defpackage;

import com.medium.android.graphql.FullPostQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bp8 {
    public final String a;
    public final String b;
    public final FullPostQuery.Data c;

    public bp8(String str, String str2, FullPostQuery.Data data) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = data;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bp8)) {
            return false;
        }
        bp8 bp8Var = (bp8) obj;
        return g76.L(this.a, bp8Var.a) && g76.L(this.b, bp8Var.b) && this.c.equals(bp8Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("OfflinePost(id=", this.a, ", latestPublishedVersion=", this.b, ", content=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}
