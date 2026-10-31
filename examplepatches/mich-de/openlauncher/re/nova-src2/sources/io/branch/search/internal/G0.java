package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class G0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62499a;

    /* renamed from: b, reason: collision with root package name */
    public final long f62500b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62501c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f62502d;

    public G0(long j11, long j12, @NotNull String packageName, @Nullable String str) {
        Intrinsics.g(packageName, "packageName");
        this.f62499a = packageName;
        this.f62500b = j11;
        this.f62501c = j12;
        this.f62502d = str;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof G0)) {
            return false;
        }
        G0 g02 = (G0) obj;
        return Intrinsics.b(this.f62499a, g02.f62499a) && this.f62500b == g02.f62500b && this.f62501c == g02.f62501c && Intrinsics.b(this.f62502d, g02.f62502d);
    }

    public final int hashCode() {
        int iA = C3231k8.a(this.f62501c, C3231k8.a(this.f62500b, this.f62499a.hashCode() * 31, 31), 31);
        String str = this.f62502d;
        return iA + (str == null ? 0 : str.hashCode());
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AppUsageEvent(packageName=");
        sb2.append(this.f62499a);
        sb2.append(", timestamp=");
        sb2.append(this.f62500b);
        sb2.append(", eventType=");
        sb2.append(this.f62501c);
        sb2.append(", className=");
        return Z.a(sb2, this.f62502d, ')');
    }
}
