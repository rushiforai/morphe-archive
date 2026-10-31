package com.instabridge.mobilesdk;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0004\"\u0018\u0010\u0005\u001a\u00020\u0001*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0004¨\u0006\u0007"}, d2 = {"backendBaseUrl", b.f42142b, "Lcom/instabridge/mobilesdk/MobileSdkConfig;", "getBackendBaseUrl", "(Lcom/instabridge/mobilesdk/MobileSdkConfig;)Ljava/lang/String;", "usersBaseUrl", "getUsersBaseUrl", "mobile-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class MobileSdkConfigKt {
    @NotNull
    public static final String getBackendBaseUrl(@NotNull MobileSdkConfig mobileSdkConfig) {
        Intrinsics.g(mobileSdkConfig, "<this>");
        return mobileSdkConfig.getDebug() ? "https://test-esim.instabridge.com/" : "https://esim.instabridge.com/";
    }

    @NotNull
    public static final String getUsersBaseUrl(@NotNull MobileSdkConfig mobileSdkConfig) {
        Intrinsics.g(mobileSdkConfig, "<this>");
        return mobileSdkConfig.getDebug() ? "https://api.instabridge.dev/api3/" : "https://api.instabridge.com/api3/";
    }
}
