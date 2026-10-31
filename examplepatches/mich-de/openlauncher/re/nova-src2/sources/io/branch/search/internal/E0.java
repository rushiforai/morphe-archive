package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class E0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f62379a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f62380b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Z1 f62381c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final F2 f62382d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final A9 f62383e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3366s8 f62384f;

    public E0(@NotNull F4 contextDelegate, @NotNull P1 branchConfiguration, @NotNull Z1 branchDeviceInfo, @NotNull G2 remoteConfigManager, @NotNull B9 networkRepository, @NotNull C3366s8 kNetworkInterfaceImpl) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(kNetworkInterfaceImpl, "kNetworkInterfaceImpl");
        this.f62379a = contextDelegate;
        this.f62380b = branchConfiguration;
        this.f62381c = branchDeviceInfo;
        this.f62382d = remoteConfigManager;
        this.f62383e = networkRepository;
        this.f62384f = kNetworkInterfaceImpl;
    }
}
