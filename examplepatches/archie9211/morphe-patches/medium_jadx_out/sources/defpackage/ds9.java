package defpackage;

import com.medium.android.graphql.fragment.PostClapsData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ds9 implements es9 {
    public final PostClapsData a;

    public ds9(PostClapsData postClapsData) {
        postClapsData.getClass();
        this.a = postClapsData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ds9) && g76.L(this.a, ((ds9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UndoClapsSuccess(postClapsData=" + this.a + ")";
    }
}
