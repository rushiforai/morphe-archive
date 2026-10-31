package com.fyber.inneractive.sdk.network.timeouts.request;

import com.fyber.inneractive.sdk.config.global.features.k;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class c extends a {

    /* renamed from: m, reason: collision with root package name */
    public double f28804m;

    public c(String str, k kVar, String str2) {
        super(str, kVar, str2);
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int a(k kVar, String str) {
        return kVar.b(str, this.f28803l);
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int b(k kVar, String str) {
        String str2 = this.f28803l;
        kVar.getClass();
        String strA = k.a(str, "min", "rat", "bidding", k.e(str2));
        Integer numA = kVar.a(k.a(str, "min", "rat", "bidding", "all_mediators"));
        int iIntValue = numA != null ? numA.intValue() : 5000;
        Integer numA2 = kVar.a(strA);
        return numA2 != null ? numA2.intValue() : iIntValue;
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int c(k kVar, String str) {
        String str2 = this.f28803l;
        kVar.getClass();
        String strA = k.a(str, "rat", "bidding", "perc", k.e(str2));
        Integer numA = kVar.a(k.a(str, "rat", "bidding", "perc", "all_mediators"));
        int iIntValue = numA != null ? numA.intValue() : 15;
        Integer numA2 = kVar.a(strA);
        return numA2 != null ? numA2.intValue() : iIntValue;
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final void d(k kVar, String str) {
        super.d(kVar, str);
        Boolean boolC = kVar.c("reverse_retries");
        this.f28797g = boolC != null ? boolC.booleanValue() : true;
        String strA = k.a("retry_interval", "rat", "bidding");
        Integer numA = kVar.a(k.a("retry_interval", "all_mediators"));
        int iIntValue = numA != null ? numA.intValue() : 100;
        Integer numA2 = kVar.a(strA);
        if (numA2 != null) {
            iIntValue = numA2.intValue();
        }
        this.f28795e = iIntValue;
        this.f28793c = (this.f28800i + this.f28799h) - (iIntValue + this.f28796f);
        String strA2 = k.a("bidding", "irat", k.e(this.f28803l));
        Integer numA3 = kVar.a(k.a("bidding", "irat", "all_mediators"));
        int iIntValue2 = numA3 != null ? numA3.intValue() : 10000;
        Integer numA4 = kVar.a(strA2);
        if (numA4 != null) {
            iIntValue2 = numA4.intValue();
        }
        this.f28794d = iIntValue2;
        this.f28804m = Math.min(this.f28802k, this.f28801j) / Math.max(this.f28802k, this.f28801j);
        b(this.f28794d);
        this.f28791a = Math.max(0, a());
        if (this.f28797g) {
            IAlog.a("%s : RequestBiddingAdTimeout shouldReverseRetries - reversing timeouts", IAlog.a(this));
            a(0);
        }
        IAlog.a("%s : RequestBiddingAdTimeout init timeouts, total retries: %d", IAlog.a(this), Integer.valueOf(this.f28791a));
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int a(k kVar) {
        String str = this.f28803l;
        kVar.getClass();
        String strA = k.a("timeout", "threshold", "rat", "bidding", k.e(str));
        Integer numA = kVar.a(k.a("timeout", "threshold", "rat", "bidding", "all_mediators"));
        int iIntValue = numA != null ? numA.intValue() : 300;
        Integer numA2 = kVar.a(strA);
        return numA2 != null ? numA2.intValue() : iIntValue;
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int c() {
        return this.f28795e;
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int b() {
        return this.f28791a;
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int a(int i5) {
        if (this.f28797g) {
            i5 = this.f28791a - i5;
        }
        int i11 = (this.f28792b * i5) + this.f28794d;
        IAlog.a("%s : RequestBiddingAdTimeout resolveTimeoutForRetry, timeout: %d ms for retry: %d", IAlog.a(this), Integer.valueOf(i11), Integer.valueOf(i5));
        b(i11);
        return i11;
    }

    public final void b(int i5) {
        double d5 = this.f28804m;
        if (d5 == 1.0d || d5 == 0.0d) {
            IAlog.a("%s : RequestBiddingAdTimeout Ratio: %f, connection and read timeouts should be divided in equal proportions", IAlog.a(this), Double.valueOf(this.f28804m));
            this.f28804m = 0.5d;
        }
        int i11 = (int) (i5 * this.f28804m);
        this.f28799h = i11;
        this.f28800i = i5 - i11;
        IAlog.a("%s : RequestBiddingAdTimeout Update timeouts connection: %d read: %d", IAlog.a(this), Integer.valueOf(this.f28800i), Integer.valueOf(this.f28799h));
    }
}
