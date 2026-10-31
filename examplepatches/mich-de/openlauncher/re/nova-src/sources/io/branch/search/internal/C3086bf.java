package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.bf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3086bf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64038a;

    /* renamed from: b, reason: collision with root package name */
    public final int f64039b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f64040c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f64041d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f64042e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Long f64043f;

    /* renamed from: g, reason: collision with root package name */
    public final long f64044g;

    public C3086bf(@NotNull String requestId, int i5, @Nullable String str, @Nullable String str2, long j11) {
        Intrinsics.g(requestId, "requestId");
        this.f64038a = requestId;
        this.f64039b = i5;
        this.f64040c = str;
        this.f64041d = str2;
        this.f64042e = null;
        this.f64043f = null;
        this.f64044g = j11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3086bf)) {
            return false;
        }
        C3086bf c3086bf = (C3086bf) obj;
        return Intrinsics.b(this.f64038a, c3086bf.f64038a) && this.f64039b == c3086bf.f64039b && Intrinsics.b(this.f64040c, c3086bf.f64040c) && Intrinsics.b(this.f64041d, c3086bf.f64041d) && Intrinsics.b(this.f64042e, c3086bf.f64042e) && Intrinsics.b(this.f64043f, c3086bf.f64043f) && this.f64044g == c3086bf.f64044g;
    }

    public final int hashCode() {
        int iA = C3214j8.a(this.f64039b, this.f64038a.hashCode() * 31, 31);
        String str = this.f64040c;
        int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f64041d;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f64042e;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Long l9 = this.f64043f;
        return Long.hashCode(this.f64044g) + ((iHashCode3 + (l9 != null ? l9.hashCode() : 0)) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("UnifiedEntity(requestId=");
        sb2.append(this.f64038a);
        sb2.append(", resultId=");
        sb2.append(this.f64039b);
        sb2.append(", entityId=");
        sb2.append(this.f64040c);
        sb2.append(", packageId=");
        sb2.append(this.f64041d);
        sb2.append(", shortcutId=");
        sb2.append(this.f64042e);
        sb2.append(", userId=");
        sb2.append(this.f64043f);
        sb2.append(", timestamp=");
        return C3380t5.a(sb2, this.f64044g, ')');
    }
}
