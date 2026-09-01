package defpackage;

import com.medium.android.graphql.type.CatalogItemType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ud1 {
    public final CatalogItemType a;
    public final String b;

    public ud1(String str) {
        str.getClass();
        this.a = CatalogItemType.POST;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ud1) && g76.L(this.b, ((ud1) obj).b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    public final String toString() {
        return ev6.x("Post(postId=", this.b, ")");
    }
}
