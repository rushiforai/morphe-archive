package defpackage;

import com.medium.android.graphql.GetPostPublishingDataQuery;
import com.medium.android.graphql.fragment.DraftData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ja5 implements la5 {
    public final DraftData a;
    public final GetPostPublishingDataQuery.Post b;

    public ja5(DraftData draftData, GetPostPublishingDataQuery.Post post) {
        this.a = draftData;
        this.b = post;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ja5)) {
            return false;
        }
        ja5 ja5Var = (ja5) obj;
        return this.a.equals(ja5Var.a) && this.b.equals(ja5Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Success(draftData=" + this.a + ", postData=" + this.b + ")";
    }
}
