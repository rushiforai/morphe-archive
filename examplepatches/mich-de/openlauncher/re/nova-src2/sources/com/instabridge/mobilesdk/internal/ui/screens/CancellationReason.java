package com.instabridge.mobilesdk.internal.ui.screens;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.instabridge.mobilesdk.R;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0011\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B%\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0001\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/screens/CancellationReason;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "labelRes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "descriptionRes", "<init>", "(Ljava/lang/String;ILjava/lang/String;II)V", "getValue", "()Ljava/lang/String;", "getLabelRes", "()I", "getDescriptionRes", "TOO_EXPENSIVE", "UNUSED", "LOW_QUALITY", "SWITCHED_SERVICE", "CUSTOMER_SERVICE", "MISSING_FEATURES", "TOO_COMPLEX", NativeAdContent.ViewTag.OTHER, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CancellationReason {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ CancellationReason[] $VALUES;
    private final int descriptionRes;
    private final int labelRes;

    @NotNull
    private final String value;
    public static final CancellationReason TOO_EXPENSIVE = new CancellationReason("TOO_EXPENSIVE", 0, "too_expensive", R.string.mobile_sdk_cancellation_reason_too_expensive, R.string.mobile_sdk_cancellation_reason_too_expensive_desc);
    public static final CancellationReason UNUSED = new CancellationReason("UNUSED", 1, "unused", R.string.mobile_sdk_cancellation_reason_unused, R.string.mobile_sdk_cancellation_reason_unused_desc);
    public static final CancellationReason LOW_QUALITY = new CancellationReason("LOW_QUALITY", 2, "low_quality", R.string.mobile_sdk_cancellation_reason_low_quality, R.string.mobile_sdk_cancellation_reason_low_quality_desc);
    public static final CancellationReason SWITCHED_SERVICE = new CancellationReason("SWITCHED_SERVICE", 3, "switched_service", R.string.mobile_sdk_cancellation_reason_switched_service, R.string.mobile_sdk_cancellation_reason_switched_service_desc);
    public static final CancellationReason CUSTOMER_SERVICE = new CancellationReason("CUSTOMER_SERVICE", 4, "customer_service", R.string.mobile_sdk_cancellation_reason_customer_service, R.string.mobile_sdk_cancellation_reason_customer_service_desc);
    public static final CancellationReason MISSING_FEATURES = new CancellationReason("MISSING_FEATURES", 5, "missing_features", R.string.mobile_sdk_cancellation_reason_missing_features, R.string.mobile_sdk_cancellation_reason_missing_features_desc);
    public static final CancellationReason TOO_COMPLEX = new CancellationReason("TOO_COMPLEX", 6, "too_complex", R.string.mobile_sdk_cancellation_reason_too_complex, R.string.mobile_sdk_cancellation_reason_too_complex_desc);
    public static final CancellationReason OTHER = new CancellationReason(NativeAdContent.ViewTag.OTHER, 7, InneractiveMediationNameConsts.OTHER, R.string.mobile_sdk_cancellation_reason_other, R.string.mobile_sdk_cancellation_reason_other_desc);

    private static final /* synthetic */ CancellationReason[] $values() {
        return new CancellationReason[]{TOO_EXPENSIVE, UNUSED, LOW_QUALITY, SWITCHED_SERVICE, CUSTOMER_SERVICE, MISSING_FEATURES, TOO_COMPLEX, OTHER};
    }

    static {
        CancellationReason[] cancellationReasonArr$values = $values();
        $VALUES = cancellationReasonArr$values;
        $ENTRIES = EnumEntriesKt.a(cancellationReasonArr$values);
    }

    private CancellationReason(String str, int i5, String str2, int i11, int i12) {
        this.value = str2;
        this.labelRes = i11;
        this.descriptionRes = i12;
    }

    @NotNull
    public static EnumEntries<CancellationReason> getEntries() {
        return $ENTRIES;
    }

    public static CancellationReason valueOf(String str) {
        return (CancellationReason) Enum.valueOf(CancellationReason.class, str);
    }

    public static CancellationReason[] values() {
        return (CancellationReason[]) $VALUES.clone();
    }

    public final int getDescriptionRes() {
        return this.descriptionRes;
    }

    public final int getLabelRes() {
        return this.labelRes;
    }

    @NotNull
    public final String getValue() {
        return this.value;
    }
}
