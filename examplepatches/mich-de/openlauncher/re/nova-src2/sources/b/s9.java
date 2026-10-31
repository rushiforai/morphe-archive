package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.se2;
import ads_mobile_sdk.te2;

/* loaded from: classes.dex */
public final class s9 extends au0 {
    public final void c(long j11) {
        b();
        te2 te2Var = (te2) this.f1095b;
        te2Var.bitField0_ |= 32;
        te2Var.timeInCacheMs_ = j11;
    }

    public final void d(se2 se2Var) {
        b();
        te2 te2Var = (te2) this.f1095b;
        te2Var.getClass();
        te2Var.cacheMissReason_ = se2Var.getNumber();
        te2Var.bitField0_ |= 4;
    }

    public final void e(boolean z11) {
        b();
        te2 te2Var = (te2) this.f1095b;
        te2Var.bitField0_ |= 1;
        te2Var.cacheHit_ = z11;
    }

    public final void f(int i5) {
        b();
        te2 te2Var = (te2) this.f1095b;
        te2Var.bitField0_ |= 8;
        te2Var.numRequestedAds_ = i5;
    }
}
