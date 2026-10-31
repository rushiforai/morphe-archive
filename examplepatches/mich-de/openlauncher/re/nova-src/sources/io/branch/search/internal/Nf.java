package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Nf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62997a;

    public Nf() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof Nf) && Intrinsics.b(this.f62997a, ((Nf) obj).f62997a);
    }

    public final int hashCode() {
        return this.f62997a.hashCode();
    }

    @NotNull
    public final String toString() {
        return Z.a(new StringBuilder("ZeroStateCacheRemoteConfig(strategy="), this.f62997a, ')');
    }

    public Nf(@NotNull String strategy) {
        Intrinsics.g(strategy, "strategy");
        this.f62997a = strategy;
    }

    public /* synthetic */ Nf(int i5) {
        this("ALWAYS");
    }
}
