package io.branch.search.internal;

import android.app.Application;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.pd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3321pd implements InterfaceC3304od {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.c0 f65486a;

    /* renamed from: io.branch.search.internal.pd$a */
    public static final class a {
    }

    public C3321pd(@NotNull t70.c0 ioDispatcher) {
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        this.f65486a = ioDispatcher;
    }

    @Override // io.branch.search.internal.InterfaceC3304od
    public final void a(@NotNull Application context, @NotNull t70.j0 coroutineScope) {
        Intrinsics.g(context, "context");
        Intrinsics.g(coroutineScope, "coroutineScope");
        t70.m0.t(coroutineScope, null, null, new C3338qd(this, context, null), 3);
    }
}
