package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i97 implements m97 {
    public final SusiDestination a;
    public final String b;

    public i97(String str, SusiDestination susiDestination) {
        str.getClass();
        this.a = susiDestination;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i97)) {
            return false;
        }
        i97 i97Var = (i97) obj;
        return g76.L(this.a, i97Var.a) && g76.L(this.b, i97Var.b);
    }

    public final int hashCode() {
        SusiDestination susiDestination = this.a;
        return this.b.hashCode() + ((susiDestination == null ? 0 : susiDestination.hashCode()) * 31);
    }

    public final String toString() {
        return "NavigateToOnboardingFlow(susiDestination=" + this.a + ", source=" + this.b + ")";
    }
}
