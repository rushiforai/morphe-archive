package com.medium.android.core.navigation;

import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Lcom/medium/android/core/navigation/NotificationFilterType;", "", "<init>", "(Ljava/lang/String;I)V", "ALL", "RESPONSES", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class NotificationFilterType {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ NotificationFilterType[] $VALUES;
    public static final NotificationFilterType ALL = new NotificationFilterType("ALL", 0);
    public static final NotificationFilterType RESPONSES = new NotificationFilterType("RESPONSES", 1);

    private static final /* synthetic */ NotificationFilterType[] $values() {
        return new NotificationFilterType[]{ALL, RESPONSES};
    }

    static {
        NotificationFilterType[] notificationFilterTypeArr$values = $values();
        $VALUES = notificationFilterTypeArr$values;
        $ENTRIES = rv8.x(notificationFilterTypeArr$values);
    }

    private NotificationFilterType(String str, int i) {
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static NotificationFilterType valueOf(String str) {
        return (NotificationFilterType) Enum.valueOf(NotificationFilterType.class, str);
    }

    public static NotificationFilterType[] values() {
        return (NotificationFilterType[]) $VALUES.clone();
    }
}
