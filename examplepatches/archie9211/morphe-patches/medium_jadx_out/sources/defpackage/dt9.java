package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dt9 implements ou9 {
    public final ResponsesReference.Post a;
    public final String b;

    public dt9(ResponsesReference.Post post, String str) {
        str.getClass();
        this.a = post;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dt9)) {
            return false;
        }
        dt9 dt9Var = (dt9) obj;
        return this.a.equals(dt9Var.a) && g76.L(this.b, dt9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "NavigateToResponses(responsesReference=" + this.a + ", source=" + this.b + ")";
    }
}
