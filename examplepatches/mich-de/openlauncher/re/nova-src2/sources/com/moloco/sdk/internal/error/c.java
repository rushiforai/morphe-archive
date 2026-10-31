package com.moloco.sdk.internal.error;

import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class c implements b {

    /* renamed from: d, reason: collision with root package name */
    public static final int f36381d = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.services.config.a f36382a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.error.api.a f36383b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f36384c;

    public c(@NotNull com.moloco.sdk.internal.services.config.a configService, @NotNull com.moloco.sdk.internal.error.api.a errorReportingApi) {
        Intrinsics.g(configService, "configService");
        Intrinsics.g(errorReportingApi, "errorReportingApi");
        this.f36382a = configService;
        this.f36383b = errorReportingApi;
        this.f36384c = "ErrorReportingServiceImpl";
    }

    @Override // com.moloco.sdk.internal.error.b
    public void a(@NotNull String error, @NotNull a errorMetadata) {
        Intrinsics.g(error, "error");
        Intrinsics.g(errorMetadata, "errorMetadata");
        if (!this.f36382a.a(d.f36398a)) {
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, this.f36384c, "Error reporting is disabled. Tried to report error: ".concat(error), null, false, 12, null);
            return;
        }
        String strB = this.f36382a.b(d.f36398a);
        if (strB == null) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f36384c, "Error reporting is enabled but with invalid url", null, false, 12, null);
        } else {
            this.f36383b.a(error, strB, errorMetadata);
        }
    }
}
