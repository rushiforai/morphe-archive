package com.moloco.sdk.internal;

import com.moloco.sdk.service_locator.a;
import kotlin.Lazy;
import kotlin.LazyKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class A {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f36195a = LazyKt.a(new com.instabridge.ai.tools.a(7));

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final String f36196b = "[ERROR_CODE]";

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final String f36197c = "[HAPPENED_AT_TS]";

    public static final z a() {
        return new z(a.i.f38316a.c());
    }

    @NotNull
    public static final y b() {
        return c();
    }

    public static final z c() {
        return (z) f36195a.getValue();
    }
}
