package com.moloco.sdk.internal.error.crash.filters;

import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.k;

@SourceDebugExtension
/* loaded from: classes.dex */
public final class b implements a {

    /* renamed from: b, reason: collision with root package name */
    public static final int f36396b = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f36397a = "MolocoSDKExceptionFilter";

    @Override // com.moloco.sdk.internal.error.crash.filters.a
    public boolean a(@NotNull Throwable crash) {
        Intrinsics.g(crash, "crash");
        StackTraceElement[] stackTrace = crash.getStackTrace();
        Intrinsics.f(stackTrace, "getStackTrace(...)");
        for (StackTraceElement stackTraceElement : stackTrace) {
            String className = stackTraceElement.getClassName();
            Intrinsics.f(className, "getClassName(...)");
            if (k.K0(className, "com.moloco.sdk", false)) {
                MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f36397a, "SDK detected in stacktrace", null, false, 12, null);
                return true;
            }
        }
        Throwable cause = crash.getCause();
        if (cause != null) {
            StackTraceElement[] stackTrace2 = cause.getStackTrace();
            Intrinsics.f(stackTrace2, "getStackTrace(...)");
            for (StackTraceElement stackTraceElement2 : stackTrace2) {
                String className2 = stackTraceElement2.getClassName();
                Intrinsics.f(className2, "getClassName(...)");
                if (k.K0(className2, "com.moloco.sdk", false)) {
                    MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f36397a, "SDK detected in stacktrace", null, false, 12, null);
                    return true;
                }
            }
        }
        return false;
    }
}
