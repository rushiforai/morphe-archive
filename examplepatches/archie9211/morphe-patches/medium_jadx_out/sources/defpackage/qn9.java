package defpackage;

import com.medium.android.graphql.PostRepostersQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qn9 {
    public final PostRepostersQuery.Reposters a;
    public final boolean b;
    public final String c;

    public qn9(PostRepostersQuery.Reposters reposters, boolean z, String str) {
        this.a = reposters;
        this.b = z;
        this.c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qn9)) {
            return false;
        }
        qn9 qn9Var = (qn9) obj;
        return this.a.equals(qn9Var.a) && this.b == qn9Var.b && g76.L(this.c, qn9Var.c);
    }

    public final int hashCode() {
        int iHashCode = ((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31;
        String str = this.c;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("PostRepostersResult(reposters=");
        sb.append(this.a);
        sb.append(", isViewerPostAuthor=");
        sb.append(this.b);
        sb.append(", postShareUrl=");
        return ka1.v(sb, this.c, ")");
    }
}
