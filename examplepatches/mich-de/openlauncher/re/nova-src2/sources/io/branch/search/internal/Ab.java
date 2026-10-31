package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ab {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<C3437wb> f62039a;

    public Ab(@NotNull List<C3437wb> databases) {
        Intrinsics.g(databases, "databases");
        this.f62039a = databases;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof Ab) && Intrinsics.b(this.f62039a, ((Ab) obj).f62039a);
    }

    public final int hashCode() {
        return this.f62039a.hashCode();
    }

    @NotNull
    public final String toString() {
        return Ob.a(new StringBuilder("RawSqliteVersionInfo(databases="), this.f62039a, ')');
    }
}
