package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class T6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3176h3 f63380a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3240l0 f63381b;

    public T6(@NotNull C3176h3 bundleInfoDataSource, @NotNull C3240l0 analyticsSessionRepository) {
        Intrinsics.g(bundleInfoDataSource, "bundleInfoDataSource");
        Intrinsics.g(analyticsSessionRepository, "analyticsSessionRepository");
        this.f63380a = bundleInfoDataSource;
        this.f63381b = analyticsSessionRepository;
    }
}
