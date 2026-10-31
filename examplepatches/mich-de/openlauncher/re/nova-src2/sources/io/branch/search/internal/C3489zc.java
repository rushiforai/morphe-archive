package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.zc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3489zc {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Rb f66372a;

    /* renamed from: b, reason: collision with root package name */
    public final long f66373b;

    public C3489zc(@NotNull Rb entry, long j11) {
        Intrinsics.g(entry, "entry");
        this.f66372a = entry;
        this.f66373b = j11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3489zc)) {
            return false;
        }
        C3489zc c3489zc = (C3489zc) obj;
        return Intrinsics.b(this.f66372a, c3489zc.f66372a) && this.f66373b == c3489zc.f66373b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f66373b) + (this.f66372a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Schedule(entry=");
        sb2.append(this.f66372a);
        sb2.append(", nextExecutionTime=");
        return C3380t5.a(sb2, this.f66373b, ')');
    }
}
