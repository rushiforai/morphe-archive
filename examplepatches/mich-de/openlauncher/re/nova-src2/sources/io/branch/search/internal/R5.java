package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class R5 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Z1 f63259a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final H3 f63260b;

    public static final class a {
    }

    public R5(@NotNull Z1 deviceInfo, @NotNull H3 cacheSystem) {
        Intrinsics.g(deviceInfo, "deviceInfo");
        Intrinsics.g(cacheSystem, "cacheSystem");
        this.f63259a = deviceInfo;
        this.f63260b = cacheSystem;
    }

    @NotNull
    public final P5 a() {
        Object objA = this.f63260b.a("DEFAULT", "device_info");
        P5 p52 = objA instanceof P5 ? (P5) objA : null;
        if (p52 != null) {
            return p52;
        }
        Z1 z12 = this.f63259a;
        z12.b(false);
        P5 p53 = new P5(z12.a(), z12.f63801t.f63068b);
        z12.f63801t = p53;
        this.f63260b.a("DEFAULT", "device_info", p53, 60000L);
        return p53;
    }
}
