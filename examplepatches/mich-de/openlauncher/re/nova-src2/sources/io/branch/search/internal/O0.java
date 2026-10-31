package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class O0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f62999a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f63000b;

    /* renamed from: c, reason: collision with root package name */
    public final int f63001c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f63002d;

    public O0(boolean z11, boolean z12, int i5) {
        this.f62999a = z11;
        this.f63000b = z12;
        this.f63001c = i5;
        this.f63002d = (!z12 && z11) || (z12 && i5 == 0);
    }

    @NotNull
    public final int a() {
        boolean z11 = this.f63000b;
        if (!z11 && this.f63002d) {
            return 1;
        }
        if (z11 && this.f63002d) {
            return 2;
        }
        if (z11 || this.f63002d) {
            return (!z11 || this.f63002d) ? 5 : 3;
        }
        return 4;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof O0)) {
            return false;
        }
        O0 o02 = (O0) obj;
        return this.f62999a == o02.f62999a && this.f63000b == o02.f63000b && this.f63001c == o02.f63001c;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int] */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6 */
    public final int hashCode() {
        boolean z11 = this.f62999a;
        ?? r02 = z11;
        if (z11) {
            r02 = 1;
        }
        int i5 = r02 * 31;
        boolean z12 = this.f63000b;
        return Integer.hashCode(this.f63001c) + ((i5 + (z12 ? 1 : z12 ? 1 : 0)) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AppUsageServiceStatus(enabled=");
        sb2.append(this.f62999a);
        sb2.append(", isDefault=");
        sb2.append(this.f63000b);
        sb2.append(", permission=");
        return a2.c.m(sb2, this.f63001c, ')');
    }
}
