package com.instabridge.mobilesdk.internal.ui;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\n\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000b"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/CheckoutStatus;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "LOADING", "REQUIRE_ADDRESS", "REQUIRE_PAYMENT", "PROCESSING", "SUCCESS", "PENDING", "FAILED", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CheckoutStatus {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ CheckoutStatus[] $VALUES;
    public static final CheckoutStatus LOADING = new CheckoutStatus("LOADING", 0);
    public static final CheckoutStatus REQUIRE_ADDRESS = new CheckoutStatus("REQUIRE_ADDRESS", 1);
    public static final CheckoutStatus REQUIRE_PAYMENT = new CheckoutStatus("REQUIRE_PAYMENT", 2);
    public static final CheckoutStatus PROCESSING = new CheckoutStatus("PROCESSING", 3);
    public static final CheckoutStatus SUCCESS = new CheckoutStatus("SUCCESS", 4);
    public static final CheckoutStatus PENDING = new CheckoutStatus("PENDING", 5);
    public static final CheckoutStatus FAILED = new CheckoutStatus("FAILED", 6);

    private static final /* synthetic */ CheckoutStatus[] $values() {
        return new CheckoutStatus[]{LOADING, REQUIRE_ADDRESS, REQUIRE_PAYMENT, PROCESSING, SUCCESS, PENDING, FAILED};
    }

    static {
        CheckoutStatus[] checkoutStatusArr$values = $values();
        $VALUES = checkoutStatusArr$values;
        $ENTRIES = EnumEntriesKt.a(checkoutStatusArr$values);
    }

    private CheckoutStatus(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<CheckoutStatus> getEntries() {
        return $ENTRIES;
    }

    public static CheckoutStatus valueOf(String str) {
        return (CheckoutStatus) Enum.valueOf(CheckoutStatus.class, str);
    }

    public static CheckoutStatus[] values() {
        return (CheckoutStatus[]) $VALUES.clone();
    }
}
