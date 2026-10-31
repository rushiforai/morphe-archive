package io.branch.search.internal;

import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.wb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3437wb {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final List<EnumC3285nb> f66234a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Map<String, String> f66235b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f66236c;

    /* JADX WARN: Multi-variable type inference failed */
    public C3437wb(@Nullable List<? extends EnumC3285nb> list, @NotNull Map<String, String> versions, @NotNull String db2) {
        Intrinsics.g(versions, "versions");
        Intrinsics.g(db2, "db");
        this.f66234a = list;
        this.f66235b = versions;
        this.f66236c = db2;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3437wb)) {
            return false;
        }
        C3437wb c3437wb = (C3437wb) obj;
        return Intrinsics.b(this.f66234a, c3437wb.f66234a) && Intrinsics.b(this.f66235b, c3437wb.f66235b) && Intrinsics.b(this.f66236c, c3437wb.f66236c);
    }

    public final int hashCode() {
        List<EnumC3285nb> list = this.f66234a;
        return this.f66236c.hashCode() + x8.h.c(this.f66235b, (list == null ? 0 : list.hashCode()) * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RawSqliteDatabaseInfo(servingQueriesFor=");
        sb2.append(this.f66234a);
        sb2.append(", versions=");
        sb2.append(this.f66235b);
        sb2.append(", db=");
        return Z.a(sb2, this.f66236c, ')');
    }
}
