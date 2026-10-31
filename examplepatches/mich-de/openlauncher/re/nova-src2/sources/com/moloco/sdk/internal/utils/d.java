package com.moloco.sdk.internal.utils;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class d implements CoroutineContext.Key<c> {

    /* renamed from: b, reason: collision with root package name */
    public static final int f38213b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final c80.a f38214a;

    public d(@NotNull c80.a mutex) {
        Intrinsics.g(mutex, "mutex");
        this.f38214a = mutex;
    }

    @NotNull
    public final c80.a a() {
        return this.f38214a;
    }

    @NotNull
    public final c80.a b() {
        return this.f38214a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f38214a, ((d) obj).f38214a);
    }

    public int hashCode() {
        return this.f38214a.hashCode();
    }

    @NotNull
    public String toString() {
        return "ReentrantMutexContextKey(mutex=" + this.f38214a + ')';
    }

    @NotNull
    public final d a(@NotNull c80.a mutex) {
        Intrinsics.g(mutex, "mutex");
        return new d(mutex);
    }

    public static /* synthetic */ d a(d dVar, c80.a aVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            aVar = dVar.f38214a;
        }
        return dVar.a(aVar);
    }
}
