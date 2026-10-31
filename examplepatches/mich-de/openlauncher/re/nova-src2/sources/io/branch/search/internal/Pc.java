package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Pc {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f63088a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f63089b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final F2 f63090c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Z1 f63091d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final InterfaceC3164g8 f63092e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3352rb f63093f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final A9 f63094g;

    public static final class a {
    }

    public Pc(@NotNull F4 contextDelegate, @NotNull P1 branchConfiguration, @NotNull G2 remoteConfigManager, @NotNull Z1 deviceInfo, @NotNull InterfaceC3164g8 jobManager, @NotNull C3352rb db2, @NotNull B9 networkRepository) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(deviceInfo, "deviceInfo");
        Intrinsics.g(jobManager, "jobManager");
        Intrinsics.g(db2, "db");
        Intrinsics.g(networkRepository, "networkRepository");
        this.f63088a = contextDelegate;
        this.f63089b = branchConfiguration;
        this.f63090c = remoteConfigManager;
        this.f63091d = deviceInfo;
        this.f63092e = jobManager;
        this.f63093f = db2;
        this.f63094g = networkRepository;
    }
}
