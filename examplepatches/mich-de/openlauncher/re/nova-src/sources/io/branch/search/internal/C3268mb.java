package io.branch.search.internal;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.mb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3268mb {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65152a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String[] f65153b;

    public C3268mb(@NotNull String query, @Nullable String[] strArr) {
        Intrinsics.g(query, "query");
        this.f65152a = query;
        this.f65153b = strArr;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3268mb)) {
            return false;
        }
        C3268mb c3268mb = (C3268mb) obj;
        return Intrinsics.b(this.f65152a, c3268mb.f65152a) && Intrinsics.b(this.f65153b, c3268mb.f65153b);
    }

    public final int hashCode() {
        int iHashCode = this.f65152a.hashCode() * 31;
        String[] strArr = this.f65153b;
        return iHashCode + (strArr == null ? 0 : Arrays.hashCode(strArr));
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("QueryStatement(query=");
        sb2.append(this.f65152a);
        sb2.append(", params=");
        return Z.a(sb2, Arrays.toString(this.f65153b), ')');
    }
}
