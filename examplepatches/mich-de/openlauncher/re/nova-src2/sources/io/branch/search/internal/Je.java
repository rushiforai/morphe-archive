package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Je {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final EnumC3131e9 f62750a;

    /* renamed from: b, reason: collision with root package name */
    public long f62751b;

    public Je(@NotNull EnumC3131e9 tag, @NotNull C3309p1 logger) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(logger, "logger");
        this.f62750a = tag;
        this.f62751b = System.currentTimeMillis();
    }

    public final void a(@NotNull String message) {
        Intrinsics.g(message, "message");
        long jCurrentTimeMillis = System.currentTimeMillis();
        EnumC3131e9 enumC3131e9 = this.f62750a;
        StringBuilder sbK = com.google.android.gms.internal.measurement.k2.k(message, " took ");
        sbK.append(jCurrentTimeMillis - this.f62751b);
        sbK.append("ms");
        C3309p1.c(enumC3131e9, sbK.toString());
    }
}
