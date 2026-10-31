package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class O8 {
    @NotNull
    public static final M8 a(@NotNull N8 n82) {
        Intrinsics.g(n82, "<this>");
        String str = n82.f62975a;
        long j11 = n82.f62976b;
        String str2 = n82.f62977c;
        String str3 = n82.f62978d;
        boolean z11 = n82.f62979e;
        if (n82.f62981g == null) {
            n82.a(System.currentTimeMillis() / 1000);
        }
        Long l9 = n82.f62981g;
        long jLongValue = l9 != null ? l9.longValue() : 0L;
        long jA = n82.a();
        if (n82.f62983i == null) {
            n82.a(System.currentTimeMillis() / 1000);
        }
        Long l11 = n82.f62983i;
        M8 m82 = new M8(str, j11, str2, str3, z11, jLongValue, jA, l11 != null ? l11.longValue() : 0L, n82.f62980f);
        C3309p1.c(EnumC3131e9.PackageSync, "Converting from LocalPackageWrapper to LocalPackage: " + m82);
        return m82;
    }
}
