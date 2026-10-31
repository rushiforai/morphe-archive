package io.branch.search.internal;

import io.branch.search.internal.J6;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class H6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final J6 f62580a;

    public H6(@NotNull J6.e rule) {
        Intrinsics.g(rule, "rule");
        this.f62580a = rule;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof H6) && Intrinsics.b(this.f62580a, ((H6) obj).f62580a);
    }

    public final int hashCode() {
        return this.f62580a.hashCode();
    }

    @NotNull
    public final String toString() {
        return "FeatureFlag(rule=" + this.f62580a + ')';
    }
}
