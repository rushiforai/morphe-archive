package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.hf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3188hf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.c0 f64688a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3277n3 f64689b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final U6 f64690c;

    public C3188hf(@NotNull t70.j1 ioDispatcher, @NotNull C3277n3 bundleRepository, @NotNull U6 getBundleUseCase) {
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        Intrinsics.g(bundleRepository, "bundleRepository");
        Intrinsics.g(getBundleUseCase, "getBundleUseCase");
        this.f64688a = ioDispatcher;
        this.f64689b = bundleRepository;
        this.f64690c = getBundleUseCase;
    }
}
