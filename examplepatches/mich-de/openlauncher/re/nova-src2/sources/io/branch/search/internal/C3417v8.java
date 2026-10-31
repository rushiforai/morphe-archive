package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.v8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3417v8 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3383t8 f66175a;

    /* renamed from: b, reason: collision with root package name */
    public final long f66176b;

    public C3417v8(@NotNull C3383t8 cappingRule, long j11) {
        Intrinsics.g(cappingRule, "cappingRule");
        this.f66175a = cappingRule;
        this.f66176b = j11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3417v8)) {
            return false;
        }
        C3417v8 c3417v8 = (C3417v8) obj;
        return Intrinsics.b(this.f66175a, c3417v8.f66175a) && this.f66176b == c3417v8.f66176b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f66176b) + (this.f66175a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("KNetworkUsageCappingRuleWithRemaining(cappingRule=");
        sb2.append(this.f66175a);
        sb2.append(", byteRemaining=");
        return C3380t5.a(sb2, this.f66176b, ')');
    }
}
