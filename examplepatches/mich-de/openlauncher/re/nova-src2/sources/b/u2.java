package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.in2;
import java.util.Collections;
import java.util.List;

/* loaded from: classes2.dex */
public final class u2 extends au0 {
    public u2() {
        super(ads_mobile_sdk.g6.DEFAULT_INSTANCE);
    }

    public final void c(long j11) {
        b();
        ads_mobile_sdk.g6 g6Var = (ads_mobile_sdk.g6) this.f1095b;
        g6Var.bitField0_ |= 1;
        g6Var.lastAccessTimeMs_ = j11;
    }

    public final void d(List list) {
        b();
        ads_mobile_sdk.g6 g6Var = (ads_mobile_sdk.g6) this.f1095b;
        e9 e9Var = g6Var.responses_;
        if (!((ads_mobile_sdk.j) e9Var).f5068a) {
            g6Var.responses_ = k9.n(e9Var);
        }
        y2.a(list, g6Var.responses_);
    }

    public final void e() {
        b();
        ads_mobile_sdk.g6 g6Var = (ads_mobile_sdk.g6) this.f1095b;
        g6Var.getClass();
        g6Var.responses_ = in2.f4887e;
    }

    public final List f() {
        return Collections.unmodifiableList(((ads_mobile_sdk.g6) this.f1095b).responses_);
    }
}
