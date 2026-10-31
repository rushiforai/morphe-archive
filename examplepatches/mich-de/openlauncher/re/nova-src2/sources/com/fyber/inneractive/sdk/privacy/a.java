package com.fyber.inneractive.sdk.privacy;

import com.fyber.inneractive.sdk.config.h;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c f30746a;

    public a(c cVar) {
        this.f30746a = cVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (c.f30748g) {
            try {
                c cVar = this.f30746a;
                if (!cVar.f30751c) {
                    cVar.f30750b.set(null);
                    return;
                }
                String str = (String) cVar.f30750b.getAndSet(null);
                if (str != null) {
                    h hVar = (h) this.f30746a.f30749a;
                    hVar.getClass();
                    IAlog.a("%sIAB app default preference updated (%s) — refreshing cached GDPR/GPP state", "ConfigDataProtectionProvider: ", str);
                    hVar.h();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
