package com.vungle.ads.internal;

import com.vungle.ads.internal.util.PathProvider;

/* loaded from: classes4.dex */
public final class v1 extends t1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ServiceLocator f47723b;

    public v1(ServiceLocator serviceLocator) {
        this.f47723b = serviceLocator;
    }

    @Override // com.vungle.ads.internal.t1
    public final Object a() {
        return new PathProvider(this.f47723b.f46727a);
    }
}
