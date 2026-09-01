package defpackage;

import com.medium.android.graphql.fragment.ResponseItemData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zye implements qze {
    public final ResponseItemData a;

    public zye(ResponseItemData responseItemData) {
        this.a = responseItemData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zye) && this.a.equals(((zye) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Create(responseItemData=" + this.a + ")";
    }
}
