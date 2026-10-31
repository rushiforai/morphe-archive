package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ce, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3102ce {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64187a;

    /* renamed from: b, reason: collision with root package name */
    public final long f64188b;

    /* renamed from: c, reason: collision with root package name */
    public final long f64189c;

    public C3102ce(long j11, long j12, @NotNull String uri) {
        Intrinsics.g(uri, "uri");
        this.f64187a = uri;
        this.f64188b = j11;
        this.f64189c = j12;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3102ce)) {
            return false;
        }
        C3102ce c3102ce = (C3102ce) obj;
        return Intrinsics.b(this.f64187a, c3102ce.f64187a) && this.f64188b == c3102ce.f64188b && this.f64189c == c3102ce.f64189c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f64189c) + C3231k8.a(this.f64188b, this.f64187a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SignalKey(uri=");
        sb2.append(this.f64187a);
        sb2.append(", id=");
        sb2.append(this.f64188b);
        sb2.append(", fireCounter=");
        return C3380t5.a(sb2, this.f64189c, ')');
    }
}
