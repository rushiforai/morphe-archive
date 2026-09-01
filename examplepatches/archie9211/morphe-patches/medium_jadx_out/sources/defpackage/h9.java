package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h9 implements k9 {
    public final SusiDestination a;
    public final String b;

    public h9(String str, SusiDestination susiDestination) {
        str.getClass();
        this.a = susiDestination;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h9)) {
            return false;
        }
        h9 h9Var = (h9) obj;
        return g76.L(this.a, h9Var.a) && g76.L(this.b, h9Var.b);
    }

    public final int hashCode() {
        SusiDestination susiDestination = this.a;
        return this.b.hashCode() + ((susiDestination == null ? 0 : susiDestination.hashCode()) * 31);
    }

    public final String toString() {
        return "NavigateToOnboardingFlow(susiDestination=" + this.a + ", source=" + this.b + ")";
    }
}
