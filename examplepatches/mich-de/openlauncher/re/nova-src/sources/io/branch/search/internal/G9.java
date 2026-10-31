package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Collection;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class G9 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62519a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Collection<String> f62520b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62521c;

    /* renamed from: d, reason: collision with root package name */
    public final int f62522d;

    public G9(@NotNull String id2, @NotNull ArrayList sessionIds, long j11, int i5) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(sessionIds, "sessionIds");
        this.f62519a = id2;
        this.f62520b = sessionIds;
        this.f62521c = j11;
        this.f62522d = i5;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof G9)) {
            return false;
        }
        G9 g92 = (G9) obj;
        return Intrinsics.b(this.f62519a, g92.f62519a) && Intrinsics.b(this.f62520b, g92.f62520b) && this.f62521c == g92.f62521c && this.f62522d == g92.f62522d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f62522d) + C3231k8.a(this.f62521c, (this.f62520b.hashCode() + (this.f62519a.hashCode() * 31)) * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("OffloadFuture(id=");
        sb2.append(this.f62519a);
        sb2.append(", sessionIds=");
        sb2.append(this.f62520b);
        sb2.append(", uncompressedByteCount=");
        sb2.append(this.f62521c);
        sb2.append(", payloadCount=");
        return a2.c.m(sb2, this.f62522d, ')');
    }
}
