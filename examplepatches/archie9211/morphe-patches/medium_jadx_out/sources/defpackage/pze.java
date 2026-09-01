package defpackage;

import com.medium.android.graphql.fragment.PostClapsData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pze implements qze {
    public final String a;
    public final PostClapsData b;

    public pze(String str, PostClapsData postClapsData) {
        str.getClass();
        postClapsData.getClass();
        this.a = str;
        this.b = postClapsData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pze)) {
            return false;
        }
        pze pzeVar = (pze) obj;
        return g76.L(this.a, pzeVar.a) && g76.L(this.b, pzeVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "UndoClaps(responseId=" + this.a + ", postClapsData=" + this.b + ")";
    }
}
