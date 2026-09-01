package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j97 implements m97 {
    public final SusiDestination a;
    public final String b;

    public j97(String str, SusiDestination susiDestination) {
        susiDestination.getClass();
        str.getClass();
        this.a = susiDestination;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j97)) {
            return false;
        }
        j97 j97Var = (j97) obj;
        return g76.L(this.a, j97Var.a) && g76.L(this.b, j97Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "NavigateToSusiDestination(susiDestination=" + this.a + ", source=" + this.b + ")";
    }
}
