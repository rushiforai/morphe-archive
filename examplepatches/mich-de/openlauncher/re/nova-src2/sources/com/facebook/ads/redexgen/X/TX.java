package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

/* loaded from: assets/audience_network/classes.dex */
public final class TX implements InterfaceC1069Lu {
    @Override // com.facebook.ads.redexgen.X.InterfaceC1069Lu
    public final TU A5y(Looper looper, Handler.Callback callback) {
        return new TU(new Handler(looper, callback));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1069Lu
    public final long A6s() {
        return SystemClock.elapsedRealtime();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1069Lu
    public final long ALy() {
        return SystemClock.uptimeMillis();
    }
}
