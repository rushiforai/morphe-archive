package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class U6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Fb f63434a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final T6 f63435b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3240l0 f63436c;

    public U6(@NotNull Fb remoteBundleDataSource, @NotNull T6 bundleInfoUseCase, @NotNull C3240l0 analyticsSessionRepository) {
        Intrinsics.g(remoteBundleDataSource, "remoteBundleDataSource");
        Intrinsics.g(bundleInfoUseCase, "bundleInfoUseCase");
        Intrinsics.g(analyticsSessionRepository, "analyticsSessionRepository");
        this.f63434a = remoteBundleDataSource;
        this.f63435b = bundleInfoUseCase;
        this.f63436c = analyticsSessionRepository;
    }
}
