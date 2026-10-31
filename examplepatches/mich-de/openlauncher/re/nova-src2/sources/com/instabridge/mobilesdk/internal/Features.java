package com.instabridge.mobilesdk.internal;

import android.content.Context;
import com.instabridge.mobilesdk.Brand;
import com.instabridge.mobilesdk.MobileSdk;
import com.instabridge.mobilesdk.MobileSdkConfig;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t¨\u0006\n"}, d2 = {"Lcom/instabridge/mobilesdk/internal/Features;", b.f42142b, "<init>", "()V", "travelEsim", b.f42142b, "config", "Lcom/instabridge/mobilesdk/MobileSdkConfig;", "context", "Landroid/content/Context;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class Features {
    public static final int $stable = 0;

    @NotNull
    public static final Features INSTANCE = new Features();

    private Features() {
    }

    public final boolean travelEsim(@NotNull MobileSdkConfig config, @NotNull Context context) {
        Intrinsics.g(config, "config");
        Intrinsics.g(context, "context");
        return config.getBrand() == Brand.EYECON && MobileSdk.isTravelEsimSupported(context);
    }
}
