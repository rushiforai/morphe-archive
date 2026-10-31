package com.fyber.inneractive.sdk.util;

import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.KotlinVersion;
import kotlin.jvm.JvmStatic;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public final class i1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final i1 f31193a = new i1();

    /* renamed from: b, reason: collision with root package name */
    private static final String f31194b = IAlog.a(i1.class);

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    private static final AtomicBoolean f31195c = new AtomicBoolean(false);

    private i1() {
    }

    @JvmStatic
    public static final void a() throws Throwable {
        if (f31195c.compareAndSet(false, true)) {
            IAlog.c(b.c0.q(new StringBuilder(), f31194b, "SDK integration health check — Kotlin runtime %s"), KotlinVersion.f71674e.toString());
        }
    }

    private static /* synthetic */ void b() {
    }
}
