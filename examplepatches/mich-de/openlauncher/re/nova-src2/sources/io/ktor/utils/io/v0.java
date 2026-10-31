package io.ktor.utils.io;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v0 implements t70.j0 {

    /* renamed from: a, reason: collision with root package name */
    public final t f66666a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f66667b;

    public v0(t tVar, CoroutineContext coroutineContext) {
        Intrinsics.g(coroutineContext, "coroutineContext");
        this.f66666a = tVar;
        this.f66667b = coroutineContext;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f66667b;
    }
}
