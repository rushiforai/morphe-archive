package com.fyber.inneractive.sdk.util;

/* loaded from: classes3.dex */
public final class l implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.cache.a f31200a;

    public l(com.fyber.inneractive.sdk.cache.a aVar) {
        this.f31200a = aVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        com.fyber.inneractive.sdk.cache.a aVar;
        try {
            if (o.f31210a == null || (aVar = this.f31200a) == null) {
                return;
            }
            o.f31210a.getSharedPreferences("IAConfigurationPreferences", 0).edit().remove(aVar.b()).apply();
        } catch (Throwable unused) {
        }
    }
}
