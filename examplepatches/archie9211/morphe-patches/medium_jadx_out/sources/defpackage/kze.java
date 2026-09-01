package defpackage;

import com.medium.android.graphql.type.ResponseSortType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kze implements qze {
    public final ResponseSortType a;

    public kze(ResponseSortType responseSortType) {
        this.a = responseSortType;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof kze) && this.a == ((kze) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Sort(sortType=" + this.a + ")";
    }
}
