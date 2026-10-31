package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.l5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3245l5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3437wb f64959a;

    public C3245l5(@NotNull C3437wb database) {
        Intrinsics.g(database, "database");
        this.f64959a = database;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof C3245l5) && Intrinsics.b(this.f64959a, ((C3245l5) obj).f64959a);
    }

    public final int hashCode() {
        return this.f64959a.hashCode();
    }

    @NotNull
    public final String toString() {
        return "DatabaseVersionInfo(database=" + this.f64959a + ')';
    }
}
