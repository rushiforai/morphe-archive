package com.amplitude.android.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Lcom/amplitude/android/utilities/ActivityCallbackType;", b.f42142b, "(Ljava/lang/String;I)V", "Created", "Started", "Resumed", "Paused", "Stopped", "Destroyed", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ActivityCallbackType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ActivityCallbackType[] $VALUES;
    public static final ActivityCallbackType Created = new ActivityCallbackType("Created", 0);
    public static final ActivityCallbackType Started = new ActivityCallbackType("Started", 1);
    public static final ActivityCallbackType Resumed = new ActivityCallbackType("Resumed", 2);
    public static final ActivityCallbackType Paused = new ActivityCallbackType("Paused", 3);
    public static final ActivityCallbackType Stopped = new ActivityCallbackType("Stopped", 4);
    public static final ActivityCallbackType Destroyed = new ActivityCallbackType("Destroyed", 5);

    private static final /* synthetic */ ActivityCallbackType[] $values() {
        return new ActivityCallbackType[]{Created, Started, Resumed, Paused, Stopped, Destroyed};
    }

    static {
        ActivityCallbackType[] activityCallbackTypeArr$values = $values();
        $VALUES = activityCallbackTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(activityCallbackTypeArr$values);
    }

    private ActivityCallbackType(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<ActivityCallbackType> getEntries() {
        return $ENTRIES;
    }

    public static ActivityCallbackType valueOf(String str) {
        return (ActivityCallbackType) Enum.valueOf(ActivityCallbackType.class, str);
    }

    public static ActivityCallbackType[] values() {
        return (ActivityCallbackType[]) $VALUES.clone();
    }
}
