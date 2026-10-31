package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.d5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3110d5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64242a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64243b;

    /* renamed from: c, reason: collision with root package name */
    public final long f64244c;

    public C3110d5(long j11, @NotNull String name, @NotNull String fullName) {
        Intrinsics.g(name, "name");
        Intrinsics.g(fullName, "fullName");
        this.f64242a = name;
        this.f64243b = fullName;
        this.f64244c = j11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3110d5)) {
            return false;
        }
        C3110d5 c3110d5 = (C3110d5) obj;
        return Intrinsics.b(this.f64242a, c3110d5.f64242a) && Intrinsics.b(this.f64243b, c3110d5.f64243b) && this.f64244c == c3110d5.f64244c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f64244c) + C3248l8.a(this.f64243b, this.f64242a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DatabaseDiagnosticDbInfo(name=");
        sb2.append(this.f64242a);
        sb2.append(", fullName=");
        sb2.append(this.f64243b);
        sb2.append(", size=");
        return C3380t5.a(sb2, this.f64244c, ')');
    }
}
