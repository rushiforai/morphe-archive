package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class E7 implements W5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f62406a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3366s8 f62407b;

    public E7(@NotNull F4 contextDelegate, @NotNull C3366s8 networkInterfaceImpl) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(networkInterfaceImpl, "networkInterfaceImpl");
        this.f62406a = contextDelegate;
        this.f62407b = networkInterfaceImpl;
    }

    @Override // io.branch.search.internal.W5
    public final void a(@NotNull String sessionId, @NotNull U5 collector) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(collector, "collector");
        collector.f63430g = D7.Companion.a(this.f62406a, this.f62407b).a(sessionId);
    }

    @Override // io.branch.search.internal.W5
    @NotNull
    public final String a() {
        return "image_downloader_diagnostic";
    }
}
