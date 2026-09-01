package defpackage;

import com.medium.android.graphql.fragment.PostClapsData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gze implements qze {
    public final String a;
    public final PostClapsData b;

    public gze(String str, PostClapsData postClapsData) {
        str.getClass();
        postClapsData.getClass();
        this.a = str;
        this.b = postClapsData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gze)) {
            return false;
        }
        gze gzeVar = (gze) obj;
        return g76.L(this.a, gzeVar.a) && g76.L(this.b, gzeVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "OnClapped(responseId=" + this.a + ", postClapsData=" + this.b + ")";
    }
}
