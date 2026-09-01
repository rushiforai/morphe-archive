package com.medium.android.data.settings;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000b"}, d2 = {"Lcom/medium/android/data/settings/Frequency;", "", "serverName", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getServerName", "()Ljava/lang/String;", "DAILY", "WEEKLY", "OFF", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Frequency {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ Frequency[] $VALUES;
    private final String serverName;
    public static final Frequency DAILY = new Frequency("DAILY", 0, "daily");
    public static final Frequency WEEKLY = new Frequency("WEEKLY", 1, "weekly");
    public static final Frequency OFF = new Frequency("OFF", 2, PqkdNGCEoxOKZk.JCelJvy);

    private static final /* synthetic */ Frequency[] $values() {
        return new Frequency[]{DAILY, WEEKLY, OFF};
    }

    private Frequency(String str, int i, String str2) {
        this.serverName = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static Frequency valueOf(String str) {
        return (Frequency) Enum.valueOf(Frequency.class, str);
    }

    public static Frequency[] values() {
        return (Frequency[]) $VALUES.clone();
    }

    public final String getServerName() {
        return this.serverName;
    }

    static {
        Frequency[] frequencyArr$values = $values();
        $VALUES = frequencyArr$values;
        $ENTRIES = rv8.x(frequencyArr$values);
    }
}
