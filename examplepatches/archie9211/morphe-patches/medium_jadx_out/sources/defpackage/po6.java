package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class po6 implements qo6 {
    public final SusiDestination a;
    public final String b;

    public po6(String str, SusiDestination susiDestination) {
        this.a = susiDestination;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof po6)) {
            return false;
        }
        po6 po6Var = (po6) obj;
        return g76.L(this.a, po6Var.a) && this.b.equals(po6Var.b);
    }

    public final int hashCode() {
        SusiDestination susiDestination = this.a;
        return this.b.hashCode() + ((susiDestination == null ? 0 : susiDestination.hashCode()) * 31);
    }

    public final String toString() {
        return "NavigateToSusi(susiDestination=" + this.a + ", referrerSource=" + this.b + ")";
    }
}
