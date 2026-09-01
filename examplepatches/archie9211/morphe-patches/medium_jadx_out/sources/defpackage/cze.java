package defpackage;

import com.medium.android.graphql.fragment.ResponseItemData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cze implements qze {
    public final ResponseItemData a;

    public cze(ResponseItemData responseItemData) {
        responseItemData.getClass();
        this.a = responseItemData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof cze) && g76.L(this.a, ((cze) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Edit(responseItemData=" + this.a + ")";
    }
}
