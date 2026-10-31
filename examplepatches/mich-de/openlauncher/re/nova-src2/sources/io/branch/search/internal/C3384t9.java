package io.branch.search.internal;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.t9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3384t9 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Map<String, C9> f65871a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<C3417v8> f65872b;

    public C3384t9(@NotNull LinkedHashMap statsData, @NotNull ArrayList ruleCapping) {
        Intrinsics.g(statsData, "statsData");
        Intrinsics.g(ruleCapping, "ruleCapping");
        this.f65871a = statsData;
        this.f65872b = ruleCapping;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3384t9)) {
            return false;
        }
        C3384t9 c3384t9 = (C3384t9) obj;
        return Intrinsics.b(this.f65871a, c3384t9.f65871a) && Intrinsics.b(this.f65872b, c3384t9.f65872b);
    }

    public final int hashCode() {
        return this.f65872b.hashCode() + (this.f65871a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("NetworkDataDiagnostic(statsData=");
        sb2.append(this.f65871a);
        sb2.append(", ruleCapping=");
        return Ob.a(sb2, this.f65872b, ')');
    }
}
