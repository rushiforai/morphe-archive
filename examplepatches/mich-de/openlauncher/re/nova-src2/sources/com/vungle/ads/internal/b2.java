package com.vungle.ads.internal;

import com.vungle.ads.internal.util.PathProvider;

/* loaded from: classes4.dex */
public final class b2 extends t1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ServiceLocator f46741b;

    public b2(ServiceLocator serviceLocator) {
        this.f46741b = serviceLocator;
    }

    @Override // com.vungle.ads.internal.t1
    public final Object a() {
        ServiceLocator serviceLocator = this.f46741b;
        return new com.vungle.ads.internal.task.o(serviceLocator.f46727a, (PathProvider) serviceLocator.a(PathProvider.class));
    }
}
