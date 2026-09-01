package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pd7 implements qd7 {
    public final SusiDestination a;
    public final String b;

    public pd7(String str, SusiDestination susiDestination) {
        str.getClass();
        this.a = susiDestination;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pd7)) {
            return false;
        }
        pd7 pd7Var = (pd7) obj;
        return this.a.equals(pd7Var.a) && g76.L(this.b, pd7Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "NavigateToSusiDestination(susiDestination=" + this.a + ", source=" + this.b + ")";
    }
}
