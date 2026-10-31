package com.moloco.sdk.acm;

import android.content.Context;
import b.c0;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010$\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B=\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\n¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0019\u001a\u00020\bHÆ\u0003J\u0015\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\nHÆ\u0003JG\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\b2\u0014\b\u0002\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\nHÆ\u0001J\u0013\u0010\u001c\u001a\u00020\u001d2\b\u0010\u001e\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001f\u001a\u00020 HÖ\u0001J\t\u0010!\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u001d\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\n¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015¨\u0006\""}, d2 = {"Lcom/moloco/sdk/acm/InitConfig;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "postAnalyticsUrl", "context", "Landroid/content/Context;", "requestPeriodSeconds", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "clientOptions", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;JLjava/util/Map;)V", "getAppId", "()Ljava/lang/String;", "getPostAnalyticsUrl", "getContext", "()Landroid/content/Context;", "getRequestPeriodSeconds", "()J", "getClientOptions", "()Ljava/util/Map;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "moloco-android-client-metrics_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class InitConfig {

    @NotNull
    private final String appId;

    @NotNull
    private final Map<String, String> clientOptions;

    @NotNull
    private final Context context;

    @NotNull
    private final String postAnalyticsUrl;
    private final long requestPeriodSeconds;

    public InitConfig(@NotNull String appId, @NotNull String postAnalyticsUrl, @NotNull Context context, long j11, @NotNull Map<String, String> clientOptions) {
        Intrinsics.g(appId, "appId");
        Intrinsics.g(postAnalyticsUrl, "postAnalyticsUrl");
        Intrinsics.g(context, "context");
        Intrinsics.g(clientOptions, "clientOptions");
        this.appId = appId;
        this.postAnalyticsUrl = postAnalyticsUrl;
        this.context = context;
        this.requestPeriodSeconds = j11;
        this.clientOptions = clientOptions;
    }

    public static /* synthetic */ InitConfig copy$default(InitConfig initConfig, String str, String str2, Context context, long j11, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = initConfig.appId;
        }
        if ((i5 & 2) != 0) {
            str2 = initConfig.postAnalyticsUrl;
        }
        if ((i5 & 4) != 0) {
            context = initConfig.context;
        }
        if ((i5 & 8) != 0) {
            j11 = initConfig.requestPeriodSeconds;
        }
        if ((i5 & 16) != 0) {
            map = initConfig.clientOptions;
        }
        Map map2 = map;
        Context context2 = context;
        return initConfig.copy(str, str2, context2, j11, map2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getAppId() {
        return this.appId;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getPostAnalyticsUrl() {
        return this.postAnalyticsUrl;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final Context getContext() {
        return this.context;
    }

    /* renamed from: component4, reason: from getter */
    public final long getRequestPeriodSeconds() {
        return this.requestPeriodSeconds;
    }

    @NotNull
    public final Map<String, String> component5() {
        return this.clientOptions;
    }

    @NotNull
    public final InitConfig copy(@NotNull String appId, @NotNull String postAnalyticsUrl, @NotNull Context context, long requestPeriodSeconds, @NotNull Map<String, String> clientOptions) {
        Intrinsics.g(appId, "appId");
        Intrinsics.g(postAnalyticsUrl, "postAnalyticsUrl");
        Intrinsics.g(context, "context");
        Intrinsics.g(clientOptions, "clientOptions");
        return new InitConfig(appId, postAnalyticsUrl, context, requestPeriodSeconds, clientOptions);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof InitConfig)) {
            return false;
        }
        InitConfig initConfig = (InitConfig) other;
        return Intrinsics.b(this.appId, initConfig.appId) && Intrinsics.b(this.postAnalyticsUrl, initConfig.postAnalyticsUrl) && Intrinsics.b(this.context, initConfig.context) && this.requestPeriodSeconds == initConfig.requestPeriodSeconds && Intrinsics.b(this.clientOptions, initConfig.clientOptions);
    }

    @NotNull
    public final String getAppId() {
        return this.appId;
    }

    @NotNull
    public final Map<String, String> getClientOptions() {
        return this.clientOptions;
    }

    @NotNull
    public final Context getContext() {
        return this.context;
    }

    @NotNull
    public final String getPostAnalyticsUrl() {
        return this.postAnalyticsUrl;
    }

    public final long getRequestPeriodSeconds() {
        return this.requestPeriodSeconds;
    }

    public int hashCode() {
        return this.clientOptions.hashCode() + c0.d((this.context.hashCode() + c0.e(this.appId.hashCode() * 31, 31, this.postAnalyticsUrl)) * 31, 31, this.requestPeriodSeconds);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("InitConfig(appId=");
        sb2.append(this.appId);
        sb2.append(", postAnalyticsUrl=");
        sb2.append(this.postAnalyticsUrl);
        sb2.append(", context=");
        sb2.append(this.context);
        sb2.append(", requestPeriodSeconds=");
        sb2.append(this.requestPeriodSeconds);
        sb2.append(", clientOptions=");
        return c9.l(sb2, this.clientOptions, ')');
    }

    public /* synthetic */ InitConfig(String str, String str2, Context context, long j11, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, context, (i5 & 8) != 0 ? 600L : j11, map);
    }
}
