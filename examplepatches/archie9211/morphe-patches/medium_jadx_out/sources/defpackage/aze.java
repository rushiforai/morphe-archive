package defpackage;

import com.medium.android.graphql.fragment.ResponseItemData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aze implements qze {
    public final String a;
    public final ResponseItemData b;

    public aze(String str, ResponseItemData responseItemData) {
        str.getClass();
        this.a = str;
        this.b = responseItemData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof aze)) {
            return false;
        }
        aze azeVar = (aze) obj;
        return g76.L(this.a, azeVar.a) && this.b.equals(azeVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "CreateReply(inResponseToId=" + this.a + ", responseItemData=" + this.b + ")";
    }
}
