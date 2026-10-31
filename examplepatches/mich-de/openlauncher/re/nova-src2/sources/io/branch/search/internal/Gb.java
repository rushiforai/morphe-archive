package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Gb {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Hb f62530a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3240l0 f62531b;

    public Gb(@NotNull Hb remotePingService, @NotNull C3240l0 analyticsSessionRepository) {
        Intrinsics.g(remotePingService, "remotePingService");
        Intrinsics.g(analyticsSessionRepository, "analyticsSessionRepository");
        this.f62530a = remotePingService;
        this.f62531b = analyticsSessionRepository;
    }

    @Nullable
    public final Object a(@NotNull String str, @NotNull Xa xa2) {
        Hb hb2 = this.f62530a;
        C3240l0 c3240l0 = this.f62531b;
        c3240l0.getClass();
        String strB = c3240l0.f64939d.b("io.branch.search");
        C3366s8 c3366s8 = hb2.f62589b;
        EnumC3075b4 enumC3075b4 = EnumC3075b4.o;
        hb2.f62588a.getClass();
        return c3366s8.a(strB, enumC3075b4, "https://vulcan5.branch.io/v1/ping?".concat(str), null, null, xa2);
    }
}
