package com.medium.android.data.settings;

import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000b"}, d2 = {"Lcom/medium/android/data/settings/NotificationNetwork;", "", "serverName", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getServerName", "()Ljava/lang/String;", "ALL", "NETWORK", "OFF", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class NotificationNetwork {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ NotificationNetwork[] $VALUES;
    public static final NotificationNetwork ALL = new NotificationNetwork("ALL", 0, "all");
    public static final NotificationNetwork NETWORK = new NotificationNetwork("NETWORK", 1, "network");
    public static final NotificationNetwork OFF = new NotificationNetwork("OFF", 2, "off");
    private final String serverName;

    private static final /* synthetic */ NotificationNetwork[] $values() {
        return new NotificationNetwork[]{ALL, NETWORK, OFF};
    }

    static {
        NotificationNetwork[] notificationNetworkArr$values = $values();
        $VALUES = notificationNetworkArr$values;
        $ENTRIES = rv8.x(notificationNetworkArr$values);
    }

    private NotificationNetwork(String str, int i, String str2) {
        this.serverName = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static NotificationNetwork valueOf(String str) {
        return (NotificationNetwork) Enum.valueOf(NotificationNetwork.class, str);
    }

    public static NotificationNetwork[] values() {
        return (NotificationNetwork[]) $VALUES.clone();
    }

    public final String getServerName() {
        return this.serverName;
    }
}
