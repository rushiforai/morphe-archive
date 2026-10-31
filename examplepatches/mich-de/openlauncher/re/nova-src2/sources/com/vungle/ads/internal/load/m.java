package com.vungle.ads.internal.load;

import com.vungle.ads.internal.network.VungleApiClient;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final VungleApiClient f46913a;

    public m(VungleApiClient apiClient) {
        Intrinsics.g(apiClient, "apiClient");
        this.f46913a = apiClient;
    }

    public final void a(String adm) {
        Intrinsics.g(adm, "adm");
        this.f46913a.d(adm);
    }
}
