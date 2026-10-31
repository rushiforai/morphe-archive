package com.amplitude.common.android;

import android.util.Log;
import com.amplitude.common.Logger;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0006\u0018\u0000 \u00112\u00020\u0001:\u0001\u0011B\u0005¢\u0006\u0002\u0010\u0002J\u0010\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\nH\u0016J\u0010\u0010\u000e\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\nH\u0016J\u0010\u0010\u000f\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\nH\u0016J\u0010\u0010\u0010\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\nH\u0016R\u001a\u0010\u0003\u001a\u00020\u0004X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\nX\u0082D¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Lcom/amplitude/common/android/LogcatLogger;", "Lcom/amplitude/common/Logger;", "()V", "logMode", "Lcom/amplitude/common/Logger$LogMode;", "getLogMode", "()Lcom/amplitude/common/Logger$LogMode;", "setLogMode", "(Lcom/amplitude/common/Logger$LogMode;)V", "tag", b.f42142b, "debug", b.f42142b, PglCryptUtils.KEY_MESSAGE, "error", "info", "warn", k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class LogcatLogger implements Logger {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final LogcatLogger logger = new LogcatLogger();

    @NotNull
    private Logger.LogMode logMode = Logger.LogMode.INFO;

    @NotNull
    private final String tag = "Amplitude";

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Lcom/amplitude/common/android/LogcatLogger$Companion;", b.f42142b, "()V", "logger", "Lcom/amplitude/common/android/LogcatLogger;", "getLogger", "()Lcom/amplitude/common/android/LogcatLogger;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final LogcatLogger getLogger() {
            return LogcatLogger.logger;
        }

        private Companion() {
        }
    }

    @Override // com.amplitude.common.Logger
    public void debug(@NotNull String message) {
        Intrinsics.g(message, "message");
        getLogMode().compareTo(Logger.LogMode.DEBUG);
    }

    @Override // com.amplitude.common.Logger
    public void error(@NotNull String message) {
        Intrinsics.g(message, "message");
        if (getLogMode().compareTo(Logger.LogMode.ERROR) <= 0) {
            Log.e(this.tag, message);
        }
    }

    @Override // com.amplitude.common.Logger
    @NotNull
    public Logger.LogMode getLogMode() {
        return this.logMode;
    }

    @Override // com.amplitude.common.Logger
    public void info(@NotNull String message) {
        Intrinsics.g(message, "message");
        if (getLogMode().compareTo(Logger.LogMode.INFO) <= 0) {
            Log.i(this.tag, message);
        }
    }

    @Override // com.amplitude.common.Logger
    public void setLogMode(@NotNull Logger.LogMode logMode) {
        Intrinsics.g(logMode, "<set-?>");
        this.logMode = logMode;
    }

    @Override // com.amplitude.common.Logger
    public void warn(@NotNull String message) {
        Intrinsics.g(message, "message");
        if (getLogMode().compareTo(Logger.LogMode.WARN) <= 0) {
            Log.w(this.tag, message);
        }
    }
}
