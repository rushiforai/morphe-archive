package com.instabridge.mobilesdk.internal.payment;

import com.instabridge.mobilesdk.MobileSdkConfig;
import com.instabridge.mobilesdk.internal.data.api.dto.PayIntentResponse;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0007\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\tJ\u0016\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eR\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lcom/instabridge/mobilesdk/internal/payment/StripeKeys;", b.f42142b, "<init>", "()V", "LIVE", b.f42142b, "TEST", "defaultFor", "debug", b.f42142b, "forIntent", "intent", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PayIntentResponse;", "config", "Lcom/instabridge/mobilesdk/MobileSdkConfig;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class StripeKeys {
    public static final int $stable = 0;

    @NotNull
    public static final StripeKeys INSTANCE = new StripeKeys();

    @NotNull
    public static final String LIVE = "pk_live_F2wS2MbdO1Wn9MfXRLbNkH1j";

    @NotNull
    public static final String TEST = "pk_test_51JNZQ9HrTWtWHJGFXxV1FfisOPjIMgu8VmFZ91dtGOPdMY6YkIRss7gq9MdaCz6Vy6dvsH65XwLlWiaONWegTNxZ00Mimez5Iz";

    private StripeKeys() {
    }

    @NotNull
    public final String defaultFor(boolean debug) {
        return debug ? TEST : LIVE;
    }

    @NotNull
    public final String forIntent(@NotNull PayIntentResponse intent, @NotNull MobileSdkConfig config) {
        Intrinsics.g(intent, "intent");
        Intrinsics.g(config, "config");
        String publishableKey = intent.getPublishableKey();
        if (publishableKey != null) {
            return publishableKey;
        }
        String stripePublishableKey = config.getStripePublishableKey();
        return stripePublishableKey == null ? defaultFor(config.getDebug()) : stripePublishableKey;
    }
}
