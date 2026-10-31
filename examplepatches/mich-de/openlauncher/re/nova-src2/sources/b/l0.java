package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.cq0;

/* loaded from: classes2.dex */
public final class l0 extends au0 {
    public final void c(int i5) {
        b();
        cq0 cq0Var = (cq0) this.f1095b;
        cq0Var.bitField0_ |= 2;
        cq0Var.sessionsSinceUpdate_ = i5;
    }

    public final int d() {
        return ((cq0) this.f1095b).sessionsSinceUpdate_;
    }

    public final void e() {
        b();
        cq0 cq0Var = (cq0) this.f1095b;
        cq0Var.bitField0_ |= 4;
        cq0Var.hasSdkInitializedPreviously_ = true;
    }
}
