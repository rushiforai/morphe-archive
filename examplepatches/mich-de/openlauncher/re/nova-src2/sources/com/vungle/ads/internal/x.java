package com.vungle.ads.internal;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/* loaded from: classes4.dex */
public final class x implements w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ BlockingQueue f47734a;

    public x(LinkedBlockingQueue linkedBlockingQueue) {
        this.f47734a = linkedBlockingQueue;
    }

    @Override // com.vungle.ads.internal.w
    public final void a() {
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Failed to send ");
        sbA.append(this.f47734a.size());
        sbA.append(" errors");
        com.vungle.ads.internal.util.t.a("AnalyticsClient", sbA.toString());
        AnalyticsClient.INSTANCE.getClass();
        AnalyticsClient.f46705a.addAll(this.f47734a);
    }

    @Override // com.vungle.ads.internal.w
    public final void onSuccess() {
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Sent ");
        sbA.append(this.f47734a.size());
        sbA.append(" errors");
        com.vungle.ads.internal.util.t.a("AnalyticsClient", sbA.toString());
    }
}
