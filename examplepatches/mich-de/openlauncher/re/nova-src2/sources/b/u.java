package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.bq;

/* loaded from: classes2.dex */
public final class u extends au0 {
    public final void c(long j11) {
        b();
        bq bqVar = (bq) this.f1095b;
        bqVar.bitField0_ |= 1;
        bqVar.major_ = j11;
    }

    public final void d(long j11) {
        b();
        bq bqVar = (bq) this.f1095b;
        bqVar.bitField0_ |= 4;
        bqVar.micro_ = j11;
    }

    public final void e(long j11) {
        b();
        bq bqVar = (bq) this.f1095b;
        bqVar.bitField0_ |= 2;
        bqVar.minor_ = j11;
    }
}
