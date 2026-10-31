package com.moloco.sdk.xenoss.sdkdevkit.android.core;

import kotlin.Lazy;
import kotlin.LazyKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f42141a = LazyKt.a(new com.moloco.sdk.service_locator.b(19));

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final String f42142b = "";

    public static final c a() {
        return new c();
    }

    @NotNull
    public static final UserAgentService b() {
        return c();
    }

    public static final c c() {
        return (c) f42141a.getValue();
    }
}
