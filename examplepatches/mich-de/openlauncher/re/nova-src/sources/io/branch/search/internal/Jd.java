package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Jd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<Kd> f62748a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<Kd> f62749b;

    public Jd(@NotNull List<Kd> setup, @NotNull List<Kd> teardown) {
        Intrinsics.g(setup, "setup");
        Intrinsics.g(teardown, "teardown");
        this.f62748a = setup;
        this.f62749b = teardown;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Jd)) {
            return false;
        }
        Jd jd2 = (Jd) obj;
        return Intrinsics.b(this.f62748a, jd2.f62748a) && Intrinsics.b(this.f62749b, jd2.f62749b);
    }

    public final int hashCode() {
        return this.f62749b.hashCode() + (this.f62748a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SetupTeardownData(setup=");
        sb2.append(this.f62748a);
        sb2.append(", teardown=");
        return Ob.a(sb2, this.f62749b, ')');
    }
}
