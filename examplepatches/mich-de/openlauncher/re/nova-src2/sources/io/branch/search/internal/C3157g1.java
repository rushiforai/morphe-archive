package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.g1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3157g1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<String> f64543a;

    public C3157g1(@NotNull List<String> containers) {
        Intrinsics.g(containers, "containers");
        this.f64543a = containers;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof C3157g1) && Intrinsics.b(this.f64543a, ((C3157g1) obj).f64543a);
    }

    public final int hashCode() {
        return this.f64543a.hashCode();
    }

    @NotNull
    public final String toString() {
        return Ob.a(new StringBuilder("AutoSuggestRequestAnalyticsData(containers="), this.f64543a, ')');
    }
}
