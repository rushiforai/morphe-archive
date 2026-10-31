package com.vungle.ads.internal;

import com.vungle.ads.internal.util.PathProvider;

/* loaded from: classes4.dex */
public final class x1 extends t1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ServiceLocator f47736b;

    public x1(ServiceLocator serviceLocator) {
        this.f47736b = serviceLocator;
    }

    @Override // com.vungle.ads.internal.t1
    public final Object a() {
        return new com.vungle.ads.internal.downloader.t((com.vungle.ads.internal.executor.a) this.f47736b.a(com.vungle.ads.internal.executor.a.class), (PathProvider) this.f47736b.a(PathProvider.class));
    }
}
