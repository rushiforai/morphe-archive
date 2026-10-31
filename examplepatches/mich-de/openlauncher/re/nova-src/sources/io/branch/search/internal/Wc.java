package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Wc {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Pc f63602a;

    public Wc(@NotNull F4 contextDelegate, @NotNull P1 branchConfiguration, @NotNull G2 remoteConfigManager, @NotNull Z1 deviceInfo, @NotNull InterfaceC3164g8 jobManager, @NotNull C3352rb rawSQLiteDB, @NotNull B9 networkRepository) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(deviceInfo, "deviceInfo");
        Intrinsics.g(jobManager, "jobManager");
        Intrinsics.g(rawSQLiteDB, "rawSQLiteDB");
        Intrinsics.g(networkRepository, "networkRepository");
        this.f63602a = new Pc(contextDelegate, branchConfiguration, remoteConfigManager, deviceInfo, jobManager, rawSQLiteDB, networkRepository);
    }
}
