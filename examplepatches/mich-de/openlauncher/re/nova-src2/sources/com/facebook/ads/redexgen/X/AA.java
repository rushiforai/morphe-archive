package com.facebook.ads.redexgen.X;

import android.os.SystemClock;

/* loaded from: assets/audience_network/classes.dex */
public final class AA implements YO {
    public static final AA A00 = new AA();

    public static AA A00() {
        return A00;
    }

    @Override // com.facebook.ads.redexgen.X.YO
    public final long ADW() {
        return SystemClock.elapsedRealtime();
    }
}
