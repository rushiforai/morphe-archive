package com.instabridge.mobilesdk.internal.ui;

import java.util.Locale;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\u001a\u000e\u0010\u0000\u001a\u00020\u0001*\u0004\u0018\u00010\u0002H\u0000\u001a\u000e\u0010\u0003\u001a\u00020\u0001*\u0004\u0018\u00010\u0002H\u0000¨\u0006\u0004"}, d2 = {"toCheckoutStatus", "Lcom/instabridge/mobilesdk/internal/ui/CheckoutStatus;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toVerifiedStatus", "mobile-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CheckoutStatusKt {
    @NotNull
    public static final CheckoutStatus toCheckoutStatus(@Nullable String str) {
        String lowerCase;
        if (str != null) {
            lowerCase = str.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
        } else {
            lowerCase = null;
        }
        if (lowerCase != null) {
            int iHashCode = lowerCase.hashCode();
            if (iHashCode != -1914368230) {
                return iHashCode != -1035190444 ? CheckoutStatus.REQUIRE_PAYMENT : CheckoutStatus.REQUIRE_PAYMENT;
            }
            if (lowerCase.equals("require_address")) {
                return CheckoutStatus.REQUIRE_ADDRESS;
            }
        }
        return CheckoutStatus.FAILED;
    }

    @NotNull
    public static final CheckoutStatus toVerifiedStatus(@Nullable String str) {
        String lowerCase;
        if (str != null) {
            lowerCase = str.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
        } else {
            lowerCase = null;
        }
        return Intrinsics.b(lowerCase, "purchased") ? CheckoutStatus.SUCCESS : Intrinsics.b(lowerCase, "pending") ? CheckoutStatus.PENDING : CheckoutStatus.FAILED;
    }
}
