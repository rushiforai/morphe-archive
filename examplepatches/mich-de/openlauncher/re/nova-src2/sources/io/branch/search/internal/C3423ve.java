package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ve, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3423ve implements InterfaceC3406ue {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Id f66191a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final L1 f66192b;

    public C3423ve(@NotNull Id impressionManager, @NotNull L1 branchAnalytics) {
        Intrinsics.g(impressionManager, "impressionManager");
        Intrinsics.g(branchAnalytics, "branchAnalytics");
        this.f66191a = impressionManager;
        this.f66192b = branchAnalytics;
    }

    @Override // io.branch.search.internal.InterfaceC3406ue
    @Nullable
    public final String a(@NotNull String str) {
        String str2 = this.f66192b.a(str).f62474b;
        this.f66191a.a(str2);
        return str2;
    }
}
