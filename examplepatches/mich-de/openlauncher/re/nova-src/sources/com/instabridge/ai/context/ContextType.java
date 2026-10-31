package com.instabridge.ai.context;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/context/ContextType;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "apiValue", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getApiValue", "()Ljava/lang/String;", "PHONE_APPS", "LOCATION", "CALL_HISTORY", "SMS_HISTORY", "DEVICE_STATE", "CALENDAR_EVENTS", "CONTACTS", "CONNECTIVITY", "APP_USAGE", "SEARCH_HISTORY", "BROWSER_HISTORY", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ContextType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ContextType[] $VALUES;

    @NotNull
    private final String apiValue;
    public static final ContextType PHONE_APPS = new ContextType("PHONE_APPS", 0, "phone_apps");
    public static final ContextType LOCATION = new ContextType("LOCATION", 1, "location");
    public static final ContextType CALL_HISTORY = new ContextType("CALL_HISTORY", 2, "call_history");
    public static final ContextType SMS_HISTORY = new ContextType("SMS_HISTORY", 3, "sms_history");
    public static final ContextType DEVICE_STATE = new ContextType("DEVICE_STATE", 4, "device_state");
    public static final ContextType CALENDAR_EVENTS = new ContextType("CALENDAR_EVENTS", 5, "calendar_events");
    public static final ContextType CONTACTS = new ContextType("CONTACTS", 6, "contacts");
    public static final ContextType CONNECTIVITY = new ContextType("CONNECTIVITY", 7, "connectivity");
    public static final ContextType APP_USAGE = new ContextType("APP_USAGE", 8, "app_usage");
    public static final ContextType SEARCH_HISTORY = new ContextType("SEARCH_HISTORY", 9, "search_history");
    public static final ContextType BROWSER_HISTORY = new ContextType("BROWSER_HISTORY", 10, "browser_history");

    private static final /* synthetic */ ContextType[] $values() {
        return new ContextType[]{PHONE_APPS, LOCATION, CALL_HISTORY, SMS_HISTORY, DEVICE_STATE, CALENDAR_EVENTS, CONTACTS, CONNECTIVITY, APP_USAGE, SEARCH_HISTORY, BROWSER_HISTORY};
    }

    static {
        ContextType[] contextTypeArr$values = $values();
        $VALUES = contextTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(contextTypeArr$values);
    }

    private ContextType(String str, int i5, String str2) {
        this.apiValue = str2;
    }

    @NotNull
    public static EnumEntries<ContextType> getEntries() {
        return $ENTRIES;
    }

    public static ContextType valueOf(String str) {
        return (ContextType) Enum.valueOf(ContextType.class, str);
    }

    public static ContextType[] values() {
        return (ContextType[]) $VALUES.clone();
    }

    @NotNull
    public final String getApiValue() {
        return this.apiValue;
    }
}
