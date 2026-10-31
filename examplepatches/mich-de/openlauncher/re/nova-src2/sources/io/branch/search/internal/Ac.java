package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ac {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<C3489zc> f62040a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<Rb> f62041b;

    /* JADX WARN: Multi-variable type inference failed */
    public Ac(@NotNull List<C3489zc> scheduled, @NotNull List<? extends Rb> drop) {
        Intrinsics.g(scheduled, "scheduled");
        Intrinsics.g(drop, "drop");
        this.f62040a = scheduled;
        this.f62041b = drop;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Ac)) {
            return false;
        }
        Ac ac = (Ac) obj;
        return Intrinsics.b(this.f62040a, ac.f62040a) && Intrinsics.b(this.f62041b, ac.f62041b);
    }

    public final int hashCode() {
        return this.f62041b.hashCode() + (this.f62040a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ScheduleResult(scheduled=");
        sb2.append(this.f62040a);
        sb2.append(", drop=");
        return Ob.a(sb2, this.f62041b, ')');
    }
}
