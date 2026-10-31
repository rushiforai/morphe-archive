package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.z0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3477z0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final P1 f66349a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final F2 f66350b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final E0 f66351c;

    public C3477z0(@NotNull P1 branchConfiguration, @NotNull G2 remoteConfigManager, @NotNull E0 appStoreService) {
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(appStoreService, "appStoreService");
        this.f66349a = branchConfiguration;
        this.f66350b = remoteConfigManager;
        this.f66351c = appStoreService;
    }
}
