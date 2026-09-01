package defpackage;

import com.medium.android.graphql.fragment.PostClapsData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wr9 implements es9 {
    public final PostClapsData a;

    public wr9(PostClapsData postClapsData) {
        postClapsData.getClass();
        this.a = postClapsData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wr9) && g76.L(this.a, ((wr9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "OnClappedSuccess(postClapsData=" + this.a + ")";
    }
}
