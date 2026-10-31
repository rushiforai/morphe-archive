package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Xd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63673a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f63674b;

    /* renamed from: c, reason: collision with root package name */
    public final long f63675c;

    public Xd(long j11, @NotNull String name, @NotNull String fullName) {
        Intrinsics.g(name, "name");
        Intrinsics.g(fullName, "fullName");
        this.f63673a = name;
        this.f63674b = fullName;
        this.f63675c = j11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Xd)) {
            return false;
        }
        Xd xd = (Xd) obj;
        return Intrinsics.b(this.f63673a, xd.f63673a) && Intrinsics.b(this.f63674b, xd.f63674b) && this.f63675c == xd.f63675c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f63675c) + C3248l8.a(this.f63674b, this.f63673a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SharedPrefsFileDiagnostics(name=");
        sb2.append(this.f63673a);
        sb2.append(", fullName=");
        sb2.append(this.f63674b);
        sb2.append(", size=");
        return C3380t5.a(sb2, this.f63675c, ')');
    }
}
