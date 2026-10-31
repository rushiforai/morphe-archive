package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ld {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62852a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final List<String[]> f62853b;

    public Ld(@NotNull String query, @Nullable List<String[]> list) {
        Intrinsics.g(query, "query");
        this.f62852a = query;
        this.f62853b = list;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Ld)) {
            return false;
        }
        Ld ld2 = (Ld) obj;
        return Intrinsics.b(this.f62852a, ld2.f62852a) && Intrinsics.b(this.f62853b, ld2.f62853b);
    }

    public final int hashCode() {
        int iHashCode = this.f62852a.hashCode() * 31;
        List<String[]> list = this.f62853b;
        return iHashCode + (list == null ? 0 : list.hashCode());
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SetupTeardownStatement(query=");
        sb2.append(this.f62852a);
        sb2.append(", params=");
        return Ob.a(sb2, this.f62853b, ')');
    }
}
