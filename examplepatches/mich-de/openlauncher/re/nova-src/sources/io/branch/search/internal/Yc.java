package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Yc {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Integer f63774a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<Ic> f63775b;

    public Yc(@Nullable Integer num, @NotNull List<Ic> scheduled_queries) {
        Intrinsics.g(scheduled_queries, "scheduled_queries");
        this.f63774a = num;
        this.f63775b = scheduled_queries;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Yc)) {
            return false;
        }
        Yc yc = (Yc) obj;
        return Intrinsics.b(this.f63774a, yc.f63774a) && Intrinsics.b(this.f63775b, yc.f63775b);
    }

    public final int hashCode() {
        Integer num = this.f63774a;
        return this.f63775b.hashCode() + ((num == null ? 0 : num.hashCode()) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ScheduledQueryTransactionGroup(transaction_group_id=");
        sb2.append(this.f63774a);
        sb2.append(", scheduled_queries=");
        return Ob.a(sb2, this.f63775b, ')');
    }
}
