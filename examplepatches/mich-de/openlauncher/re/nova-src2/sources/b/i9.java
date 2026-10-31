package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.ri2;

/* loaded from: classes2.dex */
public final class i9 extends au0 {
    public i9() {
        super(ri2.DEFAULT_INSTANCE);
    }

    public final void c(int i5) {
        b();
        ((ri2) this.f1095b).maxBufferSize_ = i5;
    }

    public final void d(boolean z11) {
        b();
        ((ri2) this.f1095b).cacheHit_ = z11;
    }

    public final void e(int i5) {
        b();
        ((ri2) this.f1095b).numPreloadedAds_ = i5;
    }

    public final void f(boolean z11) {
        b();
        ((ri2) this.f1095b).preloadInFlight_ = z11;
    }
}
