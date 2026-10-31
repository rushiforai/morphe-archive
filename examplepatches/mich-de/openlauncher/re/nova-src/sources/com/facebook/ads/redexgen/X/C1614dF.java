package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.dF, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1614dF<T> {
    public final T A00;
    public final Throwable A01;
    public final boolean A02;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.dF != com.facebook.ads.cache.api.CacheResponse<T> */
    public C1614dF(boolean z11, T result) {
        this.A02 = z11;
        this.A00 = result;
        this.A01 = null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.dF != com.facebook.ads.cache.api.CacheResponse<T> */
    public C1614dF(boolean z11, T result, Throwable th2) {
        this.A02 = z11;
        this.A00 = result;
        this.A01 = th2;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.dF != com.facebook.ads.cache.api.CacheResponse<T> */
    public final T A00() {
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.dF != com.facebook.ads.cache.api.CacheResponse<T> */
    public final boolean A01() {
        return this.A02;
    }
}
