package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.p6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3314p6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65474a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f65475b;

    public C3314p6(@NotNull String id2, @NotNull String packageName) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(packageName, "packageName");
        this.f65474a = id2;
        this.f65475b = packageName;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3314p6)) {
            return false;
        }
        C3314p6 c3314p6 = (C3314p6) obj;
        return Intrinsics.b(this.f65474a, c3314p6.f65474a) && Intrinsics.b(this.f65475b, c3314p6.f65475b);
    }

    public final int hashCode() {
        return this.f65475b.hashCode() + (this.f65474a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("EntityActionAnalyticsData(id=");
        sb2.append(this.f65474a);
        sb2.append(", packageName=");
        return Z.a(sb2, this.f65475b, ')');
    }
}
