package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.TimeZone;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class L {
    public static final long a() {
        return System.currentTimeMillis();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v8, types: [java.text.DateFormat, java.text.SimpleDateFormat] */
    @Nullable
    public static final SimpleDateFormat a(@NotNull String pattern, @NotNull TimeZone timeZone) {
        Result.Failure failureA;
        Intrinsics.g(pattern, "pattern");
        Intrinsics.g(timeZone, "timeZone");
        try {
            int i5 = Result.f71687b;
            ?? simpleDateFormat = new SimpleDateFormat(pattern, Locale.ROOT);
            simpleDateFormat.setTimeZone(timeZone);
            failureA = simpleDateFormat;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            failureA = ResultKt.a(th2);
        }
        boolean z11 = failureA instanceof Result.Failure;
        Object obj = failureA;
        if (z11) {
            obj = null;
        }
        return (SimpleDateFormat) obj;
    }

    public static /* synthetic */ SimpleDateFormat a(String str, TimeZone timeZone, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            timeZone = TimeZone.getTimeZone("UTC");
        }
        return a(str, timeZone);
    }
}
