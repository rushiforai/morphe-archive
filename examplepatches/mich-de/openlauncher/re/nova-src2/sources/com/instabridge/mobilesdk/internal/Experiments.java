package com.instabridge.mobilesdk.internal;

import com.instabridge.mobilesdk.Brand;
import com.instabridge.mobilesdk.MobileSdkConfig;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bR\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/Experiments;", b.f42142b, "<init>", "()V", "HOW_IT_WORKS_VARIANT", b.f42142b, "VARIANT_CONTROL", "VARIANT_KEEP_YOUR_NUMBER", "keepYourNumberIntro", b.f42142b, "config", "Lcom/instabridge/mobilesdk/MobileSdkConfig;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class Experiments {
    public static final int $stable = 0;

    @NotNull
    public static final String HOW_IT_WORKS_VARIANT = "mobile_sdk_how_it_works_variant";

    @NotNull
    public static final Experiments INSTANCE = new Experiments();

    @NotNull
    private static final String VARIANT_CONTROL = "control";

    @NotNull
    private static final String VARIANT_KEEP_YOUR_NUMBER = "keep_your_number";

    private Experiments() {
    }

    public final boolean keepYourNumberIntro(@NotNull MobileSdkConfig config) {
        Intrinsics.g(config, "config");
        return config.getBrand() == Brand.NOVA && j.B0(config.getRemoteConfig().getString(HOW_IT_WORKS_VARIANT, VARIANT_CONTROL), VARIANT_KEEP_YOUR_NUMBER, true);
    }
}
