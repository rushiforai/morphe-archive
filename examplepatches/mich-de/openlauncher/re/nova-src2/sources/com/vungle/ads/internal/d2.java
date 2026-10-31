package com.vungle.ads.internal;

import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.persistence.FilePreferences;

/* loaded from: classes4.dex */
public final class d2 extends t1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ServiceLocator f46763b;

    public d2(ServiceLocator serviceLocator) {
        this.f46763b = serviceLocator;
    }

    @Override // com.vungle.ads.internal.t1
    public final Object a() {
        ServiceLocator serviceLocator = this.f46763b;
        return new VungleApiClient(serviceLocator.f46727a, (com.vungle.ads.internal.platform.f) serviceLocator.a(com.vungle.ads.internal.platform.f.class), (FilePreferences) this.f46763b.a(FilePreferences.class));
    }
}
