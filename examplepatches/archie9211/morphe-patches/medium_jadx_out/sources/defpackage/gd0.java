package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gd0 implements kd0 {
    public final SusiDestination a;
    public final String b;

    public gd0(String str, SusiDestination susiDestination) {
        this.a = susiDestination;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gd0)) {
            return false;
        }
        gd0 gd0Var = (gd0) obj;
        return g76.L(this.a, gd0Var.a) && this.b.equals(gd0Var.b);
    }

    public final int hashCode() {
        SusiDestination susiDestination = this.a;
        return this.b.hashCode() + ((susiDestination == null ? 0 : susiDestination.hashCode()) * 31);
    }

    public final String toString() {
        return "NavigateToOnboarding(susiDestination=" + this.a + ", source=" + this.b + ")";
    }
}
