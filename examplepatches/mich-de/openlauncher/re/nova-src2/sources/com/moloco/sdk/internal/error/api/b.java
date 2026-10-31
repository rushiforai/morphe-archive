package com.moloco.sdk.internal.error.api;

import b.c0;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.I;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class b implements a {

    /* renamed from: d, reason: collision with root package name */
    public static final int f36377d = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final I f36378a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.a f36379b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f36380c;

    public b(@NotNull I timeProviderService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.a httpClient) {
        Intrinsics.g(timeProviderService, "timeProviderService");
        Intrinsics.g(httpClient, "httpClient");
        this.f36378a = timeProviderService;
        this.f36379b = httpClient;
        this.f36380c = "ErrorReportingApi";
    }

    @Override // com.moloco.sdk.internal.error.api.a
    public void a(@NotNull Throwable error) {
        Intrinsics.g(error, "error");
        MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f36380c, "SDK Crashed", error, false, 8, null);
    }

    @Override // com.moloco.sdk.internal.error.api.a
    public void a(@NotNull String error, @NotNull String url, @NotNull com.moloco.sdk.internal.error.a errorMetadata) {
        Intrinsics.g(error, "error");
        Intrinsics.g(url, "url");
        Intrinsics.g(errorMetadata, "errorMetadata");
        String strB = com.moloco.sdk.internal.utils.b.b(com.moloco.sdk.internal.utils.b.a(url, error, this.f36378a.invoke()), errorMetadata.b());
        MolocoLogger.info$default(MolocoLogger.INSTANCE, this.f36380c, c0.m("Reporting error: ", error, " to url: ", strB), null, false, 12, null);
        this.f36379b.a(strB);
    }
}
