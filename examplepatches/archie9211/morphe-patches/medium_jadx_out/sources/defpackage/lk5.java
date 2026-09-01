package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lk5 implements pk5 {
    public final ResponsesReference.Post a;
    public final String b;

    public lk5(ResponsesReference.Post post, String str) {
        this.a = post;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lk5)) {
            return false;
        }
        lk5 lk5Var = (lk5) obj;
        return this.a.equals(lk5Var.a) && this.b.equals(lk5Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "NavigateToResponses(responsesReference=" + this.a + ", source=" + this.b + ")";
    }
}
