package defpackage;

import com.medium.android.graphql.GetPostStatsDetailsQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qa5 implements ra5 {
    public final GetPostStatsDetailsQuery.OnPost a;
    public final GetPostStatsDetailsQuery.PostStatsTotalBundle b;

    public qa5(GetPostStatsDetailsQuery.OnPost onPost, GetPostStatsDetailsQuery.PostStatsTotalBundle postStatsTotalBundle) {
        postStatsTotalBundle.getClass();
        this.a = onPost;
        this.b = postStatsTotalBundle;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qa5)) {
            return false;
        }
        qa5 qa5Var = (qa5) obj;
        return this.a.equals(qa5Var.a) && g76.L(this.b, qa5Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Success(onPost=" + this.a + ", postStatsTotalBundle=" + this.b + ")";
    }
}
