package io.branch.search.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.e5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3127e5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<C3110d5> f64363a;

    public C3127e5(@NotNull ArrayList databases) {
        Intrinsics.g(databases, "databases");
        this.f64363a = databases;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof C3127e5) && Intrinsics.b(this.f64363a, ((C3127e5) obj).f64363a);
    }

    public final int hashCode() {
        return this.f64363a.hashCode();
    }

    @NotNull
    public final String toString() {
        return Ob.a(new StringBuilder("DatabaseDiagnosticInfo(databases="), this.f64363a, ')');
    }
}
