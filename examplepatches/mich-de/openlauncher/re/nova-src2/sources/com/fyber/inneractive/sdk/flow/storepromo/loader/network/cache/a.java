package com.fyber.inneractive.sdk.flow.storepromo.loader.network.cache;

import com.fyber.inneractive.sdk.util.o;

/* loaded from: classes3.dex */
public final class a implements com.fyber.inneractive.sdk.cache.a {

    /* renamed from: a, reason: collision with root package name */
    public final String f28351a;

    public a(String str) {
        this.f28351a = str;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final Object a(String str) {
        return str;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String b() {
        return "IALastModifiedFromHeader.dt_storepromo";
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String c() {
        return String.valueOf(("dt_store.promo_" + this.f28351a).hashCode());
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final boolean d() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final void a(Object obj) {
        String str = (String) obj;
        if (str != null) {
            o.f31210a.getSharedPreferences("IAConfigurationPreferences", 0).edit().putString("dt_store.promo.data", str).apply();
        }
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String a() {
        return this.f28351a;
    }
}
