package com.stripe.android.paymentsheet;

import androidx.annotation.Keep;
import com.stripe.android.model.StripeIntent;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import org.jetbrains.annotations.NotNull;

@Keep
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J'\u0010\t\u001a\u001c\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00060\u0005\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00070\u0004¢\u0006\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheetNextActionHandlers;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/lang/Class;", "Lcom/stripe/android/model/StripeIntent$NextActionData;", "Lju/e;", "Lcom/stripe/android/model/StripeIntent;", "get", "()Ljava/util/Map;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheetNextActionHandlers {
    public static final int $stable = 0;

    @NotNull
    public static final PaymentSheetNextActionHandlers INSTANCE = new PaymentSheetNextActionHandlers();

    private PaymentSheetNextActionHandlers() {
    }

    @NotNull
    public final Map<Class<? extends StripeIntent.NextActionData>, ju.e> get() {
        return MapsKt.j0(new Pair(StripeIntent.NextActionData.UpiAwaitNotification.class, new com.stripe.android.paymentsheet.paymentdatacollection.polling.d()), new Pair(StripeIntent.NextActionData.BlikAuthorize.class, new com.stripe.android.paymentsheet.paymentdatacollection.polling.d()), new Pair(StripeIntent.NextActionData.DisplayPayNowDetails.class, new com.stripe.android.paymentsheet.paymentdatacollection.polling.d()), new Pair(StripeIntent.NextActionData.DisplayPromptPayDetails.class, new com.stripe.android.paymentsheet.paymentdatacollection.polling.d()));
    }
}
