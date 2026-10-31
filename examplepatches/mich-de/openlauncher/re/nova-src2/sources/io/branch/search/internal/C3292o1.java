package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.o1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3292o1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65418a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f65419b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3275n1 f65420c;

    public C3292o1(@NotNull String query, @NotNull String sessionId, @NotNull C3275n1 analyticEntity) {
        Intrinsics.g(query, "query");
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(analyticEntity, "analyticEntity");
        this.f65418a = query;
        this.f65419b = sessionId;
        this.f65420c = analyticEntity;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3292o1)) {
            return false;
        }
        C3292o1 c3292o1 = (C3292o1) obj;
        return Intrinsics.b(this.f65418a, c3292o1.f65418a) && Intrinsics.b(this.f65419b, c3292o1.f65419b) && Intrinsics.b(this.f65420c, c3292o1.f65420c);
    }

    public final int hashCode() {
        return this.f65420c.hashCode() + C3248l8.a(this.f65419b, this.f65418a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        return "AutoSuggestionResult(query=" + this.f65418a + ", sessionId=" + this.f65419b + ", analyticEntity=" + this.f65420c + ')';
    }
}
