package defpackage;

import java.util.concurrent.CountDownLatch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uk4 {
    public final CountDownLatch a;
    public gc2 b = null;

    public uk4(CountDownLatch countDownLatch) {
        this.a = countDownLatch;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uk4)) {
            return false;
        }
        uk4 uk4Var = (uk4) obj;
        return this.a.equals(uk4Var.a) && g76.L(this.b, uk4Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        gc2 gc2Var = this.b;
        return iHashCode + (gc2Var == null ? 0 : gc2Var.hashCode());
    }

    public final String toString() {
        return "Dependency(latch=" + this.a + ", subscriber=" + this.b + ')';
    }
}
