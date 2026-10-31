package com.fyber.inneractive.sdk.network.timeouts.request;

import com.fyber.inneractive.sdk.config.global.features.k;

/* loaded from: classes.dex */
public final class d extends a {
    public d(String str, k kVar, String str2) {
        super(str, kVar, str2);
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int a(k kVar, String str) {
        return kVar.c(str, this.f28803l);
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int b(k kVar, String str) {
        String str2 = this.f28803l;
        kVar.getClass();
        String strA = k.a(str, "min", "rat", k.e(str2));
        Integer numA = kVar.a(k.a(str, "min", "rat", "all_mediators"));
        int iIntValue = numA != null ? numA.intValue() : 5000;
        Integer numA2 = kVar.a(strA);
        return numA2 != null ? numA2.intValue() : iIntValue;
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int c(k kVar, String str) {
        String str2 = this.f28803l;
        kVar.getClass();
        String strA = k.a(str, "rat", "perc", k.e(str2));
        String strA2 = k.a(str, "rat", "perc", "all_mediators");
        int iIntValue = "read".equalsIgnoreCase(str) ? 15 : 10;
        Integer numA = kVar.a(strA2);
        if (numA != null) {
            iIntValue = numA.intValue();
        }
        Integer numA2 = kVar.a(strA);
        return numA2 != null ? numA2.intValue() : iIntValue;
    }

    @Override // com.fyber.inneractive.sdk.network.timeouts.request.a
    public final int a(k kVar) {
        String str = this.f28803l;
        kVar.getClass();
        String strA = k.a("timeout", "threshold", k.e(str));
        Integer numA = kVar.a(k.a("timeout", "threshold", "all_mediators"));
        int iIntValue = numA != null ? numA.intValue() : 300;
        Integer numA2 = kVar.a(strA);
        return numA2 != null ? numA2.intValue() : iIntValue;
    }
}
