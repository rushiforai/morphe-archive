package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.g6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3162g6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64580a;

    /* renamed from: b, reason: collision with root package name */
    public final long f64581b;

    /* renamed from: c, reason: collision with root package name */
    public final double f64582c;

    public C3162g6(@NotNull String directory, long j11, double d5) {
        Intrinsics.g(directory, "directory");
        this.f64580a = directory;
        this.f64581b = j11;
        this.f64582c = d5;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3162g6)) {
            return false;
        }
        C3162g6 c3162g6 = (C3162g6) obj;
        return Intrinsics.b(this.f64580a, c3162g6.f64580a) && this.f64581b == c3162g6.f64581b && Double.valueOf(this.f64582c).equals(Double.valueOf(c3162g6.f64582c));
    }

    public final int hashCode() {
        return Double.hashCode(this.f64582c) + C3231k8.a(this.f64581b, this.f64580a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        return "DirectoryDiagnostics(directory=" + this.f64580a + ", size=" + this.f64581b + ", percentage=" + this.f64582c + ')';
    }
}
