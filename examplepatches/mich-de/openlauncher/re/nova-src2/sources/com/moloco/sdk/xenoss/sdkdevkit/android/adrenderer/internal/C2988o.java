package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.o, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2988o {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final String f39261a = "DEC_FAILED_TO_LOAD";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final String f39262b = "DEC_LOADED_WITH_NO_APP_ICON";

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final String f39263c = "DECLoaderImpl";

    public static final void b(String str) {
        MolocoLogger.debug$default(MolocoLogger.INSTANCE, f39263c, str, false, 4, null);
    }

    @NotNull
    public static final InterfaceC2986m a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i mediaCacheRepository, @NotNull com.moloco.sdk.internal.error.b errorReportingService) {
        Intrinsics.g(mediaCacheRepository, "mediaCacheRepository");
        Intrinsics.g(errorReportingService, "errorReportingService");
        return new C2987n(mediaCacheRepository, errorReportingService);
    }
}
