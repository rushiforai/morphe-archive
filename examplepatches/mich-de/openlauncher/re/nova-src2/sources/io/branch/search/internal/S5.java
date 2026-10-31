package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class S5 implements W5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Z1 f63336a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f63337b;

    public S5(@NotNull F4 contextDelegate, @NotNull Z1 branchDeviceInfo, @NotNull P1 branchConfiguration) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        this.f63336a = branchDeviceInfo;
        this.f63337b = branchConfiguration;
    }

    @Override // io.branch.search.internal.W5
    public final void a(@NotNull String sessionId, @NotNull U5 collector) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(collector, "collector");
        Z1 z12 = this.f63336a;
        z12.b(true);
        collector.f63424a = new P5(z12.a(), z12.c());
        collector.f63425b = this.f63337b.a();
    }

    @Override // io.branch.search.internal.W5
    @NotNull
    public final String a() {
        return "device_info_diagnostic";
    }
}
