package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class N4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<G6> f62969a;

    public N4(@NotNull List<G6> failures) {
        Intrinsics.g(failures, "failures");
        this.f62969a = failures;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof N4) && Intrinsics.b(this.f62969a, ((N4) obj).f62969a);
    }

    public final int hashCode() {
        return this.f62969a.hashCode();
    }

    @NotNull
    public final String toString() {
        return Ob.a(new StringBuilder("CrashInfoData(failures="), this.f62969a, ')');
    }
}
