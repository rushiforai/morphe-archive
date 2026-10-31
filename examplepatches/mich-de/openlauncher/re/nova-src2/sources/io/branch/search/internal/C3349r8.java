package io.branch.search.internal;

import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.r8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3349r8 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65615a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<BranchContainer<BranchEntity>> f65616b;

    /* JADX WARN: Multi-variable type inference failed */
    public C3349r8(@NotNull String query, @NotNull List<? extends BranchContainer<BranchEntity>> containers) {
        Intrinsics.g(query, "query");
        Intrinsics.g(containers, "containers");
        this.f65615a = query;
        this.f65616b = containers;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3349r8)) {
            return false;
        }
        C3349r8 c3349r8 = (C3349r8) obj;
        return Intrinsics.b(this.f65615a, c3349r8.f65615a) && Intrinsics.b(this.f65616b, c3349r8.f65616b);
    }

    public final int hashCode() {
        return this.f65616b.hashCode() + (this.f65615a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("KBranchSearchResult(query=");
        sb2.append(this.f65615a);
        sb2.append(", containers=");
        return Ob.a(sb2, this.f65616b, ')');
    }
}
