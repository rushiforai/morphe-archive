package com.medium.android.data.preferences;

import defpackage.bt2;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000f\b\u0087\u0081\u0002\u0018\u0000 \u000b2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\fB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u001d\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\u0012\n\u0004\b\u0003\u0010\u0006\u0012\u0004\b\t\u0010\n\u001a\u0004\b\u0007\u0010\bj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010¨\u0006\u0011"}, d2 = {"Lcom/medium/android/data/preferences/DarkMode;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "getValue$annotations", "()V", "Companion", "bt2", "LIGHT", "DARK", "FOLLOW_SYSTEM", "AUTO_BATTERY", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DarkMode {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ DarkMode[] $VALUES;
    public static final bt2 Companion;
    private final int value;
    public static final DarkMode LIGHT = new DarkMode("LIGHT", 0, 1);
    public static final DarkMode DARK = new DarkMode("DARK", 1, 2);
    public static final DarkMode FOLLOW_SYSTEM = new DarkMode("FOLLOW_SYSTEM", 2, -1);
    public static final DarkMode AUTO_BATTERY = new DarkMode("AUTO_BATTERY", 3, 3);

    private static final /* synthetic */ DarkMode[] $values() {
        return new DarkMode[]{LIGHT, DARK, FOLLOW_SYSTEM, AUTO_BATTERY};
    }

    static {
        DarkMode[] darkModeArr$values = $values();
        $VALUES = darkModeArr$values;
        $ENTRIES = rv8.x(darkModeArr$values);
        Companion = new bt2();
    }

    private DarkMode(String str, int i, int i2) {
        this.value = i2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static DarkMode valueOf(String str) {
        return (DarkMode) Enum.valueOf(DarkMode.class, str);
    }

    public static DarkMode[] values() {
        return (DarkMode[]) $VALUES.clone();
    }

    public final int getValue() {
        return this.value;
    }

    public static /* synthetic */ void getValue$annotations() {
    }
}
