package com.vungle.ads.internal;

import com.vungle.ads.internal.persistence.FilePreferences;
import com.vungle.ads.internal.util.PathProvider;

/* loaded from: classes4.dex */
public final class i2 extends t1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ServiceLocator f46857b;

    public i2(ServiceLocator serviceLocator) {
        this.f46857b = serviceLocator;
    }

    @Override // com.vungle.ads.internal.t1
    public final Object a() {
        return FilePreferences.f47336d.a(((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) this.f46857b.a(com.vungle.ads.internal.executor.a.class))).f46820a, (PathProvider) this.f46857b.a(PathProvider.class), "settings_vungle");
    }
}
