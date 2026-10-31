package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class B0 implements InterfaceC3432w6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62085a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62086b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62087c;

    public B0(long j11, @NotNull String userQuery, @NotNull String userQueryNormalize) {
        Intrinsics.g(userQuery, "userQuery");
        Intrinsics.g(userQueryNormalize, "userQueryNormalize");
        this.f62085a = userQuery;
        this.f62086b = userQueryNormalize;
        this.f62087c = j11;
    }

    @Override // io.branch.search.internal.InterfaceC3432w6
    public final long a() {
        return this.f62087c;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof B0)) {
            return false;
        }
        B0 b02 = (B0) obj;
        return Intrinsics.b(this.f62085a, b02.f62085a) && Intrinsics.b(this.f62086b, b02.f62086b) && this.f62087c == b02.f62087c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f62087c) + C3248l8.a(this.f62086b, this.f62085a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AppStoreRequestData(userQuery=");
        sb2.append(this.f62085a);
        sb2.append(", userQueryNormalize=");
        sb2.append(this.f62086b);
        sb2.append(", timeStamp=");
        return C3380t5.a(sb2, this.f62087c, ')');
    }
}
