package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.protocol.AdErrorType;

/* renamed from: com.facebook.ads.redexgen.X.nu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2263nu extends Exception {
    public final AdErrorType A00;
    public final String A01;

    public C2263nu(AdErrorType adErrorType, String str) {
        this(adErrorType, str, null);
    }

    public C2263nu(AdErrorType adErrorType, String str, Throwable th2) {
        super(str, th2);
        this.A00 = adErrorType;
        this.A01 = str;
    }

    public final AdErrorType A00() {
        return this.A00;
    }

    public final String A01() {
        return this.A01;
    }
}
