package com.amplitude.android.utilities;

import com.amplitude.common.Logger;
import com.amplitude.common.android.LogcatLogger;
import com.amplitude.core.Amplitude;
import com.amplitude.core.LoggerProvider;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\nH\u0016R\u001b\u0010\u0003\u001a\u00020\u00048BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u0007\u0010\b\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u000b"}, d2 = {"Lcom/amplitude/android/utilities/AndroidLoggerProvider;", "Lcom/amplitude/core/LoggerProvider;", "()V", "logger", "Lcom/amplitude/common/Logger;", "getLogger", "()Lcom/amplitude/common/Logger;", "logger$delegate", "Lkotlin/Lazy;", "amplitude", "Lcom/amplitude/core/Amplitude;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AndroidLoggerProvider implements LoggerProvider {

    /* renamed from: logger$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy logger = LazyKt.a(new Function0<LogcatLogger>() { // from class: com.amplitude.android.utilities.AndroidLoggerProvider$logger$2
        @Override // kotlin.jvm.functions.Function0
        @NotNull
        public final LogcatLogger invoke() {
            return new LogcatLogger();
        }
    });

    private final Logger getLogger() {
        return (Logger) this.logger.getValue();
    }

    @Override // com.amplitude.core.LoggerProvider
    @NotNull
    public Logger getLogger(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "amplitude");
        return getLogger();
    }
}
