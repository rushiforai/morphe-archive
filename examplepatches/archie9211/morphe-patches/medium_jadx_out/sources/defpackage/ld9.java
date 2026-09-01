package defpackage;

import com.medium.android.graphql.FullPostQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ld9 {
    public final FullPostQuery.Data a;
    public final boolean b;

    public ld9(FullPostQuery.Data data, boolean z) {
        this.a = data;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ld9)) {
            return false;
        }
        ld9 ld9Var = (ld9) obj;
        return this.a.equals(ld9Var.a) && this.b == ld9Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Post(data=" + this.a + ", isLocalData=" + this.b + ")";
    }
}
