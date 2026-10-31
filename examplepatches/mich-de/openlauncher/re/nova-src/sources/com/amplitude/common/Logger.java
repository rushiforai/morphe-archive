package com.amplitude.common;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\bf\u0018\u00002\u00020\u0001:\u0001\u000fJ\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH&J\u0010\u0010\f\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH&J\u0010\u0010\r\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH&J\u0010\u0010\u000e\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH&R\u0018\u0010\u0002\u001a\u00020\u0003X¦\u000e¢\u0006\f\u001a\u0004\b\u0004\u0010\u0005\"\u0004\b\u0006\u0010\u0007ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0010À\u0006\u0001"}, d2 = {"Lcom/amplitude/common/Logger;", b.f42142b, "logMode", "Lcom/amplitude/common/Logger$LogMode;", "getLogMode", "()Lcom/amplitude/common/Logger$LogMode;", "setLogMode", "(Lcom/amplitude/common/Logger$LogMode;)V", "debug", b.f42142b, PglCryptUtils.KEY_MESSAGE, b.f42142b, "error", "info", "warn", "LogMode", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface Logger {

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Lcom/amplitude/common/Logger$LogMode;", b.f42142b, "i", b.f42142b, "(Ljava/lang/String;II)V", "DEBUG", "INFO", "WARN", "ERROR", "OFF", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class LogMode {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ LogMode[] $VALUES;
        public static final LogMode DEBUG = new LogMode("DEBUG", 0, 1);
        public static final LogMode INFO = new LogMode("INFO", 1, 2);
        public static final LogMode WARN = new LogMode("WARN", 2, 3);
        public static final LogMode ERROR = new LogMode("ERROR", 3, 4);
        public static final LogMode OFF = new LogMode("OFF", 4, 5);

        private static final /* synthetic */ LogMode[] $values() {
            return new LogMode[]{DEBUG, INFO, WARN, ERROR, OFF};
        }

        static {
            LogMode[] logModeArr$values = $values();
            $VALUES = logModeArr$values;
            $ENTRIES = EnumEntriesKt.a(logModeArr$values);
        }

        private LogMode(String str, int i5, int i11) {
        }

        @NotNull
        public static EnumEntries<LogMode> getEntries() {
            return $ENTRIES;
        }

        public static LogMode valueOf(String str) {
            return (LogMode) Enum.valueOf(LogMode.class, str);
        }

        public static LogMode[] values() {
            return (LogMode[]) $VALUES.clone();
        }
    }

    void debug(@NotNull String message);

    void error(@NotNull String message);

    @NotNull
    LogMode getLogMode();

    void info(@NotNull String message);

    void setLogMode(@NotNull LogMode logMode);

    void warn(@NotNull String message);
}
