package io.branch.search.internal;

import android.content.Context;
import android.content.SharedPreferences;
import io.branch.search.internal.Y2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Nd {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f62990a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.c0 f62991b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f62992c;

    public static final class a {
    }

    public Nd(@NotNull F4 contextDelegate, @NotNull t70.c0 ioDispatcher) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        this.f62990a = contextDelegate;
        this.f62991b = ioDispatcher;
        Y2.a aVar = Y2.Companion;
        Context contextB = contextDelegate.b();
        Y2.b bVar = Y2.b.BranchConfigurationCache;
        aVar.getClass();
        this.f62992c = Y2.a.a(contextB, bVar);
    }
}
