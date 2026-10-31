package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Cf {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final ag f62315a;

    public static final class a {
    }

    public Cf() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof Cf) && this.f62315a == ((Cf) obj).f62315a;
    }

    public final int hashCode() {
        return this.f62315a.hashCode();
    }

    @NotNull
    public final String toString() {
        return "ZeroStateCacheConfig(strategy=" + this.f62315a + ')';
    }

    public /* synthetic */ Cf(int i5) {
        this(ag.INIT);
    }

    public Cf(@NotNull ag strategy) {
        Intrinsics.g(strategy, "strategy");
        this.f62315a = strategy;
    }
}
