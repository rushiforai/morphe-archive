package com.instabridge.mobilesdk.internal.ui;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/CheckoutFailureKind;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "GENERIC", "STATE_UNAVAILABLE", "ALREADY_SUBSCRIBED", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CheckoutFailureKind {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ CheckoutFailureKind[] $VALUES;
    public static final CheckoutFailureKind GENERIC = new CheckoutFailureKind("GENERIC", 0);
    public static final CheckoutFailureKind STATE_UNAVAILABLE = new CheckoutFailureKind("STATE_UNAVAILABLE", 1);
    public static final CheckoutFailureKind ALREADY_SUBSCRIBED = new CheckoutFailureKind("ALREADY_SUBSCRIBED", 2);

    private static final /* synthetic */ CheckoutFailureKind[] $values() {
        return new CheckoutFailureKind[]{GENERIC, STATE_UNAVAILABLE, ALREADY_SUBSCRIBED};
    }

    static {
        CheckoutFailureKind[] checkoutFailureKindArr$values = $values();
        $VALUES = checkoutFailureKindArr$values;
        $ENTRIES = EnumEntriesKt.a(checkoutFailureKindArr$values);
    }

    private CheckoutFailureKind(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<CheckoutFailureKind> getEntries() {
        return $ENTRIES;
    }

    public static CheckoutFailureKind valueOf(String str) {
        return (CheckoutFailureKind) Enum.valueOf(CheckoutFailureKind.class, str);
    }

    public static CheckoutFailureKind[] values() {
        return (CheckoutFailureKind[]) $VALUES.clone();
    }
}
