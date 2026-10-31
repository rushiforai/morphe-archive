package com.moloco.sdk.acm;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class e {
    @NotNull
    public static final a a(@NotNull InitConfig initConfig) {
        Intrinsics.g(initConfig, "<this>");
        return new a(initConfig.getAppId(), initConfig.getPostAnalyticsUrl(), initConfig.getRequestPeriodSeconds(), initConfig.getClientOptions());
    }
}
