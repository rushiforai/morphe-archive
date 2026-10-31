package com.moloco.sdk.internal.utils;

import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final String f38208a = "[ERROR_CODE]";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final String f38209b = "[HAPPENED_AT_TS]";

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final String f38210c = "[SECONDS_LEFT]";

    @NotNull
    public static final String a(@NotNull String str, @NotNull String errorCode) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(errorCode, "errorCode");
        return j.F0(str, "[ERROR_CODE]", errorCode, false);
    }

    @NotNull
    public static final String b(@NotNull String str, @Nullable String str2) {
        Intrinsics.g(str, "<this>");
        return str2 != null ? j.F0(str, "[MTID]", str2, false) : str;
    }

    @NotNull
    public static final String a(@NotNull String str, long j11) {
        Intrinsics.g(str, "<this>");
        return j.F0(str, "[HAPPENED_AT_TS]", String.valueOf(j11), false);
    }

    @NotNull
    public static final String a(@NotNull String str, @NotNull String errorCode, long j11) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(errorCode, "errorCode");
        return a(a(str, errorCode), j11);
    }

    @NotNull
    public static final String a(@NotNull String substituteCountDownTimeLeftMacro, int i5) {
        Intrinsics.g(substituteCountDownTimeLeftMacro, "$this$substituteCountDownTimeLeftMacro");
        return j.F0(substituteCountDownTimeLeftMacro, f38210c, Integer.toUnsignedString(i5), false);
    }
}
