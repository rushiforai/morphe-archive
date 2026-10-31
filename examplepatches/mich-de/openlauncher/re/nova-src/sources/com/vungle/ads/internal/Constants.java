package com.vungle.ads.internal;

import kotlin.Metadata;
import kotlin.jvm.JvmField;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0005\u0010\u0006R\u0014\u0010\u0003\u001a\u00020\u00028\u0006X\u0087D¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004¨\u0006\u0007"}, d2 = {"Lcom/vungle/ads/internal/Constants;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "DEFAULT_ADS_ENDPOINT", "Ljava/lang/String;", "<init>", "()V", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class Constants {

    @NotNull
    public static final Constants INSTANCE = new Constants();

    @JvmField
    @NotNull
    public static final String DEFAULT_ADS_ENDPOINT = "https://adx.ads.vungle.com/api/v7/ads";

    /* renamed from: a, reason: collision with root package name */
    public static final String f46723a = "https://adx.ads.vungle.com/api/v7/csb";

    /* renamed from: b, reason: collision with root package name */
    public static final String f46724b = "https://logs.ads.vungle.com/sdk/error_logs";

    /* renamed from: c, reason: collision with root package name */
    public static final String f46725c = "https://logs.ads.vungle.com/sdk/metrics";

    private Constants() {
    }
}
