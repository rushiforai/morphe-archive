package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.jd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3219jd implements InterfaceC3432w6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64899a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64900b;

    /* renamed from: c, reason: collision with root package name */
    public final long f64901c;

    public C3219jd(long j11, @NotNull String userQuery, @NotNull String userQueryNormalize) {
        Intrinsics.g(userQuery, "userQuery");
        Intrinsics.g(userQueryNormalize, "userQueryNormalize");
        this.f64899a = userQuery;
        this.f64900b = userQueryNormalize;
        this.f64901c = j11;
    }

    @Override // io.branch.search.internal.InterfaceC3432w6
    public final long a() {
        return this.f64901c;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3219jd)) {
            return false;
        }
        C3219jd c3219jd = (C3219jd) obj;
        return Intrinsics.b(this.f64899a, c3219jd.f64899a) && Intrinsics.b(this.f64900b, c3219jd.f64900b) && this.f64901c == c3219jd.f64901c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f64901c) + C3248l8.a(this.f64900b, this.f64899a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SearchRequestData(userQuery=");
        sb2.append(this.f64899a);
        sb2.append(", userQueryNormalize=");
        sb2.append(this.f64900b);
        sb2.append(", timeStamp=");
        return C3380t5.a(sb2, this.f64901c, ')');
    }
}
